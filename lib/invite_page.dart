//ignore_for_file: avoid_unnecessary_containers,prefer_const_constructors,prefer_const_literals_to_create_immutables,unnecessary_new,sized_box_for_whitespace,unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invite_code_app/signup.dart';

class InvitePage1 extends StatefulWidget {
  const InvitePage1({Key? key}) : super(key: key);

  @override
  State<InvitePage1> createState() => _InvitePage1State();
}

class _InvitePage1State extends State<InvitePage1> {
  bool code = true;
  String correctCode = "12345";
  final myController = TextEditingController();

  Future<bool> getData(String invitee) async {
    var collection = FirebaseFirestore.instance.collection("invite_codes");
    var docSnapshot = await collection.doc("codes").get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      List ucode = data!["code_array"];
      for (int i = 0; i < ucode.length; i++) {
        if (ucode[i] == invitee) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
                  Text(""),
                  Text(
                    "Continue with Invite Code",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 5,
                    controller: myController,
                    onChanged: (_) {
                      setState(() {
                        code = true;
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0)),
                        fillColor: Colors.yellow,
                        hintText: "Add Invite Code"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      bool flag = await getData(myController.text.toString());
                      if (flag == false) {
                        setState(() {
                          code = false;
                        });
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                  ),
                  Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "No Invite Code?",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("If you want an invite code and get early access"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Please fill out"),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                " this form",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ])),
        Visibility(
          visible: (code == true) ? false : true,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.red,
              child: Center(
                  child: Text(
                "Invalid Code. Please try again.",
                style: TextStyle(fontSize: 16),
              )),
            ),
          ),
        )
      ]),
    );
  }
}
