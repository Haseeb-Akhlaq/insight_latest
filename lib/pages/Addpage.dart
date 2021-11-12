import 'package:flutter/material.dart';
import 'package:insight/services/database.dart';
import 'package:insight/services/shared_pref.dart';
import 'package:random_string/random_string.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? id = "";
  getMyInfoFromSharedPreference() async {
    id = await SharedPreferenceHelper().getUserId();
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  String messageId = "";
  TextEditingController usertodoeditingcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70.0,
            ),
            Text(
              "Enter the Work ToDo",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: 1, style: BorderStyle.solid),
                ),
                child: TextField(
                  maxLength: 150,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  controller: usertodoeditingcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    border: InputBorder.none,
                    hintText: "Enter your Todo work",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (usertodoeditingcontroller.text.isEmpty) {
                  return;
                }

                if (messageId == "") {
                  messageId = randomAlphaNumeric(12);
                }
                Map<String, dynamic> userorderInfoMap = {
                  "Note": usertodoeditingcontroller.text,
                  "late": false,
                  "id": messageId,
                };
                DatabaseMethods()
                    .addNote(userorderInfoMap, messageId, id!)
                    .then((value) => Navigator.pop(context));
                messageId = "";
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffA621B6),
                          Color(0xff671471),
                        ],
                      )),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
