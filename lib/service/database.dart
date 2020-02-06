import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final1/models/brew.dart';



 class DatabaseService{
   final String uid;
   DatabaseService({this.uid});


   //collection reference
   final CollectionReference brewCollection=Firestore.instance.collection('food stuffs');

   Future updateUserData(String name, String food,int count )async {
     return await brewCollection.document(uid).setData({
       'name': name,
       'food':food,
       'count':count,


     });

   }

   //brew list from snaoshot

   List<Brew>_brewListFromSnapshot(QuerySnapshot snapshot){
      return snapshot.documents.map((doc){
        return Brew(
          name:doc.data['name'] ??'',
          food:doc.data['count']?? '',
          count:doc.data['food']?? 0
        );


      });

   }

   
//get  bres stream
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

 }