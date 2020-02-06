//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final1/screens/home/Mainpage.dart';
import 'package:final1/screens/home/brew_list.dart';
import 'package:final1/screens/home/settings_form.dart';
import 'package:final1/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:final1/service/database.dart';
import 'package:provider/provider.dart';
import 'package:final1/models/brew.dart';

//import 'package:final1/service/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth=AuthService();
  
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding:EdgeInsets.symmetric(vertical:20.0,horizontal:60.0),
          child:SettingsForm(),
        );




    });
    }
    return StreamProvider<List<Brew>>.value(
      value:DatabaseService().brews,
      child:Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title:Text('hostelpage'),
        elevation:0.0,
        actions:<Widget>[
          FlatButton.icon(
             icon:Icon(Icons.person),
             label:Text('logout'),
             onPressed: () async {
               await _auth.signOut();

             },



          ),
          FlatButton.icon(onPressed: ()=>_showSettingsPanel(), icon: Icon(Icons.settings), label: Text('settings')),
          FlatButton.icon(onPressed:(){Navigator.push(
            context,MaterialPageRoute(
              builder:(context)=>Mainpage()) 
          );}, icon: Icon(Icons.fastfood), label: Text('choose'))
          
        ],

      ),
      body:BrewList(),

      ),


    );
  }
}


class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage>
   {

  @override
  Widget build(BuildContext context) {
    return Selection();
  }
}