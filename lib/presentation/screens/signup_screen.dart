import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/images.dart';
import '../../constants/language.dart';
import '../../constants/route_constants.dart';
import '../../cubit/user_cubit.dart';
import '../../data/models/sign_up_model.dart';
import 'package:toast/toast.dart';
import '../widgets/login_fresh_loading.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropdownValue = 'Please Select';
  FocusNode focusNode = new FocusNode();
  SignUpModel signUpModel = SignUpModel();

  bool isNoVisiblePassword = true;
  DateTime now = new DateTime.now();
  String textForDatePicker = 'Select Birth Date';

  ConstantWords constantWords;

  @override
  Widget build(BuildContext context) {
    constantWords = ConstantWords();

    return Scaffold(
        appBar: _signUpAppBar(),
        body: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              Toast.show(state.successMessage, context,
                  duration: 2,
                  gravity: Toast.CENTER,
                  backgroundColor: Colors.green);
              Timer(Duration(seconds: 2), () {
                Navigator.popAndPushNamed(context, CONFIRM_USER_ROUTE,
                    arguments: signUpModel);
              });
            } else if (state is SignUpError) {
              Toast.show(state.error, context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.CENTER,
                  backgroundColor: Colors.red);
            }
          },
          child: GestureDetector(
            child: _signUpBody(context),
            onTap: () {
              focusMethod(context);
            },
          ),
        ));
  }

  void focusMethod(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Widget _signUpBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
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
        ),
      ],
    );
  }

  Widget buildBody() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, left: 20, right: 20, top: 20),
                    child: TextField(
                        onChanged: (String value) {
                          this.signUpModel.email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style:
                            TextStyle(color: Color(0xFF0F2E48), fontSize: 14),
                        autofocus: false,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            filled: true,
                            fillColor: Color(0xFFF3F3F5),
                            focusColor: Color(0xFFF3F3F5),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFE7004C))),
                            hintText: this.constantWords.hintLoginUser)),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextField(
                            onChanged: (String value) {
                              this.signUpModel.firstName = value;
                            },
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF0F2E48), fontSize: 14),
                            autofocus: false,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFAAB5C3))),
                                filled: true,
                                fillColor: Color(0xFFF3F3F5),
                                focusColor: Color(0xFFF3F3F5),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFAAB5C3))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFE7004C))),
                                hintText: this.constantWords.hintFirstName)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextField(
                            onChanged: (String value) {
                              this.signUpModel.lastName = value;
                            },
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF0F2E48), fontSize: 14),
                            autofocus: false,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFAAB5C3))),
                                filled: true,
                                fillColor: Color(0xFFF3F3F5),
                                focusColor: Color(0xFFF3F3F5),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFAAB5C3))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFE7004C))),
                                hintText: this.constantWords.hintLastName)),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextField(
                        onChanged: (String value) {
                          this.signUpModel.phone = value;
                        },
                        keyboardType: TextInputType.text,
                        style:
                            TextStyle(color: Color(0xFF0F2E48), fontSize: 14),
                        autofocus: false,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            filled: true,
                            fillColor: Color(0xFFF3F3F5),
                            focusColor: Color(0xFFF3F3F5),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFE7004C))),
                            hintText: this.constantWords.hintPhoneNumber)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFAAB5C3), // red as border color
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 20),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            // underline: Container(
                            //   height: 2,
                            //   color: Colors.deepPurpleAccent,
                            // ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                              if (dropdownValue == 'Male') {
                                this.signUpModel.gender = 1;
                              } else if (dropdownValue == 'Female') {
                                this.signUpModel.gender = 0;
                              } else if (dropdownValue == 'Other') {
                                this.signUpModel.gender = 2;
                              }
                              print(this.signUpModel.gender);
                            },
                            items: <String>[
                              'Please Select',
                              'Male',
                              'Female',
                              'Other'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFAAB5C3), // red as border color
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 20),
                          child: TextButton(
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    maxTime:
                                        DateTime(now.year, now.month, now.day),
                                    theme: DatePickerTheme(
                                        headerColor: Colors.white,
                                        backgroundColor: Colors.black,
                                        itemStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        doneStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16)), onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  var stDate = date.toString();
                                  var ddtate = stDate.split(" ")[0];
                                  this.signUpModel.dob = date;

                                  print(this.signUpModel.dob);
                                  setState(() {
                                    textForDatePicker = ddtate;
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: Text(
                                textForDatePicker,
                                style: TextStyle(color: Color(0xFFAAB5C3)),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: TextField(
                        onChanged: (String value) {
                          this.signUpModel.password = value;
                        },
                        obscureText: this.isNoVisiblePassword,
                        style:
                            TextStyle(color: Color(0xFF0F2E48), fontSize: 14),
                        decoration: InputDecoration(
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
                                          width: 15,
                                          height: 15,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/logos/icon_eye_open.png",
                                          width: 15,
                                          height: 15,
                                        ),
                                      )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            filled: true,
                            fillColor: Color(0xFFF3F3F5),
                            focusColor: Color(0xFFF3F3F5),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFE7004C))),
                            hintText: this.constantWords.hintLoginPassword)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: TextField(
                        onChanged: (String value) {
                          this.signUpModel.repeatPassword = value;
                        },
                        obscureText: this.isNoVisiblePassword,
                        style:
                            TextStyle(color: Color(0xFF0F2E48), fontSize: 14),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            filled: true,
                            fillColor: Color(0xFFF3F3F5),
                            focusColor: Color(0xFFF3F3F5),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFAAB5C3))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFFE7004C))),
                            hintText:
                                this.constantWords.hintSignUpRepeatPassword)),
                  )
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: LoadingLoginFresh(
          //     textLoading: this.constantWords.textLoading,
          //     colorText: Color(0xFF0F2E48),
          //     backgroundColor: Color(0xFFE7004C),
          //     elevation: 0,
          //   ),
          // ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is SignIningUp) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    focusMethod(context);
                    BlocProvider.of<UserCubit>(context).signUpUser(signUpModel);
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                                child: Text(
                              this.constantWords.signUp,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                          ))),
                );
              }
            },
          ),
        ]);
  }

  Widget _signUpAppBar() {
    return AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text(
          this.constantWords.signUp,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
