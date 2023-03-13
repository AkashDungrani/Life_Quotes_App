import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/drawer.dart';
import '../../models/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> CarouselQuotes = [
    {
      'image': "assets/images/i1.jpeg",
      'text':
          "Never let the fear of striking out keep you from playing the game.",
    },
    {
      'image': "assets/images/i2.jpeg",
      'text': "The only impossible journey is the one you never begin.",
    },
    {
      'image': "assets/images/i3.jpeg",
      'text': "Only a life lived for others is a life worthwhile.",
    },
    {
      'image': "assets/images/i4.jpeg",
      'text': "The purpose of our lives is to be happy.",
    },
    {
      'image': "assets/images/i5.jpeg",
      'text': "You only live once, but if you do it right, once is enough.",
    },
  ];

  int initialCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Life Quotes and Saying",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100, shape: BoxShape.circle),
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.amber.withOpacity(0.7),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Color(0xffFF4848),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100, shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.heart_fill,
                      size: 30,
                      color: Colors.red.withOpacity(0.7),
                    ),
                  ),
                
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15,
          right: 15,
          left: 15,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: initialCount,
                      clipBehavior: Clip.hardEdge,
                      onPageChanged: (i, _) {
                        setState(() {
                          initialCount = i;
                        });
                      },
                      height: MediaQuery.of(context).size.height * 0.25,
                      viewportFraction: 0.97,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: CarouselQuotes.map((e) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                    image: AssetImage(e['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${e['text']}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        CarouselQuotes.length,
                        (index) => dot(Index: index),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCategories(
                    context,
                    color: Colors.pink.shade800,
                    icon: Icons.category_outlined,
                    text: "Categories",
                    press: () {
                      CatOrAuthArgs args = CatOrAuthArgs(
                          title: "Categories", isAuthorCat: false);

                      Navigator.pushNamed(context, 'categories',
                          arguments: args);
                    },
                  ),
                  buildCategories(
                    context,
                    color: Colors.blueGrey.shade800,
                    icon: Icons.image_outlined,
                    text: "Pic Quotes",
                    press: () {
                      Arguments args = Arguments(
                          title: "Pic", isAuthCat: false, name: 'pic');

                      Navigator.pushNamed(context, 'quotes_page',
                          arguments: args);
                    },
                  ),
                  buildCategories(
                    context,
                    color: Colors.brown.shade400,
                    icon: Icons.settings_outlined,
                    text: "Latest Quotes",
                    press: () {},
                  ),
                  buildCategories(
                    context,
                    color: Colors.green.shade800,
                    icon: CupertinoIcons.book,
                    text: "Articles",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildMostPopular(
                context,
                mainText: "Most Popular",
                image1: "assets/images/motivation.jpeg",
                text1: "Inspiration Quotes",
                press1: () {
                  Arguments args = Arguments(
                      title: "Inspiration",
                      isAuthCat: false,
                      name: "happiness");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
                image2: "assets/images/attitude.jpeg",
                text2: "Love Quotes",
                press2: () {
                  Arguments args = Arguments(
                      title: "Love", isAuthCat: false, name: "competition");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
                image3: "assets/images/peace.jpeg",
                text3: "Patience Quotes",
                press3: () {
                  Arguments args = Arguments(
                      title: "Patience", isAuthCat: false, name: "wisdom");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
                image4: "assets/images/bravery.jpeg",
                text4: "Positive Quotes",
                press4: () {
                  Arguments args = Arguments(
                      title: "Positive", isAuthCat: false, name: "happiness");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildMostPopular(
                context,
                mainText: "Quotes by category",
                image1: "assets/images/confidence.jpeg",
                text1: "Success Quotes",
                press1: () {
                  Arguments args = Arguments(
                      title: "Success", isAuthCat: false, name: "humorous");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
                image2: "assets/images/bussiness.jpeg",
                text2: "Friendship Quotes",
                press2: () {
                  Arguments args = Arguments(
                      title: "Friendship",
                      isAuthCat: false,
                      name: "friendship");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
                image3: "assets/images/i1.jpeg",
                text3: "Nature Quotes",
                press3: () {
                  Arguments args = Arguments(
                      title: "Nature", isAuthCat: false, name: "nature");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
                image4: "assets/images/teach.jpeg",
                text4: "Humor Quotes",
                press4: () {
                  Arguments args = Arguments(
                      title: "Humor", isAuthCat: false, name: "humor");
                  Navigator.pushNamed(context, "quotes_page", arguments: args);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(19),
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(height: 50),
                    Text(
                      "Today's Quote",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      textAlign: TextAlign.center,
                      "You can adopt the attitude there is nothing you can do, or you can see the challenge as your call to action.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      "- Catherine Pulsifer",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildMostPopular(
    BuildContext context, {
    required String mainText,
    required String image1,
    required String text1,
    required GestureTapCallback press1,
    required String image2,
    required String text2,
    required GestureTapCallback press2,
    required String image3,
    required String text3,
    required GestureTapCallback press3,
    required String image4,
    required String text4,
    required GestureTapCallback press4,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$mainText",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildQuotesContainer(
              context,
              image: image1,
              text: text1,
              press: press1,
            ),
            buildQuotesContainer(
              context,
              image: image2,
              text: text2,
              press: press2,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildQuotesContainer(
              context,
              image: image3,
              text: text3,
              press: press3,
            ),
            buildQuotesContainer(
              context,
              image: image4,
              text: text4,
              press: press4,
            ),
          ],
        ),
      ],
    );
  }

  Column buildQuotesContainer(BuildContext context,
      {required String image,
      required String text,
      required GestureTapCallback press}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 3,
                  offset: Offset(0.2, 0.2),
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 2,
                  offset: Offset(-2, -2),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Text(
          "  $text",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Column buildCategories(
    BuildContext context, {
    required Color color,
    required IconData icon,
    required String text,
    required GestureTapCallback press,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          )),
        ),
      ],
    );
  }

  AnimatedContainer dot({required int Index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: initialCount == Index ? 18 : 8,
      decoration: BoxDecoration(
        color: initialCount == Index
            ? Colors.white
            : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
