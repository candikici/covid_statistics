import 'package:covid_statistics/constants/general_constants.dart';
import 'package:covid_statistics/constants/text_styles.dart';
import 'package:covid_statistics/models/countriesDataModel.dart';
import 'package:covid_statistics/utility/utilities.dart';
import 'package:covid_statistics/widgets/country_card.dart';
import 'package:covid_statistics/widgets/search_box.dart';
import 'package:covid_statistics/widgets/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CountriesData> dataList = [];
  List<CountriesData> copiedDataList = [];
  final TextEditingController textController = TextEditingController();
  String sortOpt = sortList[1];
  bool isLoading = false;
  @override
  void initState() {
    sortOpt = sortList[1];
    getResponse();
    super.initState();
  }

  getResponse() async {
    setState(() => isLoading = true);
    var response = await callApi(dataList, sortOpt);
    dataList = response[0];
    copiedDataList = response[1];
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
                  padding: const EdgeInsets.only(top: 22),
                  child: Column(
                    children: [
                      Text("Covid-19 Statistics Around The World",
                          style: CovidStatisticsTExtStyles.pageHeader),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchBox(
                              textController: textController,
                              onChanged: (text) {
                                setState(() => copiedDataList = dataList
                                    .where((i) => i.country
                                        .toLowerCase()
                                        .startsWith(text))
                                    .toList());
                              },
                              onTap: () => setState(() {
                                textController.text = "";
                                copiedDataList = [...dataList];
                              }),
                            ),
                            IconButton(
                              icon: Icon(FontAwesomeIcons.sort),
                              onPressed: () => setState(() => copiedDataList =
                                  copiedDataList.reversed.toList()),
                            ),
                            IconButton(
                              icon: Icon(FontAwesomeIcons.slidersH),
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) => Sorting(
                                    onChanged: (value) {
                                      setState(() => sortOpt = value!);
                                      copiedDataList = sortingDataList(
                                          copiedDataList: dataList,
                                          sortOpt: sortOpt);
                                    },
                                    sortOpt: sortOpt,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 20, right: 10, left: 10),
                          gridDelegate: gridSliver,
                          itemBuilder: (ctx, i) =>
                              CountryCard(copiedDataList: copiedDataList, i: i),
                          itemCount: copiedDataList.length),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
