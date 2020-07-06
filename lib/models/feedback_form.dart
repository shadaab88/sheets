import 'package:flutter/material.dart';

class FeedbackForm{
  String _name;
  String _email;
  String _date;
  String _workdone;
  String _time;

  FeedbackForm(this._name,this._email,this._date,this._workdone,this._time);

  String toParams()=> "?name=$_name&email=$_email&date=$_date&workdone=$_workdone&time=$_time";

}