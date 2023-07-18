import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../widgets/menu_drawer.dart';
class Category{
  final String cat;
  final String details;
  final String img;
  final String province;
  final String title;

  Category({required this.cat,required this.details,required this.img,required this.province,required this.title});

}
class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key,required this.title});

  final String title;

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
bool isLoading=true;
late Category item;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails();
  }

  void fetchDetails()async{
    try{
      print(widget.title);
      final snapshot=await FirebaseFirestore.instance.collection('categories').where('title',isEqualTo:widget.title).get();
      if(snapshot.docs.isNotEmpty){
        final data=snapshot.docs.first.data();
        setState(() {
          item=Category(cat: data['cat'], details: data['details'], img: data['img'], province: data['province'], title: data['title']);
          print(item.details);
          isLoading=false;
        });
      }

    }catch(e){
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      
       appBar: AppBar(
         iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0),size: 30),
         elevation: 0,
         backgroundColor: Color.fromARGB(255, 7, 29, 99).withOpacity(0.001),
         title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
               fontSize: 26,
               fontWeight: FontWeight.w900,
               color: Colors.black
             )),
       ),
       endDrawer: const MenuDrawer(),
       body:isLoading?Center(child: LoadingAnimationWidget.fourRotatingDots(color: Colors.blue,size: 50)):width>800? Padding(
         padding: const EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 20),
         child: SingleChildScrollView(
           child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(item.title,style: TextStyle(fontSize: 35),),
                      SizedBox(height: 5,),
                      Container(
                        width: width*0.4,
                        height: 5,

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,),
                      ),SizedBox(height: 10,),
                      Container(
                        width: width*0.4,
                        height: height*0.82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 3,offset: Offset(1,1),color: Colors.black)],
                          image: DecorationImage(image:NetworkImage(item.img),fit: BoxFit.cover)
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width*0.5,
                      child: Column(
                        children: [
                          
                          SizedBox(height: 50,),

                          RichText(
  text: TextSpan(
    children: [
      for (int i = 0; i < item.details.length - 1; i++)
        TextSpan(
          text: item.details[i]=='*'?'\n':item.details[i],
          style: TextStyle(fontSize: i==0?30:20,color: Colors.black87),
        ),
    ],
  ),
)

                          
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
           ),
         ),
       ):Padding(
         padding: const EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 20),
         child: SingleChildScrollView(
           child: Column(
            children: [
              
                
                   Column(
                    children: [
                      Text(item.title,style: TextStyle(fontSize: 35),),
                      SizedBox(height: 5,),
                      Container(
                        width: width*0.4,
                        height: 5,

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,),
                      ),SizedBox(height: 10,),
                      Container(
                        width: width*0.9,
                        height: height*0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 3,offset: Offset(1,1),color: Colors.black)],
                          image: DecorationImage(image:NetworkImage(item.img),fit: BoxFit.cover)
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width*0.9,
                      child: Column(
                        children: [
                          
                          SizedBox(height: 20,),

                          RichText(
  text: TextSpan(
    children: [
      for (int i = 0; i < item.details.length - 1; i++)
        TextSpan(
          text: item.details[i]=='*'?'\n':item.details[i],
          style: TextStyle(fontSize: i==0?30:20,color: Colors.black87),
        ),
    ],
  ),
)

                          
                        ],
                      ),
                    ),
                  )
                ],
              )
           
           ),
         ),
  
    );
  }
}