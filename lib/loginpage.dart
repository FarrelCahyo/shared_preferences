import 'package:flutter/material.dart';
import 'package:latihan_shared/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState(){
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async{
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login')??true);
    print(newuser);
    if(newuser == false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return PageSatu();
      }));
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Shared Preferences"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  String username = _username.text;
                  String password = _password.text;

                  if (username == "asisten" && password == "123") {
                    logindata.setBool('login', false);
                    logindata.setString('username', username);

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return PageSatu();
                    }));
                  }
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
