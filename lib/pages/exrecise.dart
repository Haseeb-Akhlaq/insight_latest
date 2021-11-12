import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/constants/colors.dart';
import 'package:insight/pages/health.dart';
import 'package:insight/widgets/top_bar.dart';

class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  TextEditingController usercalorieseditingController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(title: "Home"),
                SizedBox(height: 25),
                Text(
                  "Calories Burnt",
                  style: TextStyle(fontSize: 18, fontFamily: 'pop-med'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 10,
                        blurRadius: 10,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Enter Calories Burnt",
                          style: TextStyle(
                            fontFamily: 'pop-medium',
                            fontSize: 16.0,
                            color: AppColors.text,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(24)),
                          child: (TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            controller: usercalorieseditingController,
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                border: InputBorder.none,
                                hintText: "000",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Health()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
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
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
