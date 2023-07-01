import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TopScroll extends StatefulWidget {
  const TopScroll({super.key});

  @override
  State<TopScroll> createState() => _TopScrollState();
}

class _TopScrollState extends State<TopScroll> { int _currentIndex = 0;
  final List<String> imageList = [
    'assets/top3.jpg',
    'assets/top4.jpg',
    'assets/top1.jpg',
    
  ];

  final List<String> titleList=['A Destination for Adventure Travelers','A Land of Serene Beauty','A Country Rich in History and Culture'];

bool _isDrawerVisible=false;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return width>800? Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.8,
          child: CarouselSlider(options: CarouselOptions(
            height: double.infinity,
            aspectRatio: 19/9,
            viewportFraction: 1.0,
            initialPage: _currentIndex,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(microseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,

            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex=index;
              });
            },
          ),items:imageList.map((image){
              return Builder(builder: (BuildContext context){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(image,fit: BoxFit.cover,width: double.infinity,),
                      Positioned(
                        top: 20,
                        right: 20,
                        child:GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDrawerVisible=true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow:[
                              BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 3,
                                offset: Offset(1,1)
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          
                          ),
                          child: Row(
                            children: [
                              Text('MENU',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              Icon(Icons.menu,color: Colors.blue,)
                            ],
                          ),
                                              ),
                        )),
                      Positioned(
                        bottom: 100,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Text(titleList[_currentIndex],style: GoogleFonts.montserrat(fontSize: 35,color: Color.fromARGB(255, 255, 255, 255),),)),
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.white)
                                ),
                                child: Text('DESTINATIONS',style: TextStyle(color: Colors.white),),
                              ),
                            )
                          ],
                        ))
                    ],
                  )
                );
              });
          }).toList()
          ),
        ),if(_isDrawerVisible)
        AnimatedContainer(duration: Duration(microseconds: 200),width: width*0.3,height: MediaQuery.of(context).size.height,color: Colors.black,child: Text('drawer'),)
      ],
    ):Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: CarouselSlider(options: CarouselOptions(
            height: double.infinity,
            aspectRatio: 19/9,
            viewportFraction: 1.0,
            initialPage: _currentIndex,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(microseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,

            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex=index;
              });
            },
          ),items:imageList.map((image){
              return Builder(builder: (BuildContext context){
                return Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(image,fit: BoxFit.cover,width: double.infinity,),
                      Positioned(
                        top: 20,
                        right: 20,
                        child:Container(
                          padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow:[
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: Offset(1,1)
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        
                        ),
                        child: Row(
                          children: [
                            Text('MENU',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Icon(Icons.menu,color: Colors.blue,)
                          ],
                        ),
                      )),
                      Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Text(titleList[_currentIndex],style: GoogleFonts.montserrat(fontSize: 15,color: Color.fromARGB(255, 255, 255, 255),),)),
                            
                             InkWell(
                                
                                
                                onTap: () {
                                  
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2,color: Colors.white)
                                  ),
                                  child: Text('DESTINATIONS',style: TextStyle(color: Colors.white),),
                                ),
                              ),
                         
                          ],
                        ))
                    ],
                  )
                );
              });
          }).toList()
          ),
        )
      ],
    );
  }
}