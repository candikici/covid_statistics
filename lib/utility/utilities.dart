import 'dart:convert';

import 'package:covid_statistics/constants/api_urls.dart';
import 'package:covid_statistics/constants/constant_strings.dart';
import 'package:covid_statistics/constants/general_constants.dart';
import 'package:covid_statistics/models/countriesDataModel.dart';
import 'package:covid_statistics/models/newsModel.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:url_launcher/url_launcher.dart';

Future<List<List<CountriesData>>> callApi(
    List<CountriesData> dataList, String sortOpt) async {
  if (dataList.isNotEmpty) dataList.clear();
  var response =
      await http.get(CovidStaticsUrls.countriesDataUrl, headers: apiHeaders());
  var results = json.decode(response.body)["result"];

  for (var item in results) {
    var data = CountriesData.fromMap(item);
    dataList.add(data);
  }
  var copiedDataList = [...dataList];
  copiedDataList =
      sortingDataList(copiedDataList: copiedDataList, sortOpt: sortOpt)
          .reversed
          .toList();

  return [dataList, copiedDataList];
}

Map<String, String> apiHeaders() {
  return {
    "authorization": "apikey 2Qct5MGNN8PpY5kHYXgXxw:3OtUqhYrhtGtYn4iQ1CI3C",
    "content-type": "applicaiton/json"
  };
}

Future<List<News>> callNewsApi(List<News> newsList) async {
  if (newsList.isNotEmpty) newsList.clear();
  var response =
      await http.get(CovidStaticsUrls.newsDataUrl, headers: apiHeaders());
  var results = json.decode(response.body)["result"];

  for (var item in results) {
    var data = News.fromMap(item);
    newsList.add(data);
  }

  return newsList;
}

launchURL(String url, BuildContext context) async {
  var abletoLaunch = await canLaunch(url);
  if (abletoLaunch)
    await launch(url);
  else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
        content: Text("Link could not launch. Try again later."),
        backgroundColor: Colors.red));
    throw 'Could not launch $url';
  }
}

List<CountriesData> sortingDataList(
    {required List<CountriesData> copiedDataList, required String sortOpt}) {
  var index = sortList.indexWhere((element) => element == sortOpt);
  var list;
  if (index == 0) {
    copiedDataList.sort((a, b) => a.country.compareTo(b.country));
    list = [...copiedDataList];
  } else if (index == 1) {
    copiedDataList.sort((a, b) => int.parse(
            (a.totalCases == unknown || a.totalCases == "")
                ? "0"
                : a.totalCases.replaceAll(",", ""))
        .compareTo(int.parse((b.totalCases == unknown || b.totalCases == "")
            ? "0"
            : b.totalCases.replaceAll(",", ""))));
    list = [...copiedDataList];
  } else {
    copiedDataList.sort((a, b) => int.parse(
            (a.totalDeaths == unknown || a.totalDeaths == "")
                ? "0"
                : a.totalDeaths.replaceAll(",", ""))
        .compareTo(int.parse((b.totalDeaths == unknown || b.totalDeaths == "")
            ? "0"
            : b.totalDeaths.replaceAll(",", ""))));
    list = [...copiedDataList];
  }
  return list;
}

String dataString(String data) {
  return (data == "" ? unknown : data);
}
