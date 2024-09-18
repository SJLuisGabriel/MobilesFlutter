import 'package:flutter/material.dart';
import 'package:progmsn2024/coffeApp/colors.dart';
import 'package:progmsn2024/coffeApp/drink.dart';
import 'package:progmsn2024/coffeApp/drinkcard.dart';

class CoffeAppScreen extends StatefulWidget {
  const CoffeAppScreen({super.key});

  @override
  State<CoffeAppScreen> createState() => _CoffeAppScreenState();
}

class _CoffeAppScreenState extends State<CoffeAppScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  double pageOffset = 0;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);
    pageController = PageController(viewportFraction: .8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          buildTollbar(),
          buildLogo(size),
          buildPager(size),
          buildPageIndecator(),
        ],
      )),
    );
  }

  Widget buildTollbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot) {
                return Transform.translate(
                  offset: Offset(-200 * (1 - animation.value), 0),
                  child: Image.asset(
                    'assets/p3/icono.png',
                    width: 30,
                    height: 30,
                  ),
                );
              }),
          Spacer(),
          AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Transform.translate(
                    offset: Offset(200 * (1 - animation.value), 0),
                    child: Image.asset(
                      'assets/p3/menu.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  Widget buildLogo(Size size) {
    return Positioned(
      top: 10,
      right: size.width / 2 - 25,
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, snapshot) {
            return Transform(
              transform: Matrix4.identity()
                ..translate(0.0, size.height / 2 * (1 - animation.value))
                ..scale(1 + (1 - animation.value)),
              origin: Offset(25, 25),
              child: InkWell(
                onTap: () => controller.isCompleted
                    ? controller.reverse()
                    : controller.forward(),
                child: Image.asset(
                  'assets/p3/logo.png',
                  width: 50,
                  height: 50,
                ),
              ),
            );
          }),
    );
  }

  Widget buildPager(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      height: size.height - 10,
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, snapshot) {
            return Transform.translate(
              offset: Offset(355 * (1 - animation.value), 0),
              child: PageView.builder(
                controller: pageController,
                itemCount: getDrinks().length,
                itemBuilder: (context, index) =>
                    Drinkcard(getDrinks()[index], pageOffset, index),
              ),
            );
          }),
    );
  }

  List<Drink> getDrinks() {
    List<Drink> list = [];
    list.add(Drink(
        'Cubo ',
        '3 x 3',
        'assets/p3/fondo 3.jpg',
        'assets/p3/1083351.png',
        'assets/p3/pngtree-rubik-s-cube-clipart-transparent-background-png-image_11087100.png',
        // '',
        // '',
        'El clásico cubo Rubik, ideal para iniciarse en el mundo de los rompecabezas.',
        'Easy',
        mCaramel,
        mDarkGray));
    list.add(Drink(
        'Cubo ',
        'Megaminx',
        'assets/p3/fondo 2.jpg',
        'assets/p3/pngtree-rubik-s-cube-clipart-transparent-background-png-image_11087100.png',
        'assets/p3/Cubos Rubik Yuxin Megaminx Colored CubosCubik (1)-600x600.png',
        // '',
        // '',
        'Un cubo de 12 caras que ofrece un desafío mayor para los más avanzados.',
        'Medium',
        mTeal,
        mDarkCyan));
    list.add(Drink(
        'Cubo ',
        'Pryramix',
        'assets/p3/fondo 5.jpg',
        'assets/p3/pngtree-rubik-s-cube-clipart-transparent-background-png-image_11087100.png',
        'assets/p3/piramide.webp',
        // '',
        // '',
        'Rompecabezas en forma de pirámide con una dificultad media, perfecto para quienes buscan algo diferente.',
        'Medium',
        mYellow,
        mOrange));
    list.add(Drink(
        'Cubo ',
        '2x2',
        'assets/p3/fondo 2.jpg',
        'assets/p3/1083351.png',
        'assets/p3/small.png',
        // '',
        // '',
        'Una versión simplificada del cubo Rubik, fácil de resolver pero igualmente entretenida.',
        'Easy',
        mPurple,
        mDarkPurple));
    return list;
  }

  Widget buildPageIndecator() {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Positioned(
              bottom: 10,
              left: 10,
              child: Opacity(
                opacity: controller.value,
                child: Row(
                  children: List.generate(
                      getDrinks().length, (index) => buildContainer(index)),
                ),
              ));
        });
  }

  Widget buildContainer(int index) {
    double animate = pageOffset - index;
    double size = 10;
    animate = animate.abs();
    Color color = Colors.grey;

    if (animate <= 1 && animate >= 0) {
      size = 10 + 10 * (1 - animate);
      color = ColorTween(begin: Colors.grey, end: mDarkPurple)
          .transform((1 - animate))!;
    }

    return Container(
      margin: const EdgeInsets.all(4),
      height: size,
      width: size,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
