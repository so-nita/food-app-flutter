import 'package:flutter/cupertino.dart';
import 'themedata.dart';

// ignore: must_be_immutable
class SectionTitle extends StatelessWidget {
  String title;
  SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: textTheme().displaySmall,
        ),
      ),
    );
  }
}
