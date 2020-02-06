import 'package:final1/shared/constants.dart';
import 'package:flutter/material.dart';



class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm>

{
  final List<String> food=["paneer","rice","dosa","idli","puri"];
  final _formKey=GlobalKey<FormState>();

  //form values
  String _currentName;
  String _currentFood;
  int _currentCount;

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child:Column(
        children: <Widget>[
          Text("Update",
          style:TextStyle(fontSize:18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration:textInputDecoration,

            validator:(val)=>val.isEmpty?'pls enter ur name':null,
            onChanged: (val)=>setState(()=>_currentName=val),



          ),
          SizedBox(height: 20),
          //dropdown
         // DropdownButtonFormField(
           /////// decoration: textInputDecoration,
           // value:_currentFood ??'select item ',
           // items: food.map((foods){
             // return DropdownMenuItem(
                //value:foods,
                //child:Text('$foods'),


            //  );



//}).toList(),
           // onChanged: (val)=>setState(()=> _currentFood=val),


         // ),



         
          
          RaisedButton(color:Colors.pink[400],
          child:Text('update',
          style: TextStyle(color:Colors.white),),
          onPressed: ()async{


          },)
        ],)
      
    );
  }
}