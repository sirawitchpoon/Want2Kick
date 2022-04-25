// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _showSuccessfulMessage(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("From Want 2 Kick"),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text("Okay"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("WANT 2 KICK"),
          automaticallyImplyLeading: false,
          actions: [
            const Text("\n" + "Login"),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: const Icon(Icons.login_sharp),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 70,
                  ),
                  Image.network(
                    "https://www.kindpng.com/picc/m/152-1522405_usc-trojans-football-sport-logo-american-football-football.png",
                    width: 250,
                    height: 250,
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter email',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter password',
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () async {
                          var message = "Account Created Successfully";
                          if (!_formkey.currentState!.validate()) {
                            return;
                          }
                          _formkey.currentState!.save();
                          try {
                            await Provider.of<Authentication>(context,
                                    listen: false)
                                .signUp(_emailController.text,
                                    _passwordController.text);

                            Map<String, dynamic> data = {
                              "email": _emailController.text,
                              "password": _passwordController.text,
                            };
                            FirebaseFirestore.instance
                                .collection("users")
                                .add(data)
                                .then(
                                    (value) => _showSuccessfulMessage(message));
                          } catch (error) {
                            rethrow;
                          }
                        },
                        child: const Text("Create Account")),
                  )
                ]),
          ),
        ));
  }
}
