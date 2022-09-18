


import 'package:flutdatabase/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





class LoginScreen extends StatelessWidget {


  var email =TextEditingController();
  var password =TextEditingController();








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login Screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
              labelText: 'password',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {

           setData();

             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

setData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("email", email.text.toString());
  sharedPreferences.setString("password", password.text.toString());


}
}