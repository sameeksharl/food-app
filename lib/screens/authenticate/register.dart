
import 'package:flutter/material.dart';
import 'package:final1/service/auth.dart';
import 'package:final1/shared/constants.dart';
import 'package:final1/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;




   String email ='';
   String password ='';
   String error ='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title:Text('sign up delighthostel'),
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('SignIn'),
            onPressed:(){
              widget.toggleView();

              
            }
          )


        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: Form(
          key:_formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'email'),
                validator: (val)=> val.isEmpty ?'enter the email':null,
                onChanged:(val){
                  setState(() =>email=val
                    
                  );



                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText:'password',
                  fillColor:Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:BorderSide(color:Colors.pink,width:3.0)

                    
                  ),
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide:BorderSide(color:Colors.blue[200],width:3.0)

                    
                  ),
                ),
                obscureText: true,
                validator: (val) => val.length<6 ?'enter the password 6+char long':null,
                onChanged:(val){
                setState(()=>password=val 
                  
                );

              }
              ),
              RaisedButton(
                color: Colors.black,
                child:Text('register',
                style:TextStyle(color:Colors.white),
                ),
                onPressed: ()async{
                  if (_formKey.currentState.validate()){
                    setState(() => loading=true             
                    );              
                  
                    dynamic result =await _auth.registerWithEmailAndPassword(email, password);
                    if (result ==null){
                      setState(() { error ='pls supply a valid email';
                      loading=false;
                      });


                    }                                                             
                  }


            
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style:TextStyle(color: Colors.red,fontSize:14.0),



              )
              
                
              





            ],
            
            
            
            
            )
        
        
        
        ),



        ),
      
    );
  }
}