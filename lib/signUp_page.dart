import 'package:flutter/material.dart';
import 'package:value_ville/main.dart';

void main(){
  runApp(MyApp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
    );
  }
}
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  "Sign Up",
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
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: "Password",
                      isDense: true
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: "Confirm Password",
                      isDense: true
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade300,
                    onPrimary: Colors.white,
                    padding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

