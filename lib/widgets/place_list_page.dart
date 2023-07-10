import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'menu_drawer.dart';

class Category{
  final String cat;
  final String details;
  final String img;
  final String province;
  final String title;

  Category({required this.cat,required this.details,required this.img,required this.province,required this.title});

}





class PlaceList extends StatefulWidget {
  const PlaceList({super.key,required this.cat});

  final String cat;

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {

  List<Category> _categories=[];
  bool _isHovering=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories()async{
    try{
      print(widget.cat.toLowerCase());
      final snapshot=await FirebaseFirestore.instance.collection('categories').where('cat',isEqualTo:widget.cat.toLowerCase()) .get();
print(snapshot.docs.length);
      final List<Category> categories=snapshot.docs.map((doc) {
        final data=doc.data();
        print(data);
        return Category(cat: data['cat'], details: data['details'], img: data['img'], province: data['province'], title: data['title']);

      } ).cast<Category>().toList();
    setState(() {
      _categories=categories;
      print(categories);
    });
    }catch(e){
      print(e.toString());
    }
  }

Widget _buildCategoryList(){
  if(_categories.isEmpty){
    return Center(child: Text('No Items to show!'),);
  }
  double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;
  return Center(
    child: SizedBox(
      width: width*0.6,
     
      child: ListView.builder(
        itemCount: _categories.length,
        itemBuilder:((context, index) {
          final category=_categories[index];
          final description=category.details.length<=50?category.details:category.details.substring(0,50)+'...';
          return InkWell(
            onHover: (value) {
              setState(() {
                value?_isHovering=true:_isHovering=false;
                print(_isHovering);
              });
            },
            onTap: () {
              print('tapped');
            },
            child: SizedBox(
              
           
              child: Container(
                width: width*0.5,
                height:_isHovering? height*0.8:height*0.6,
                //constraints: const BoxConstraints(maxWidth: 400),
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(top:10),
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
             image: DecorationImage(
             image: NetworkImage(category.img)
           
          ,fit: BoxFit.cover,onError: (exception, stackTrace){
             Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,);
          }
            
          
           ),
           ), 
                
             
            
            
           
           
               
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(category.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(description),
                //      SizedBox(
                //       width: width*0.5,
                //       height: height*0.5,
                //        child: Image.network(category.img,fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) {
                //    return Image.asset('assets/placeholder.jpg')
                //    ;
                //  },),
            //             SizedBox(
            //               width: width*0.5,
            //               height: height*0.5,
            //               child:  FadeInImage(
            //   placeholder: AssetImage('assets/placeholder.jpg'),
            //   image:category.img NetworkImage(category.img),
            //   fit: BoxFit.fill,
            //   imageErrorBuilder: (context, error, stackTrace) {
            //     return Image.asset('assets/placeholder.jpg', fit: BoxFit.cover);
            //   },
            // ),
            //             )
          
                  ],
                ),
              ),
            ),
          );
        })),
    ),
  );
}

Widget _buildContent(){
  if(_categories.isEmpty){
    return Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.black,rightDotColor: Colors.red,size: 50));
  }else{
    return _buildCategoryList();
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
extendBodyBehindAppBar: true,
      
       appBar: AppBar(
         iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0),size: 30),
         elevation: 0,
         backgroundColor: Color.fromARGB(255, 7, 29, 99).withOpacity(0.001),
         title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
               fontSize: 26,
               fontWeight: FontWeight.w900
             )),
       ),
       endDrawer: const MenuDrawer(),
       body: Column(
         children: [
          Text(widget.cat),
           SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.95,
            child: _buildContent()),
         ],
       )

    );
  }
}