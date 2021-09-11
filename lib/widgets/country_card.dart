import 'package:covid_statistics/constants/constant_strings.dart';
import 'package:covid_statistics/constants/general_constants.dart';
import 'package:covid_statistics/constants/text_styles.dart';
import 'package:covid_statistics/models/countriesDataModel.dart';
import 'package:covid_statistics/utility/utilities.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({Key? key, required this.copiedDataList, required this.i})
      : super(key: key);

  final List<CountriesData> copiedDataList;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(copiedDataList[i].country,
              textAlign: TextAlign.center,
              style: CovidStatisticsTExtStyles.header),
          const SizedBox(height: 10),
          Text(totalCases + dataString(copiedDataList[i].totalCases),
              style: CovidStatisticsTExtStyles.main),
          const SizedBox(height: 5),
          Text(totalDiscovered + dataString(copiedDataList[i].totalDiscovered),
              style: CovidStatisticsTExtStyles.main),
          const SizedBox(height: 5),
          Text(activeCases + dataString(copiedDataList[i].activeCases),
              style: CovidStatisticsTExtStyles.main),
          const SizedBox(height: 5),
          Text(newCases + dataString(copiedDataList[i].newCases),
              style: CovidStatisticsTExtStyles.main),
          const SizedBox(height: 5),
          Text(newDeaths + dataString(copiedDataList[i].newDeaths),
              style: CovidStatisticsTExtStyles.main),
          const SizedBox(height: 5),
          Text(totalDeaths + dataString(copiedDataList[i].totalDeaths),
              style: CovidStatisticsTExtStyles.main)
        ],
      ),
    );
  }
}
