import 'package:flutter/material.dart';
import 'package:value_ville/Dashboard.dart';
import 'package:value_ville/signUp_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:value_ville/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Value-Ville",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Value-Ville"),
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            height: 800,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('assets/value-ville-login.jpg'),
                  height: 200,
                  width: 300,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: TextField(
                    controller: uname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: "Username",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: TextField(
                    controller: pass,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                          BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Password",
                        isDense: true),
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String user = uname.text.toString();
                    String pwd = pass.text.toString();

                    if (user.isEmpty || pwd.isEmpty) {
                      Fluttertoast.showToast(msg: "Fill all the details!");
                    } else {
                      login();
                    }
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade300,
                      foregroundColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(right: 80),
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => SignUpPage())),
                        child: Text(
                          "Sign Up", style: TextStyle(color: Colors.blue),),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(left: 80),
                      child: InkWell(
                        // onTap: () => launchUrl(Uri.parse("https://example.com/forgotpassword")),
                        child: Text("Forgot Password?",
                          style: TextStyle(color: Colors.blue),),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ));
  }

  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: uname.text.toString() + "@gmail.com",
          password: pass.text.toString()
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardPage(uname: uname.text,)));
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid details ');
      return;
    }
    //Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }

  void checkIsLoggedIn() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        // print("User is " +user.toString());
        List<String> emailParts = uname.toString().split('@');
        //String username = emailParts[0];
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage(uname: emailParts[0])));
      }
    });
  }
}