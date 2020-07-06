import 'package:flutter/material.dart';
import 'package:sheets/controller.dart';
import 'package:sheets/models/feedback_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController workdoneController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void _SubmitForm(){

    if(_formKey.currentState.validate()){
      FeedbackForm feedbackForm = FeedbackForm(
        nameController.text,
        emailController.text,
        dateController.text,
        workdoneController.text,
        timeController.text,
      );

      FormController formController = FormController(
          (String response){
            print(response);
            if (Form == FormController.STATUS_SUCCESS){
              _showSnackBar("Congrats you Done it...");
            }else{
              _showSnackBar("Try Again Please!");
            }
          }
      );
      _showSnackBar("Storing Data....");
      formController.submitForm(feedbackForm);
    }

  }

  _showSnackBar(String message){
    final snackBar = SnackBar(content: Text(message),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
    title: new Text('Productivity Report'),
    actions: <Widget>[
      new IconButton(icon: const Icon(Icons.save), onPressed: () {})
    ],
  ),
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100,horizontal: 24),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter Name";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter Email";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Email"
                ),
              ),
              TextFormField(
                controller: dateController,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter Date";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Date"
                ),
              ),
              TextFormField(
                controller: workdoneController,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter Work Done";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "WorkDone"
                ),
              ),
              TextFormField(
                controller: timeController,
                validator: (value){
                  if(value.isEmpty){
                    return "Enter Time";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Time"
                ),
              ),

              RaisedButton(
                onPressed: (){
                  _SubmitForm();
                },
                child: Text("Save Data"),
              )
            ],
          ),
        )
      )
    );
  }
}

