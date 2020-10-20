import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> _key = new GlobalKey();

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title:  Text('Multi-Form Validation', 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 24.0, 
          fontWeight: FontWeight.w500, 
          fontFamily: 'Cera Pro', 
        )),
      ),
      body: Form(
        key: _key,
        autovalidate: _autoValidate,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                validator: _validateName,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name.'
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                validator: _validateUserName,
                decoration: InputDecoration(
                  labelText: 'UserName',
                  hintText: 'Enter your username.'
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                validator: _validateAge,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  hintText: 'Enter your age.'
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                validator: _validateBio,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  hintText: 'Enter your bio.'
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    onPressed: () {
                      if(_key.currentState.validate()){
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('Validated'),
                          )
                        );
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String _validateName(String value){
    if(value.length == 0){
      return '*Required Field';
    } else if(value.length < 3){
      return 'Name is too short';
    } else {
      return null;
    }
  }

  String _validateUserName(String value){
    if(value.length == 0){
      return '*Required Field';
    } else if(value.length < 3){
      return 'UserName is too short';
    } else {
      return null;
    }
  }

  String _validateAge(String value){
    String pattern = r'(^[1-9 ]*$)';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0){
      return '*Required Field';
    } else if(!regExp.hasMatch(value)) { 
      return 'Age should be numeric';
    } else {
      return null;
    }
  }

  String _validateBio(String value){
    if(value.length == 0){
      return '*Required Field';
    } else if(value.length < 20){ 
      return 'Bio should be more than 20 charectors';
    } else {
      return null;
    }
  }
}