import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insight/Model/books.dart';
import 'package:insight/constants/colors.dart';
import 'package:insight/widgets/top_bar.dart';

class BookRandomizerScreen extends StatefulWidget {
  BookRandomizerScreen({Key? key}) : super(key: key);

  @override
  _BookRandomizerScreenState createState() => _BookRandomizerScreenState();
}

class _BookRandomizerScreenState extends State<BookRandomizerScreen> {
  final List<Book> allBooks = [];
  bool isLoading = false;

  int? bookIndex;

  randomGenerator() {
    Random random = new Random();
    int randomNumber = random.nextInt(allBooks.length);

    setState(() {
      bookIndex = randomNumber;
    });
  }

  getBooksNames() async {
    setState(() {
      isLoading = true;
    });

    final api =
        await FirebaseFirestore.instance.collection('api').doc('1').get();

    final apiUrl = api.data()!['url'];

    final response = await http.get(Uri.parse(apiUrl));

    print('jj');

    final res = jsonDecode(response.body);

    final List books = res['items'];

    books.forEach((element) {
      if (element['volumeInfo']['imageLinks'] == null) {
        allBooks.add(
          Book(
            title: element['volumeInfo']['title'],
            picture:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png',
          ),
        );
      } else {
        allBooks.add(
          Book(
            title: element['volumeInfo']['title'],
            picture: element['volumeInfo']['imageLinks']['thumbnail'],
          ),
        );
      }
    });

    randomGenerator();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getBooksNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.purple,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBar(title: "Book Randomizer"),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                allBooks[bookIndex!].title!,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'pop-med',
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff888686),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: Image.network(
                                  allBooks[bookIndex!].picture!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  randomGenerator();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xffA621B6),
                                              Color(0xff671471),
                                            ],
                                          )),
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Randomize",
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
