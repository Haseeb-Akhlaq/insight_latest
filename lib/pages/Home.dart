import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insight/constants/colors.dart';
import 'package:insight/pages/exrecise.dart';
import 'package:insight/widgets/top_bar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController userbreakfasteditingController =
      new TextEditingController();
  TextEditingController userluncheditingController =
      new TextEditingController();
  TextEditingController userdinnereditingController =
      new TextEditingController();
  TextEditingController usersnackseditingController =
      new TextEditingController();

  double totalCal = 0;

  calculateTotal() {
    double cal = double.parse(userbreakfasteditingController.text.isEmpty
            ? '0'
            : userbreakfasteditingController.text) +
        double.parse(userluncheditingController.text.isEmpty
            ? '0'
            : userluncheditingController.text) +
        double.parse(userdinnereditingController.text.isEmpty
            ? '0'
            : userdinnereditingController.text) +
        double.parse(usersnackseditingController.text.isEmpty
            ? '0'
            : usersnackseditingController.text);

    setState(() {
      totalCal = cal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(title: "Home"),
                SizedBox(height: 25),
                Text(
                  "Enter Your Calorie Consumed",
                  style: TextStyle(fontSize: 16, fontFamily: 'pop-med'),
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
                          "Breakfast",
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
                            controller: userbreakfasteditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
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
                        Text(
                          "Lunch",
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
                            controller: userluncheditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
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
                        Text(
                          "Dinner",
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
                            controller: userdinnereditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
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
                        Text(
                          "Snacks",
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
                            controller: usersnackseditingController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]")),
                            ],
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
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                calculateTotal();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffA621B6),
                                        Color(0xff671471),
                                      ],
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    'Calculate Total',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'pop-med',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              totalCal.toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'pop-med',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Exercise()));
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
