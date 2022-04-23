import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:want_2_kick/pages/initial_page.dart';
import 'package:want_2_kick/providers/transaction_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Want to Kick App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[850],
          fontFamily: 'SFProDisplay',
        ),
        home: InitialPage(),
      ),
    );
  }
}
