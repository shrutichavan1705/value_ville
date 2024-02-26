import 'package:flutter/material.dart';
import 'package:value_ville/Dashboard.dart';
import 'package:value_ville/signUp_page.dart';

void main() {
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
                  margin: EdgeInsets.all(20),
                  child: TextField(
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
                  margin: EdgeInsets.all(20),
                  child: TextField(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashboardPage()));
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade300,
                      onPrimary: Colors.white,
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
                      child:InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage())),
                        child: Text("Sign Up", style: TextStyle(color: Colors.blue),),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(left: 80),
                      child: InkWell(
                        // onTap: () => launchUrl(Uri.parse("https://example.com/forgotpassword")),
                        child: Text("Forgot Password?", style: TextStyle(color: Colors.blue),),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ));
  }
}
