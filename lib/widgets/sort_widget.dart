import 'package:covid_statistics/constants/general_constants.dart';
import 'package:flutter/material.dart';

class Sorting extends StatelessWidget {
  final String sortOpt;
  final Function(String?) onChanged;
  const Sorting({Key? key, required this.sortOpt, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
          itemBuilder: (context, i) => RadioListTile(
                value: sortList[i],
                groupValue: sortOpt,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (String? value) {
                  onChanged(value);
                  Navigator.of(context).pop();
                },
                title: Text(
                  sortList[i],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: sortList[i] == sortOpt
                          ? Theme.of(context).primaryColor
                          : Color.fromARGB(255, 136, 136, 136)),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: sortList.length),
    );
  }
}
