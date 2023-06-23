import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ContentController extends GetxController{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  RxList<Map<String,dynamic>> placesList=RxList<Map<String,dynamic>>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPlaces();
  }

  fetchPlaces()async{
    try{
      final QuerySnapshot snapshot=await _firestore.collection('categories').get();
      placesList.value=snapshot.docs.map((doc) =>doc.data() as Map<String,dynamic>).toList();
    }catch(e){
      print(e.toString());
    }
  }
}