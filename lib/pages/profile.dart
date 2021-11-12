import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insight/constants/colors.dart';
import 'package:insight/pages/landing_screen.dart';
import 'package:insight/services/database.dart';
import 'package:insight/services/shared_pref.dart';
import 'package:insight/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? profilePicUrl = "",
      name = "",
      id = "",
      username = "",
      address = "",
      phone = "",
      email = "";
  getMyInfoFromSharedPreference() async {
    username = await SharedPreferenceHelper().getUserName();
  }

  getThisUserInfo() async {
    await getMyInfoFromSharedPreference();
    QuerySnapshot querySnapshot =
        await DatabaseMethods().getUserInfo(username!);
    print(
        "something bla bla ${querySnapshot.docs[0].id} ${querySnapshot.docs[0]["name"]}");

    name = "${querySnapshot.docs[0]["name"]}";
    id = "${querySnapshot.docs[0].id}";
    profilePicUrl = "${querySnapshot.docs[0]["imgUrl"]}";
    address = "${querySnapshot.docs[0]["username"]}";
    email = "${querySnapshot.docs[0]["email"]}";
    setState(() {});
  }

  @override
  void initState() {
    getThisUserInfo();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: <Widget>[
                  TopBar(title: 'Profile'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  GoogleSignIn().signOut();
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LandingScreen(),
                                      ),
                                      (Route<dynamic> route) => false);
                                },
                                child: Icon(
                                  Icons.logout,
                                  color: AppColors.purple,
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              child: Image.network(
                                profilePicUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            name!,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'pop-med',
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: AppColors.purple,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  email!,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance,
                                color: AppColors.purple,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  address!,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Created By',
                    style: TextStyle(
                      fontFamily: 'pop-med',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var url =
                          'https://www.instagram.com/zuka_kherodinashvili/';

                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          universalLinksOnly: true,
                        );
                      } else {
                        throw 'There was a problem to open the url: $url';
                      }
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
                            "Visit on Instagram",
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
      ),
    );
  }
}
