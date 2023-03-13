import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashQuotesPage extends StatefulWidget {
  const SplashQuotesPage({Key? key}) : super(key: key);

  @override
  State<SplashQuotesPage> createState() => _SplashQuotesPageState();
}

class _SplashQuotesPageState extends State<SplashQuotesPage> {
  List<Map<String, String>> splashData = [
    {
      'text': "Quotes about life",
      'image': "assets/images/splash1.jpeg",
      'detail':
          "The goal is to help you find the inspiration \nand motivation you need for living a good \nand simple life.",
    },
    {
      'text': "Quotes for inspiration",
      'image': "assets/images/splash2.jpeg",
      'detail':
          "Quotes that ispire you and motivate you \nfor your life and will totally brighten up and \nmake your day wonderful.",
    },
    {
      'text': "Fully customizable with\n beautiful images",
      'image': "assets/images/first.jpeg",
      'detail':
          "Quotes ready with customizing options \nsuch as background, text colors, text size,\n and fonts. ",
    },
    {
      'text': "Set reminders",
      'image': "assets/images/second.jpeg",
      'detail':
          "Set personal reminders to nudge yourself to \nbe mindful throughout the day and share the \nuplifting quote of the day.",
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (val) {
                    setState(() {
                      currentPage = val;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, i) => Column(
                    children: [
                      Spacer(),
                      Image.asset(
                        "${splashData[i]['image']}",
                        // height: 15,
                        // width: getProportionateScreenWidth(235),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "${splashData[i]['text']}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "${splashData[i]['detail']}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => dot(Index: index),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.withOpacity(0.7)),
                              ),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('Visited', true);
                                Navigator.pushReplacementNamed(
                                    context, 'splash_screen');
                              },
                              child: Text(
                                "Start",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer dot({required int Index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == Index ? 20 : 8,
      decoration: BoxDecoration(
        color:
            currentPage == Index ? Colors.blue : Colors.blue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
