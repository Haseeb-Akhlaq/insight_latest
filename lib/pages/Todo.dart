import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insight/constants/colors.dart';
import 'package:insight/pages/Addpage.dart';
import 'package:insight/services/database.dart';
import 'package:insight/services/shared_pref.dart';
import 'package:insight/widgets/top_bar.dart';

class Todo extends StatefulWidget {
  Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String? id = "";
  getMyInfoFromSharedPreference() async {
    id = await SharedPreferenceHelper().getUserId();
  }

  Widget Snacks() {
    return StreamBuilder(
      stream: userstream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.purple,
                            shape: RoundedRectangleBorder(),
                            side: BorderSide(
                              width: 2,
                              color: AppColors.purple,
                            ),
                            value: ds["late"],
                            onChanged: (bool? value) {
                              setState(() {
                                Map<String, dynamic> messageInfoMap = {
                                  "Note": ds["Note"],
                                  "id": ds["id"],
                                  "late": value!,
                                };
                                DatabaseMethods().updateLastNoteSend(
                                    ds["id"], messageInfoMap, id!);
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              ds["Note"],
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              DatabaseMethods().deleteNote(ds["id"], id!);
                            },
                            child: SvgPicture.asset(
                              'assets/images/delete.svg',
                              height: 22,
                              width: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
    userstream = await DatabaseMethods().getNote(id!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    doThisOnLaunch();
  }

  Stream? userstream;
  bool checkboxvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TopBar(title: "To-do List"),
              SizedBox(height: 20),
              Expanded(child: Snacks()),
            ],
          ),
        ),
      ),
    );
  }
}
