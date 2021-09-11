import 'package:covid_statistics/constants/general_constants.dart';
import 'package:covid_statistics/models/newsModel.dart';
import 'package:covid_statistics/utility/utilities.dart';
import 'package:covid_statistics/widgets/news_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleNews extends StatelessWidget {
  final News news;

  const SingleNews({Key? key, required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Container(
            decoration: boxDecoration,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(children: [
                    NewsImage(imageUrl: news.image),
                    Positioned(
                        top: 20,
                        left: 20,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(FontAwesomeIcons.chevronCircleLeft,
                              size: 30),
                        )),
                  ]),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(news.name.replaceAll('\\"', '"')),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(news.description),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Source: " + news.source,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                      onPressed: () => launchURL(news.url, context),
                      child: Text("Visit Website",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
