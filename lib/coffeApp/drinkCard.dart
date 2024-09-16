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
    double cardWidth = size.width - 60;
    double cardHeight = size.height + .55;
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
          buildCupImage(size),
          buildBlurImage(cardWidth, size),
          buidlSmallImage(size),
          buildTopImage(cardWidth, cardHeight, size),
        ],
      ),
    );
  }

  Widget builTopText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Text(
            drink.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: drink.lightcolor),
          ),
          Text(
            drink.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: drink.darkcolor),
          ),
        ],
      ),
    );
  }

  Widget buildBackgroundImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            drink.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildAboveCard(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: drink.darkcolor.withOpacity(.50),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(30),
        child: Transform.translate(
          offset: Offset(-columnAnimation, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Frappuccino',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                drink.description,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(width: 5),
                  Image.asset(''),
                  SizedBox(width: 5),
                  Image.asset(''),
                  SizedBox(width: 5),
                  Image.asset(''),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: mAppGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        '\$',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '4.',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      Text(
                        '70',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCupImage(Size size) {
    return Positioned(
        bottom: 20,
        right: -size.width * .2 / 2 + 30,
        child: Transform.rotate(
          angle: -math.pi / 14 * rotate,
          child: Image.asset(
            drink.cupImage,
            height: size.height * .55 - 15,
          ),
        ));
  }

  Widget buildBlurImage(double cardWidth, Size size) {
    return Positioned(
      right: cardWidth / 2 - 60 + animate,
      bottom: size.height * .10,
      child: Image.asset(drink.imageBlur),
    );
  }

  Widget buidlSmallImage(Size size) {
    return Positioned(
        right: -10 + animate,
        top: size.height * .3,
        child: Image.asset(drink.imageSmall));
  }

  Widget buildTopImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      left: cardWidth / 4 - animate,
      bottom: size.height * .15 + cardHeight - 25,
      child: Image.asset(drink.imageTop),
    );
  }
}
