import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/menu_drawer.dart';
import 'package:srilanka/widgets/top_bar.dart';

import '../widgets/bottom_bar.dart';
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
      body:screenSize.width>800? SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: screenSize.width,
              height: screenSize.height*0.40,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/provhead.jpg',),fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height*0.8,
 child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                              width: screenSize.width*0.4,
                              child: Column(
                                children: [
                                  Text(
                                    "Sri Lanka, a tropical island located in the Indian Ocean, is divided into nine provinces, each with its own unique characteristics and attractions. These provinces showcase the diverse natural beauty, cultural heritage, and historical significance of the country. Let's explore the differences and highlights of Sri Lanka's provinces:",style: TextStyle(color: Colors.black87,fontSize: 28),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("\nCentral Province: The Central Province is known for its picturesque landscapes, cool climate, and tea plantations. It is home to the famous UNESCO World Heritage Sites of Kandy and Sigiriya, as well as the stunning Horton Plains National Park."),
                                
                                  SizedBox(height: 20,),
                                  Text("\nEastern Province: The Eastern Province is renowned for its beautiful beaches, wildlife, and cultural heritage. It is a paradise for water sports enthusiasts, with spots like Arugam Bay and Pasikuda Beach. The province also boasts ancient Buddhist sites and the scenic Pigeon Island National Park."),
                                  SizedBox(height: 20,),
                                  Text("\nNorth Central Province: This province is steeped in ancient history and is home to significant archaeological wonders. It houses the ancient cities of Anuradhapura and Polonnaruwa, showcasing the rich cultural heritage of Sri Lanka. The majestic Sigiriya Rock Fortress and Mihintale are must-visit attractions."),
                                  SizedBox(height: 20,),
                                  Text("\nNorthern Province: The Northern Province offers a glimpse into Sri Lanka's rich cultural heritage and natural beauty. Jaffna, the cultural capital of the North, is known for its vibrant Tamil culture and iconic landmarks like Nallur Kovil. The province also features the pristine Wilpattu National Park."),
                                  SizedBox(height: 20,),
                                  
                                  Text("\nNorth Western Province: With stunning coastlines and historical landmarks, the North Western Province offers a blend of natural and cultural attractions. Negombo Beach and Kalpitiya are popular beach destinations, while Munneswaram Kovil is a significant Hindu pilgrimage site."),
                                  SizedBox(height: 20,),
                                  Text("\nSabaragamuwa Province: This province is known for its lush greenery, waterfalls, and rich biodiversity. The iconic Adam's Peak, Ratnapura (the gem city), and the enchanting Sinharaja Forest Reserve are major highlights. Sabaragamuwa Province offers opportunities for adventure and nature lovers."),
                                  SizedBox(height: 20,),
                                  Text("\nSouthern Province: The Southern Province entices visitors with its pristine beaches, cultural sites, and wildlife encounters. Galle Fort, a UNESCO World Heritage Site, is a remarkable colonial-era landmark. Unawatuna Beach, Mirissa Whale Watching, and Yala National Park are other must-visit attractions."),
                                  SizedBox(height: 20,),
                                  Text("\nUva Province: The Uva Province is renowned for its scenic landscapes, tea cultivation, and outdoor adventures. The hill town of Ella offers breathtaking views, while Horton Plains National Park is known for its stunning beauty and the iconic World's End cliff. Rawana Falls and Haputale are other notable attractions."),
                                  SizedBox(height: 20,),
                                  Text("\nWestern Province: As the commercial capital of Sri Lanka, the Western Province is a mix of modernity and history. Colombo, the vibrant capital city, showcases bustling markets, cultural sites, and colonial-era architecture. The famous Galle Face Green, Mount Lavinia Beach, and Kelaniya Raja Maha Viharaya are key highlights."),
                                  SizedBox(height: 20,),
                                  Text("Each province in Sri Lanka has its own charm and allure, offering visitors a unique experience. From ancient cities and cultural heritage to breathtaking landscapes and coastal delights, exploring the diverse provinces of Sri Lanka is a journey filled with discovery and adventure.")
                                ],
                              ),
                                            ),
                            ],
                          ),
                        ),
                      ),
                       
                        
                          Flexible(
                            child: _isLoading?CircularProgressIndicator():ListView.builder(
                              scrollDirection:Axis.horizontal,
                              itemCount: provinces.length,
                              itemBuilder:((context, index) {
                                Provinces province=provinces[index];
                             return  Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              width: screenSize.width*0.25,
                              height:screenSize.height*0.25,
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
                 BottomBar()
          ],
        ),
      ):SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: screenSize.width,
              height: screenSize.height*0.40,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/provhead.jpg',),fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(),
            )
      
              
            ,
             SizedBox(
              width: screenSize.width,
              height: screenSize.height*0.7,
               child: Flexible(
                              child: _isLoading?CircularProgressIndicator():ListView.builder(
                                scrollDirection:Axis.horizontal,
                                itemCount: provinces.length,
                                itemBuilder:((context, index) {
                                  Provinces province=provinces[index];
                               return  Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                width: screenSize.width*0.8,
                                height:screenSize.height*0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                     boxShadow: [BoxShadow(
                                       blurRadius: 3,spreadRadius: 2,color: Colors.black
                                     )]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(province.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                      Container(
                                        width:screenSize.width*35,
                                height: screenSize.height*0.35,
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
                            ),
             )
                    ,
             Padding(
                        padding: const EdgeInsets.all(8.0),
                       
                          child: Column(
                            children: [
                              SizedBox(
                              width: screenSize.width,
                              child: Column(
                                children: [
                                  Text(
                                    "Sri Lanka, a tropical island located in the Indian Ocean, is divided into nine provinces, each with its own unique characteristics and attractions. These provinces showcase the diverse natural beauty, cultural heritage, and historical significance of the country. Let's explore the differences and highlights of Sri Lanka's provinces:",textAlign: TextAlign.center,style: TextStyle(color: Colors.black87,fontSize: 20),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("\nCentral Province: The Central Province is known for its picturesque landscapes, cool climate, and tea plantations. It is home to the famous UNESCO World Heritage Sites of Kandy and Sigiriya, as well as the stunning Horton Plains National Park."),
                                
                                  SizedBox(height: 20,),
                                  Text("\nEastern Province: The Eastern Province is renowned for its beautiful beaches, wildlife, and cultural heritage. It is a paradise for water sports enthusiasts, with spots like Arugam Bay and Pasikuda Beach. The province also boasts ancient Buddhist sites and the scenic Pigeon Island National Park."),
                                  SizedBox(height: 20,),
                                  Text("\nNorth Central Province: This province is steeped in ancient history and is home to significant archaeological wonders. It houses the ancient cities of Anuradhapura and Polonnaruwa, showcasing the rich cultural heritage of Sri Lanka. The majestic Sigiriya Rock Fortress and Mihintale are must-visit attractions."),
                                  SizedBox(height: 20,),
                                  Text("\nNorthern Province: The Northern Province offers a glimpse into Sri Lanka's rich cultural heritage and natural beauty. Jaffna, the cultural capital of the North, is known for its vibrant Tamil culture and iconic landmarks like Nallur Kovil. The province also features the pristine Wilpattu National Park."),
                                  SizedBox(height: 20,),
                                  
                                  Text("\nNorth Western Province: With stunning coastlines and historical landmarks, the North Western Province offers a blend of natural and cultural attractions. Negombo Beach and Kalpitiya are popular beach destinations, while Munneswaram Kovil is a significant Hindu pilgrimage site."),
                                  SizedBox(height: 20,),
                                  Text("\nSabaragamuwa Province: This province is known for its lush greenery, waterfalls, and rich biodiversity. The iconic Adam's Peak, Ratnapura (the gem city), and the enchanting Sinharaja Forest Reserve are major highlights. Sabaragamuwa Province offers opportunities for adventure and nature lovers."),
                                  SizedBox(height: 20,),
                                  Text("\nSouthern Province: The Southern Province entices visitors with its pristine beaches, cultural sites, and wildlife encounters. Galle Fort, a UNESCO World Heritage Site, is a remarkable colonial-era landmark. Unawatuna Beach, Mirissa Whale Watching, and Yala National Park are other must-visit attractions."),
                                  SizedBox(height: 20,),
                                  Text("\nUva Province: The Uva Province is renowned for its scenic landscapes, tea cultivation, and outdoor adventures. The hill town of Ella offers breathtaking views, while Horton Plains National Park is known for its stunning beauty and the iconic World's End cliff. Rawana Falls and Haputale are other notable attractions."),
                                  SizedBox(height: 20,),
                                  Text("\nWestern Province: As the commercial capital of Sri Lanka, the Western Province is a mix of modernity and history. Colombo, the vibrant capital city, showcases bustling markets, cultural sites, and colonial-era architecture. The famous Galle Face Green, Mount Lavinia Beach, and Kelaniya Raja Maha Viharaya are key highlights."),
                                  SizedBox(height: 20,),
                                  Text("Each province in Sri Lanka has its own charm and allure, offering visitors a unique experience. From ancient cities and cultural heritage to breathtaking landscapes and coastal delights, exploring the diverse provinces of Sri Lanka is a journey filled with discovery and adventure.")
                                ],
                              ),
                                            ),
                            ],
                          ),
                   
                      ),
                       
                        
                         
           BottomBar()
          ]
        )
      )      
                  
                   
                
           
      
            
    );
  }
}

