import 'package:app_food/constant/constant.dart';
import 'package:flutter/material.dart';
import '../model/category_model.dart';
import 'themedata.dart';

class HeroCarouselCard extends StatelessWidget {
  const HeroCarouselCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    // print(category);
    return InkWell(
      onTap: () {
        //print(category);
        Navigator.pushNamed(context, Constant().categoryScreen,
            arguments: category);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 5, right: 5, bottom: 15),
        // .symmetric(horizontal: 5, vertical: 25),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Stack(
            children: <Widget>[
              Image.network(category.imageUrl.toString(),
                  fit: BoxFit.fitWidth, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  child: Text(
                    'No. ${category.name}',
                    style: textTheme()
                        .displayMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
