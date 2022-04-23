import 'package:flutter/material.dart';
import 'package:want_2_kick/pages/home_page.dart';
import 'package:want_2_kick/pages/login_page.dart';
import 'package:want_2_kick/pages/register_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/my_bg.png'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('CREATE AN ACCOUT'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[850])),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(120, 10, 120, 70),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.login),
              label: Text('LOGIN'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[850])),
            ),
          ),
        ],
      ),
    ));
  }
}
