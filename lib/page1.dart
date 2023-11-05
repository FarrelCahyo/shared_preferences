import 'package:flutter/material.dart';
import 'package:latihan_shared/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageSatu extends StatefulWidget {
  const PageSatu({super.key});

  @override
  State<PageSatu> createState() => _PageSatuState();
}

class _PageSatuState extends State<PageSatu> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState(){
    super.initState();
    initial();
  }
  void initial()async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Pertama"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome $username",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
                onPressed: () {
                  logindata.setBool('login', true);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
