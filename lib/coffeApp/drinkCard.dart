import 'package:flutter/material.dart';
import 'package:progmsn2024/coffeApp/colors.dart';
import 'package:progmsn2024/coffeApp/drink.dart';
import 'dart:math' as math;

class Drinkcard extends StatelessWidget {
  Drink drink;
  double pageOffset;
  double animation = 0;
  double animate = 0;
  double rotate = 0;
  double columnAnimation = 0;
  int index;

  Drinkcard(this.drink, this.pageOffset, this.index);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 80;
    double cardHeight = size.height - 290;
    double count = 0;
    double page;
    rotate = index - pageOffset;
    for (page = pageOffset; page > 1;) {
      page--;
      count++;
    }

    animation = Curves.easeOutBack.transform(page);
    animate = 100 * (count + animation);
    columnAnimation = 50 * (count + animation);

    for (int i = 0; i < index; i++) {
      animate -= 100;
      columnAnimation -= 50;
    }

    return Container(
      child: Stack(
        children: <Widget>[
          builTopText(),
          buildBackgroundImage(cardWidth, cardHeight, size),
          buildAboveCard(cardWidth, cardHeight, size),
          // buildCupImage(size),
          // buildBlurImage(cardWidth, size),
          buidlSmallImage(size),
          buildTopImage(cardWidth, cardHeight, size),
        ],
      ),
    );
  }

  Widget builTopText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Text(
            drink.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: drink.lightcolor),
          ),
          Text(
            drink.nonName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 42,
                color: drink.darkcolor),
          ),
        ],
      ),
    );
  }

  Widget buildBackgroundImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth + 40,
      right: -20,
      height: cardHeight - 37,
      bottom: size.height * .10,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.asset(
            drink.backgroundImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget buildAboveCard(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth + 10,
      height: cardHeight - 68,
      bottom: size.height * .12,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
          color: drink.darkcolor.withOpacity(.50),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(25),
        child: Transform.translate(
          offset: Offset(-columnAnimation, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'RUBIKMANIA',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                drink.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              Row(
                children: <Widget>[
                  buildChip('Dificultad: ${drink.dificulty}', drink.lightcolor),
                ],
              ),
              const Spacer(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildProgressIndicator(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgressIndicator() {
    double progress;
    switch (drink.dificulty) {
      case 'Easy':
        progress = 0.33;
        break;
      case 'Medium':
        progress = 0.66;
        break;
      case 'Hard':
        progress = 1.0;
        break;
      default:
        progress = 0.0;
    }

    return Container(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        value: progress,
        backgroundColor: Colors.white.withOpacity(0.3),
        valueColor: AlwaysStoppedAnimation(drink.darkcolor),
        strokeWidth: 10,
      ),
    );
  }

  // Widget buildCupImage(Size size) {
  //   return Positioned(
  //       bottom: 20,
  //       right: -size.width * .2 / 2 + 30,
  //       child: Transform.rotate(
  //         angle: -math.pi / 14 * rotate,
  //         child: Image.asset(
  //           drink.cupImage,
  //           height: size.height * .55 - 15,
  //         ),
  //       ));
  // }

  // Widget buildBlurImage(double cardWidth, Size size) {
  //   return Positioned(
  //     right: cardWidth / 2 - 60 + animate,
  //     bottom: size.height * .10,
  //     child: Image.asset(drink.imageBlur),
  //   );
  // }

  Widget buidlSmallImage(Size size) {
    return Positioned(
        height: 200,
        right: -80 + animate,
        top: size.height * .45,
        child: Image.asset(
          drink.imageSmall,
          height: 300,
          width: 300,
        ));
  }

  Widget buildChip(String label, Color color) {
    return Chip(
      label: Text(label, style: TextStyle(color: Colors.white)),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget buildTopImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      left: cardWidth / 6 - animate,
      bottom: size.height * .03 + cardHeight - 10,
      child: Image.asset(
        drink.imageTop,
        height: 80,
        width: 80,
      ),
    );
  }
}
