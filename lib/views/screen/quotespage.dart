import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../helper/db_helper.dart';
import '../../models/quotes.dart';


class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${res.title} Quotes",
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
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: DBHelper.dbHelper
              .fetchAllRecords(tableName: res.name, isAuthCat: res.isAuthCat),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QuotesDB>? data = snapshot.data as List<QuotesDB>?;

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: 500,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('details_page', arguments: data[i]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken),
                                image: NetworkImage(
                                  data[i].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              data[i].quote,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 1)),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.copy,
                                      color: Colors.blue)),
                              IconButton(
                                  onPressed: () async {
                                    await Share.share("Name: ${data[i].quote}");
                                  },
                                  icon: const Icon(Icons.share,
                                      color: Colors.red)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.download,
                                      color: Colors.green)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmark_outline,
                                      color: Colors.blue)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
