import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final conUser = TextEditingController();
  final conPwd = TextEditingController();
  bool isLoadign = false;

  @override
  Widget build(BuildContext context) {
    TextFormField txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
    );

    final txtPwd = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: conPwd,
      decoration: const InputDecoration(prefixIcon: Icon(Icons.password)),
    );

    final ctnCredentials = Positioned(
      bottom: 60,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        // margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(30)),
        child: ListView(
          shrinkWrap: true,
          children: [txtUser, txtPwd],
        ),
      ),
    );

    final btnLogin = Positioned(
        width: MediaQuery.of(context).size.width * .9,
        bottom: 20,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[200]),
            onPressed: () {
              isLoadign = true;
              setState(() {});
              Future.delayed(const Duration(milliseconds: 4000)).then((value) =>
                  {
                    isLoadign = false,
                    setState(() {}),
                    Navigator.pushNamed(context, "/home")
                  });
            },
            child: const Text('Validar Usuario')));

    final gifLoading = Positioned(
      top: 3,
      child: Image.asset('assets/Kunst.gif'),
      width: 100,
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: Image.asset(
                'assets/ct.jpg',
                width: 300,
              ),
            ),
            ctnCredentials,
            btnLogin,
            isLoadign ? gifLoading : Container()
          ],
        ),
      ),
    );
  }
}
