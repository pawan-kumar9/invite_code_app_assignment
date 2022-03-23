//ignore_for_file:prefer_const_constructors,prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:invite_code_app/invite_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InvitePage1()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ),
                Text(
                  "Please provide your number",
                  style: TextStyle(fontSize: 22, letterSpacing: 1.7),
                ),
                IntlPhoneField(
                  textAlign: TextAlign.center,
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                    hintText: "9553976683",
                    labelStyle: TextStyle(fontSize: 15, letterSpacing: 2),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialCountryCode: 'IN',
                ),
                Text(
                  "We will send an OTP to verify this number",
                  style: TextStyle(fontSize: 16, color: Colors.white38),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                ),
                Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text("   Or   "),
                  Expanded(child: Divider()),
                ]),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade900),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              left: 30, right: 30, top: 15, bottom: 15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: Colors.green, width: 2.0)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/images/g1.svg",
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 20, letterSpacing: 1.5),
                      )
                    ],
                  ),
                )
              ]))
    ]));
  }
}
