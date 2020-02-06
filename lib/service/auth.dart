import 'package:final1/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final1/models/user.dart';


class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;
  //create user obj
  User _userfromFirebaseUser(FirebaseUser user ){
    return user!=null? User(uid: user.uid):null;

  }
  //auth changr user stream
  Stream<User>get user{

    return _auth.onAuthStateChanged
     //.map((FirebaseUser user)=> _userfromFirebaseUser(user));
     .map(_userfromFirebaseUser);
  }
  // anon

  Future signInAnon() async{
    try{
      AuthResult result=await _auth.signInAnonymously();
      FirebaseUser user =result.user;
      return _userfromFirebaseUser(user);
      //return user;
    } catch(e){
      print(e.toString());
      return null;

    
    }

  }


  // sign in email
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return _userfromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }



  }




  //register
  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;


      //create anew document for the user with the uid
      await DatabaseService(uid:user.uid).updateUserData('sameeksha','kurma', 0);
      return _userfromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;


    }



  }


  //sign out
  Future signOut() async{
    try {

      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }



  }

}