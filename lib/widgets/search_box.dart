import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.textController,
    required this.onChanged,
    required this.onTap,
  }) : super(key: key);

  final TextEditingController textController;
  final Function(String)? onChanged;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.65,
      child: TextField(
        controller: textController,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 25),
          hintText: "Enter a Country",
          prefixIcon: Icon(FontAwesomeIcons.search),
          suffixIcon: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Center(child: Icon(FontAwesomeIcons.timesCircle)),
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
