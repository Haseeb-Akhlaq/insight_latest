import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insight/constants/colors.dart';

class Health extends StatefulWidget {
  Health({Key? key}) : super(key: key);

  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  TextEditingController userhappyeditingController =
      new TextEditingController();
  TextEditingController usermotivatededitingController =
      new TextEditingController();
  TextEditingController usersocialeditingController =
      new TextEditingController();
  TextEditingController usercreativeeditingController =
      new TextEditingController();

  bool happinessOk = true;
  bool motivatedOk = true;
  bool socialOk = true;
  bool creativeOk = true;

  double average = 0;

  calculateAverage() {
    int total = int.parse(userhappyeditingController.text != ""
            ? userhappyeditingController.text
            : "0") +
        int.parse(usermotivatededitingController.text != ""
            ? usermotivatededitingController.text
            : "0") +
        int.parse(usersocialeditingController.text != ""
            ? usersocialeditingController.text
            : "0") +
        int.parse(usercreativeeditingController.text != ""
            ? usercreativeeditingController.text
            : "0");

    setState(() {
      average = total / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 42,
                          width: 44,
                          child: SvgPicture.asset(
                            'assets/images/lo.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 15),
                        AutoSizeText(
                          'Mental Health Assessment',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'pop-med',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  "Rate Yourself out of 10",
                  style: TextStyle(fontSize: 16, fontFamily: 'pop-med'),
                ),
                SizedBox(
                  height: 30.0,
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
                          "Happiness",
                          style: TextStyle(
                            fontFamily: 'pop-medium',
                            fontSize: 18.0,
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
                            controller: userhappyeditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
                            onChanged: (v) {
                              if (v.isEmpty) {
                                calculateAverage();
                                return;
                              }

                              if (double.parse(v) > 10) {
                                setState(() {
                                  happinessOk = false;
                                });
                              } else {
                                setState(() {
                                  happinessOk = true;
                                });
                                calculateAverage();
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                border: InputBorder.none,
                                hintText: "00",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                        ),
                        if (!happinessOk)
                          Text(
                            '     Max Number 10',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Motivated",
                          style: TextStyle(
                            fontFamily: 'pop-medium',
                            fontSize: 18.0,
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
                            controller: usermotivatededitingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
                            onChanged: (v) {
                              if (v.isEmpty) {
                                calculateAverage();
                                return;
                              }

                              if (double.parse(v) > 10) {
                                setState(() {
                                  motivatedOk = false;
                                });
                              } else {
                                setState(() {
                                  motivatedOk = true;
                                });
                                calculateAverage();
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                border: InputBorder.none,
                                hintText: "00",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                        ),
                        if (!motivatedOk)
                          Text(
                            '     Max Number 10',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Social",
                          style: TextStyle(
                            fontFamily: 'pop-medium',
                            fontSize: 18.0,
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
                            controller: usersocialeditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
                            onChanged: (v) {
                              if (v.isEmpty) {
                                calculateAverage();
                                return;
                              }

                              if (double.parse(v) > 10) {
                                setState(() {
                                  socialOk = false;
                                });
                              } else {
                                setState(() {
                                  socialOk = true;
                                });
                                calculateAverage();
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                border: InputBorder.none,
                                hintText: "00",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                        ),
                        if (!socialOk)
                          Text(
                            '     Max Number 10',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Creative",
                          style: TextStyle(
                            fontFamily: 'pop-medium',
                            fontSize: 18.0,
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
                            controller: usercreativeeditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
                            onChanged: (v) {
                              if (v.isEmpty) {
                                calculateAverage();
                                return;
                              }

                              if (double.parse(v) > 10) {
                                setState(() {
                                  creativeOk = false;
                                });
                              } else {
                                setState(() {
                                  creativeOk = true;
                                });
                                calculateAverage();
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                border: InputBorder.none,
                                hintText: "00",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                        ),
                        if (!creativeOk)
                          Text(
                            '     Max Number 10',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      color: AppColors.purple,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Text(
                                    '$average' + "/10",
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
