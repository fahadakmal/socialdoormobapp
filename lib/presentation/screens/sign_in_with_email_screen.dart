import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialdoormobile/constants/images.dart';
import 'package:socialdoormobile/constants/route_constants.dart';
import 'package:socialdoormobile/constants/style.dart';
import 'package:socialdoormobile/cubit/user_cubit.dart';
import 'package:toast/toast.dart';
import '../../constants/language.dart';
import '../widgets/login_fresh_loading.dart';

class LoginWithUserEmailScreen extends StatefulWidget {
  LoginWithUserEmailScreen();

  @override
  _LoginWithUserEmailScreenState createState() =>
      _LoginWithUserEmailScreenState();
}

class _LoginWithUserEmailScreenState extends State<LoginWithUserEmailScreen> {
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  TextEditingController _textEditingControllerUser = TextEditingController();

  bool isNoVisiblePassword = true;

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
            this.loginFreshWords.login,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            Toast.show(state.error, context,
                duration: Toast.LENGTH_SHORT,
                gravity: Toast.CENTER,
                backgroundColor: Colors.red);
            _textEditingControllerPassword.text = '';
            _textEditingControllerUser.text = '';
          } else if (state is LoginSuccess) {
            Toast.show('Successfully logged in', context,
                duration: Toast.LENGTH_SHORT,
                gravity: Toast.CENTER,
                backgroundColor: Colors.green);
            Navigator.popAndPushNamed(context, HOME_SCREEN_ROUTE);
          }
        },
        child: Stack(children: <Widget>[
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
                            Images.loginBackgroundImage,
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
              )),
        ]),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      controller: this._textEditingControllerUser,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Style.TEXT_COLOR, fontSize: 14),
                      autofocus: false,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/logos/icon_user.png",
                              package: 'logos',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xFFAAB5C3))),
                          filled: true,
                          fillColor: Color(0xFFF3F3F5),
                          focusColor: Color(0xFFF3F3F5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xFFAAB5C3))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Style.PRIMARY__COLOR)),
                          hintText: this.loginFreshWords.hintLoginUser)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextField(
                      focusNode: focus,
                      controller: this._textEditingControllerPassword,
                      obscureText: this.isNoVisiblePassword,
                      style: TextStyle(color: Style.TEXT_COLOR, fontSize: 14),
                      onSubmitted: (value) {
                        // widget.callLogin(
                        //     context,
                        //     setIsRequest,
                        //     this._textEditingControllerUser.text,
                        //     this._textEditingControllerPassword.text);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/logos/icon_password.png",
                              package: 'logos',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (this.isNoVisiblePassword)
                                    this.isNoVisiblePassword = false;
                                  else
                                    this.isNoVisiblePassword = true;
                                });
                              },
                              child: (this.isNoVisiblePassword)
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/logos/icon_eye_close.png",
                                        package: 'logos',
                                        width: 15,
                                        height: 15,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/logos/icon_eye_open.png",
                                        package: 'logos',
                                        width: 15,
                                        height: 15,
                                      ),
                                    )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xFFAAB5C3))),
                          filled: true,
                          fillColor: Color(0xFFF3F3F5),
                          focusColor: Color(0xFFF3F3F5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xFFAAB5C3))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Style.PRIMARY__COLOR)),
                          hintText: this.loginFreshWords.hintLoginPassword)),
                ),

                //  Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: LoadingLoginFresh(
                //       textLoading: this.loginFreshWords.textLoading,
                //       colorText: widget.textColor,
                //       backgroundColor: widget.backgroundColor,
                //       elevation: 0,
                //     ),
                //   )
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is LoginInProcess) {
                      return CircularProgressIndicator();
                    }
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<UserCubit>(context).login(
                            this._textEditingControllerUser.text,
                            this._textEditingControllerPassword.text);
                      },
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
                                  this.loginFreshWords.login,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ))),
                    );
                  },
                ),

                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: '',
                            style: TextStyle(
                                color: Style.TEXT_COLOR,
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                        TextSpan(
                            text: this.loginFreshWords.recoverPassword,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Style.TEXT_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ]),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, FORGET_PASSWORD_ROUTE);
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: this.loginFreshWords.notAccount + ' \n',
                            style: TextStyle(
                                color: Style.PRIMARY__COLOR,
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                        TextSpan(
                            text: this.loginFreshWords.signUp,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Style.PRIMARY__COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ]),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SIGNUP_USER_ROUTE);
                  },
                ),
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: (widget.isFooter == null || widget.isFooter == false)
        //       ? SizedBox()
        //       : widget.widgetFooter,
        // ),
      ],
    );
  }
}
