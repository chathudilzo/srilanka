import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:srilanka/widgets/bottom_bar.dart';
import 'package:srilanka/widgets/map_box.dart';


import '../widgets/menu_drawer.dart';


class Province{
  final String name;
  final String details;
  final String img;
  final GeoPoint latlong;
  

  Province({required this.name,required this.details,required this.img,required this.latlong});

}

class Place{
  final String title;
  final String img;
  
  Place({required this.title,required this.img});
}

class ProvinceDetails extends StatefulWidget {
  const ProvinceDetails({super.key,required this.name});

  final String name;

  @override
  State<ProvinceDetails> createState() => _ProvinceDetailsState();
}

class _ProvinceDetailsState extends State<ProvinceDetails> {

late LatLng destination=LatLng(6.1667, 80.7500);


double distance=0;



int _currentIndex=0;
int j=0;
bool 
_isDetailsLoading=true;
bool _isImagesLoading=true;
final List<String> imageList=["assets/swp1.jpg","assets/swp2.jpg","assets/swp3.jpg","assets/swp4.jpg"];
late Province _province;
List<Place> _places=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProvince();
    fetchImages();
    

  }



Future<void>fetchImages()async{
  try{
    final snapshot=await FirebaseFirestore.instance.collection('categories').where('province',isEqualTo: widget.name).get();
    final List<Place> places=snapshot.docs.map((doc){
      final data=doc.data();
      return Place(title: data['title'], img: data['img']);
    }).toList();

    setState(() {
      _places=places;
      _isImagesLoading=false;
    });
  }catch(e){
    print(e);
  }
}

double calculateDistance(lat1,long1,lat2,long2){
    var p=0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
          cos(lat1 * p) * cos(lat2 * p) * 
          (1 - cos((long2 - long1) * p))/2;
    return 12742 * asin(sqrt(a));
  }




  Future<void>fetchProvince()async{

    try{
      print(widget.name);
      final snapshot=await FirebaseFirestore.instance.collection('province').where('name',isEqualTo: widget.name).get();
      if(snapshot.docs.isNotEmpty){
        
          final data=snapshot.docs.first.data();
          
         

        
        setState(() {
          _province= Province(name: data['name']??'', details: data['description']??'', img:data['img']??'', latlong: data['latlong']);
          
          destination=LatLng(_province.latlong.latitude, _province.latlong.longitude);
          _isDetailsLoading=false;
          for(int i=0;i<_province.details.length-1 && _province.details[i]!='*' ;i++){
            if(_province.details[i+1]=='*'){
              setState(() {
                j=i+2;
              });
            }
          }
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
            height: height*0.7,
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

            
           Padding(
             padding: const EdgeInsets.only(left:8.0,right: 8,top: 2,bottom: 2),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 _isDetailsLoading?Center(child: LoadingAnimationWidget.waveDots(color: Colors.green, size: 50)):
              Container(
                width: width*0.65,
                height: height*3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                
                      Container(
                        width: width*0.65,
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
                      ),
                      Container(
                        width: width*0.65,
                        child: RichText(text: TextSpan(
                          children: [
                            for(int i=j;i<_province.details.length-1;i++)
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
                  ),
                ),
              ),
              SizedBox(
                height: height*3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _isImagesLoading?Center(child: LoadingAnimationWidget.waveDots(color: Colors.red, size: 30)):
                      
                    SizedBox(
                      width: width*0.3,
                      height: height*1.5,
                      child: ScrollLoopAutoScroll(
                                    scrollDirection: Axis.vertical, //required
                                    delay: Duration(seconds: 2),
                                    duration: Duration(seconds: 80),
                                    gap: 0,
                                    reverseScroll: false,
                                    duplicateChild : 25,
                                    enableScrollInput : true,
                                    delayAfterScrollInput : Duration(seconds: 1),
                                    child: Column(
                                      children:
                                     [
                                       for(int i=0;i<_places.length-1;i++)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                            
                                            child: Stack(
                                              children:[ SizedBox(
                                                    width: width*0.3,
                                                    height: height*0.3,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.network(_places[i].img,fit: BoxFit.cover,),
                                                ),
                                              ),
                                              Positioned(
                                                top: 2,
                                                left: 2,
                                                child: Container(
                                                  width: width*0.3,
                                                    height: 30 ,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                                                  color: Colors.black.withOpacity(0.3)
                                                  ),
                                                  child: Text(_places[i].title,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)))
                                              ]
                                            ),
                                          ),
                                      )
                                     ]
                                       ,
                                    )
                              ),   
                      ),
                     SizedBox(
                width:width*0.3,
                height: height*0.8,
                child:_isDetailsLoading?LoadingAnimationWidget.beat(color: Colors.green,size: 30) :MapBox(destination: destination,isLoading: _isDetailsLoading,)) 
                      
                     
                  ],
                ),
              ),
              
              ]
             ),
           ),
           BottomBar()
        ],
       )
       ) ,
    );
  }
}
//Text(_province.details,style: GoogleFonts.adamina
//               (
//                fontSize: 26,
//                fontWeight: FontWeight.w400,
//                color: Colors.black
//              )),
// 