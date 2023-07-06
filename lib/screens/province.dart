import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/menu_drawer.dart';
import 'package:srilanka/widgets/top_bar.dart';

import '../widgets/post.dart';


class Provinces{
  final String name;
  final String description;
  final String famousFor;
  final String image;

  Provinces({
    required this.name,required this.description,required this.famousFor,required this.image
  });
}

class Province extends StatefulWidget {
  const Province({super.key});

  @override
  State<Province> createState() => _ProvinceState();
}

class _ProvinceState extends State<Province> {

  final ScrollController _scrollController=ScrollController();

  List<Provinces> provinces=[];
  bool _isLoading=true;
  //double _opacity=0;

  //double _scrollPosition=0;

  // _scrollListner(){
  //   setState(() {
  //     _scrollPosition=_scrollController.position.pixels;
  //   });

  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _scrollController.addListener(_scrollListner);
   loadProvince();
  }

  Future<void> loadProvince() async {
  String jsonData = await rootBundle.loadString('assets/provinces.json');
  print(jsonData);
  Map<String, dynamic> data = json.decode(jsonData);
  print(data);
   List<dynamic> provincesData = data['provinces'];
   print('\n--------------------$provincesData');
 print(provincesData);
   List<Provinces> loadedProvinces = provincesData.map((item) {
    return Provinces(
      name: item['name'],
      description: item['description'],
      famousFor: item['famousFor'],
      image: item['image'],
    );
  }).toList();
print('LOADED $loadedProvinces');
   setState(() {
     provinces = loadedProvinces;
      if (provinces.isNotEmpty) {
        _isLoading = false;
     }
   });
}


  @override
  Widget build(BuildContext context) {
var screenSize=MediaQuery.of(context).size;

//_opacity=_scrollPosition<=screenSize.width*0.40?_scrollPosition/(screenSize.width*0.40)+0.25:1;


    return Scaffold(
      //extendBodyBehindAppBar: true,
      
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
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height*0.8,
          //  child: SingleChildScrollView(
          //   controller: _scrollController,
          //     scrollDirection: Axis.horizontal,
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   
                      
                      SizedBox(
                        
                        width: screenSize.width*0.40,
                        height:screenSize.height*0.40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),child: Image.asset('assets/slmap.png',fit: BoxFit.contain,),
                        )
                        ),
                
                 
                  
                    Flexible(
                      child: _isLoading?CircularProgressIndicator():ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provinces.length,
                        itemBuilder:((context, index) {
                          Provinces province=provinces[index];
                       return  Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        width: screenSize.width*0.25,
                        height: screenSize.height*0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             boxShadow: [BoxShadow(
                               blurRadius: 3,spreadRadius: 2,color: Colors.black
                             )]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(province.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                              Container(
                                width: screenSize.width*0.20,
                        height: screenSize.height*0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image:DecorationImage(image: AssetImage(province.image),fit: BoxFit.cover)),
                              ),
                              Text(province.description,style: TextStyle(color: Colors.grey),),
                              Text('Famous for:${province.famousFor}',style: TextStyle(color: Colors.amberAccent),)
                            ],
                          ),
                        );
                      })),
                    )
                  ],
                ),
             // ),
        ),
          ),
            
    );
  }
}

