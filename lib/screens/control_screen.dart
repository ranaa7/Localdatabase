import 'package:flutdatabase/screens/home_screen.dart';
import 'package:flutdatabase/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ControlScreen extends StatefulWidget {



  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  String ?email;
  getdata()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      email = preferences.getString("email");
     // preferences.remove("email");
      print(email);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return email==null?LoginScreen():HomeScreen();
  }
}
