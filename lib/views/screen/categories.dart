import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/globals.dart';



class CategoriyPage extends StatefulWidget {
  const CategoriyPage({Key? key}) : super(key: key);

  @override
  State<CategoriyPage> createState() => _CategoriyPageState();
}

class _CategoriyPageState extends State<CategoriyPage> {
  List<Category> category = [
    Category(category: 'bussiness', title: 'Enterpreneur'),
    Category(category: 'sports', title: 'Sports'),
    Category(category: 'wisdom', title: 'Wisdom'),
    Category(category: 'love', title: 'Love'),
    Category(category: 'motivational', title: 'Motivational'),
    Category(category: 'life', title: 'Life'),
    Category(category: 'friendship', title: 'Friendship'),
    Category(category: 'history', title: 'History'),
    Category(category: 'politics', title: 'Politics'),
    Category(category: 'humor', title: 'Humor'),
    Category(category: 'inspirational', title: 'Inspirational'),
  ];

  List<Category> author = [
    Category(category: 'chanakya', title: 'Chanakya'),
    Category(category: 'abraham_lincoln', title: 'Abraham Lincoln'),
    Category(category: 'aristotle', title: 'Aristotle'),
    Category(category: 'elon_musk', title: 'Elon Musk'),
    Category(category: 'albert_einstein', title: 'Albert Einstein'),
    Category(category: 'barack_obama', title: 'Barack Obama'),
    Category(category: 'donald_trump', title: 'Donald Trump'),
    Category(category: 'muhammad_ali', title: 'Muhammad Ali'),
    Category(category: 'a_p_j_abdul_kalam', title: 'APJ Abdul Kalam'),
  ];

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${res.title}",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.back, color: Colors.black)),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: (res.isAuthorCat) ? author.length : category.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () async {
              Arguments args = Arguments(
                title:
                    (res.isAuthorCat) ? author[i].title : category[i].title,
                name: (res.isAuthorCat)
                    ? author[i].category
                    : category[i].category,
                isAuthCat: res.isAuthorCat,
              );

              Navigator.of(context).pushNamed('quotes_page', arguments: args);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: Text(
                          (res.isAuthorCat)
                              ? author[i].title.substring(0, 2)
                              : category[i].title.substring(0, 2),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        (res.isAuthorCat)
                            ? author[i].title
                            : category[i].title,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
