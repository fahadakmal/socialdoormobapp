import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toast/toast.dart';

import '../../constants/images.dart';
import '../../constants/language.dart';
import '../../constants/style.dart';
import '../../cubit/user_cubit.dart';
import '../../data/models/sign_up_model.dart';

class ConfirmUserScreen extends StatefulWidget {
  SignUpModel signUpModel;

  ConfirmUserScreen({this.signUpModel});

  @override
  _ConfirmUserScreenState createState() => _ConfirmUserScreenState();
}

class _ConfirmUserScreenState extends State<ConfirmUserScreen> {
  // ignore: close_sinks
  TextEditingController _textEditingControllerUser = TextEditingController();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  final focus = FocusNode();
  ConstantWords loginFreshWords;

  @override
  Widget build(BuildContext context) {
    loginFreshWords = ConstantWords();

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Style.PRIMARY__COLOR,
            centerTitle: true,
            elevation: 0,
            title: Text(
              this.loginFreshWords.confirm_user,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
        body: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Toast.show('You successfully registered', context,
                  duration: 2,
                  gravity: Toast.CENTER,
                  backgroundColor: Colors.green);
              Timer(Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            } else if (state is UserConfmationError) {
              Toast.show(state.error, context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.CENTER,
                  backgroundColor: Colors.red);
            }
          },
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: Style.PRIMARY__COLOR,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 3),
                            child: Hero(
                              tag: 'hero-login',
                              child: Image.network(
                                Images.signUpBackgroudImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                      color: Color(0xFFF3F3F5),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(50.0),
                        topRight: const Radius.circular(50.0),
                      )),
                  child: buildBody(),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                loginFreshWords.messageRecoverPassword,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Style.TEXT_COLOR, fontSize: 14),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //       controller: this._textEditingControllerUser,
            //       keyboardType: TextInputType.emailAddress,
            //       style: TextStyle(
            //           color: widget.textColor ?? Color(0xFF0F2E48),
            //           fontSize: 14),
            //       autofocus: false,
            //       onSubmitted: (v) {
            //         FocusScope.of(context).requestFocus(focus);
            //       },
            //       decoration: InputDecoration(
            //           prefixIcon: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Image.asset(
            //               "assets/images_login_fresh_34_/icon_user.png",
            //               package: 'login_fresh',
            //               width: 15,
            //               height: 15,
            //             ),
            //           ),
            //           enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(25),
            //               borderSide: BorderSide(color: Color(0xFFAAB5C3))),
            //           filled: true,
            //           fillColor: Color(0xFFF3F3F5),
            //           focusColor: Color(0xFFF3F3F5),
            //           focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(25),
            //               borderSide: BorderSide(color: Color(0xFFAAB5C3))),
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(25),
            //               borderSide: BorderSide(
            //                   color:
            //                       widget.backgroundColor ?? Color(0xFFE7004C))),
            //           hintText: this.loginFreshWords.hintLoginUser)),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      backgroundColor: Colors.white,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 6) {
                          return "you must be entered 6 digits";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor:
                            hasError ? Colors.blue.shade100 : Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      // enableActiveFill: true,
                      controller: _textEditingControllerUser,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
            ),

            // ? Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: LoadingLoginFresh(
            //       textLoading: this.loginFreshWords.textLoading,
            //       colorText: Style.TEXT_COLOR,
            //       backgroundColor: Style.PRIMARY__COLOR,
            //       elevation: 0,
            //     ),
            //   )
            // :
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserConfirmationInProcess) {
                  return CircularProgressIndicator();
                }
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focus);

                    BlocProvider.of<UserCubit>(context).confirmUser(
                        _textEditingControllerUser.text, widget.signUpModel);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            color: Style.PRIMARY__COLOR,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                  child: Text(
                                this.loginFreshWords.confirm_user,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                            ))),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(),
      ],
    );
  }
}
