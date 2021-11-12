import 'package:flutter/material.dart';
import 'package:insight/pages/signup.dart';
import 'package:insight/services/auth.dart';

import 'bottomnav.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthMethods().getCurrentUser(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return BottomBar();
        } else {
          return SignUp();
        }
      },
    );
  }
}
