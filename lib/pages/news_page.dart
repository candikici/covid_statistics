import 'package:covid_statistics/constants/text_styles.dart';
import 'package:covid_statistics/models/newsModel.dart';
import 'package:covid_statistics/pages/single_news_page.dart';
import 'package:covid_statistics/utility/utilities.dart';
import 'package:covid_statistics/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isLoading = false;
  List<News> newsList = [];

  @override
  void initState() {
    getResponse();
    super.initState();
  }

  getResponse() async {
    setState(() => isLoading = true);
    newsList = await callNewsApi(newsList);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22, right: 11, left: 11),
                  child: Column(
                    children: [
                      Text("Covid-19 News",
                          style: CovidStatisticsTExtStyles.pageHeader),
                      const SizedBox(height: 15),
                      ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: newsList.length,
                        itemBuilder: (ctx, i) => GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SingleNews(news: newsList[i]),
                          )),
                          child: NewsCard(news: newsList[i]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
