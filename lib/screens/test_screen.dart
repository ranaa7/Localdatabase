import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TestScreen extends StatefulWidget {

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String name = "user name";

  int age = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 30),
              ),
              Text(
                  age.toString(),
                style: TextStyle(fontSize: 30),
              ),
              TextFormField(
                onSaved: (value) {
                  name = value.toString();
                },
                decoration: InputDecoration(
                  labelText: 'name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (value) {
                  age = int.parse(value.toString());
                },
                decoration: InputDecoration(
                  labelText: 'age',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text("save"),
              )
            ],
          ),
        ),
      ),
    );
  }

  saveData() async{
 _formKey.currentState!.save();
 SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 setState(() {
   sharedPreferences.setString("name", name);
   sharedPreferences.setInt("age", age);
   print(sharedPreferences.getInt("age")) ;
   print(sharedPreferences.getString("name"));
 });
  }
}
