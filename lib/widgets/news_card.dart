import 'package:covid_statistics/constants/general_constants.dart';
import 'package:covid_statistics/models/newsModel.dart';
import 'package:covid_statistics/widgets/news_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NewsImage(imageUrl: news.image),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.name.replaceAll('\\"', '"')),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Source: " + news.source,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
