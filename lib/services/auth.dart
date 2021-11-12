import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insight/pages/bottomnav.dart';
import 'package:insight/services/database.dart';
import 'package:insight/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final authResult = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );

        User userDetails = authResult.user!;

        if (authResult != null) {
          print('1');
          SharedPreferenceHelper().saveUserEmail(userDetails.email!);
          SharedPreferenceHelper().saveUserId(userDetails.uid);
          SharedPreferenceHelper()
              .saveUserName(userDetails.email!.replaceAll("@gmail.com", ""));
          SharedPreferenceHelper().saveDisplayName(userDetails.displayName!);
          SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL!);

          Map<String, dynamic> userInfoMap = {
            "email": userDetails.email,
            "username": userDetails.email!.replaceAll("@gmail.com", ""),
            "name": userDetails.displayName,
            "imgUrl": userDetails.photoURL
          };
          print('2');
          DatabaseMethods()
              .addUserInfoToDB(userDetails.uid, userInfoMap)
              .then((value) {
            print('3');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => BottomBar()));
          });
        }
      }
    }
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await auth.signOut();
  }
}
