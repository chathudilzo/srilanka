import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../widgets/menu_drawer.dart';


class Province{
  final String name;
  final String details;
  final String img;
  final GeoPoint latlong;
  

  Province({required this.name,required this.details,required this.img,required this.latlong});

}

class ProvinceDetails extends StatefulWidget {
  const ProvinceDetails({super.key,required this.name});

  final String name;

  @override
  State<ProvinceDetails> createState() => _ProvinceDetailsState();
}

class _ProvinceDetailsState extends State<ProvinceDetails> {

int _currentIndex=0;
int j=0;
bool 
_isDetailsLoading=true;
bool _isImagesLoading=true;
final List<String> imageList=["assets/swp1.jpg","assets/swp2.jpg","assets/swp3.jpg","assets/swp4.jpg"];
late Province _province;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProvince();
  }

  Future<void>fetchProvince()async{

    try{
      print(widget.name);
      final snapshot=await FirebaseFirestore.instance.collection('province').where('name',isEqualTo: widget.name).get();
      if(snapshot.docs.isNotEmpty){
        
          final data=snapshot.docs.first.data();
          
         

        
        setState(() {
          _province= Province(name: data['name']??'', details: data['description']??'', img:data['img']??'', latlong: data['latlong']??[0.00,0.00]);
          
        
          _isDetailsLoading=false;
        });
      }
      //print('empty');
    }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(extendBodyBehindAppBar: true,
      appBar:  AppBar(
        
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
       body:SingleChildScrollView(child: Column(
        children: [
          SizedBox(
            height: height*0.5,
            width: width,
            child: CarouselSlider(options: CarouselOptions(
              height: double.infinity,
            aspectRatio: 19/9,
            viewportFraction: 1.0,
            autoPlay: true,
            initialPage: _currentIndex,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(seconds: 2),
            autoPlayCurve: Curves.bounceOut,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex=index;
                });
              },
              
            )
            ,items:imageList.map((image){
              return Builder(builder: (BuildContext context){
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      blurRadius: 3,spreadRadius: 3,offset:Offset(1,1) ,color:Colors.black
                    )]
                  ),
                  width: width,
                  height: height*0.5,
                  child: Image.asset(image,fit: BoxFit.fitWidth,width: double.infinity,),
                );
              });

            } 
            ).toList()
            ),
           
          ),
          
           Container(
            color: Color.fromARGB(255, 27, 33, 44),
            width: width,
            height: height*0.1,
            child:Center(
              child: Text(widget.name,style:GoogleFonts.dancingScript(
                 fontSize: 40,
                 fontWeight: FontWeight.w900,
                 color: Color.fromARGB(255, 182, 175, 175)
               )),
            ) ,),SizedBox(height: 20,),

            
            _isDetailsLoading?LoadingAnimationWidget.beat(color: Colors.green, size: 50):
            Column(
              children: [

                Container(
                  width: width*0.8,
                  child: RichText(text: TextSpan(
                    children: [
                      for(int i=0;i<_province.details.length-1 && _province.details[i]!='*';i++)
                      
                      TextSpan(
                        text: _province.details[i]=='*'?'\n':_province.details[i],
                        style:  GoogleFonts.adamina
                   (
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  )
                      ),
                      
                    ]
                  ),)
                ),
                Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red),
  width:300,
height: 300,
              child: ClipRRect(child: Image.network(_province.img,fit: BoxFit.fill,),borderRadius: BorderRadius.circular(10),),
            ),Container(
                  width: width*0.8,
                  child: RichText(text: TextSpan(
                    children: [
                      for(int i=0;i<_province.details.length-1;i++)
                      TextSpan(
                        text: _province.details[i]=='*'?'\n':_province.details[i],
                        style:  GoogleFonts.adamina
                   (
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  )
                      ),
                      
                    ]
                  ),)
                ),
              ],
            )
        ],
       )) ,
    );
  }
}
// Text(_province.details,style: GoogleFonts.adamina
//               (
//                fontSize: 26,
//                fontWeight: FontWeight.w400,
//                color: Colors.black
//              )),