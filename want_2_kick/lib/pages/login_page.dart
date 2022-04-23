import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:want_2_kick/models/profile.dart';
import 'package:want_2_kick/pages/home_page.dart';

import 'initial_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/my_bg.png'),
                            fit: BoxFit.cover)),
                    child: Form(
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 310),
                              child: Text(
                                'Login :',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "You have to enter email"),
                                  EmailValidator(
                                      errorText:
                                          "Invalid email format (for example xxx@xxxx.com)")
                                ]),
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (email) {
                                  profile.email = email!;
                                },
                                style: const TextStyle(
                                    fontSize: 22.0, color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Email',
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please enter password"),
                                obscureText: true,
                                style: const TextStyle(
                                    fontSize: 22.0, color: Colors.black),
                                onSaved: (password) {
                                  profile.password = password!;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HomePage();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      Fluttertoast.showToast(
                                          msg: e.message.toString(),
                                          gravity: ToastGravity.CENTER);
                                    }
                                  }
                                },
                                child: const Text("Login"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ]),
                    )));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
