import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:srilanka/screens/faq_page.dart';
import 'package:srilanka/screens/festival_page.dart';
import 'package:srilanka/screens/gov_services_page.dart';
import 'package:srilanka/screens/homepage_screen.dart';
import 'package:srilanka/screens/news_list_page.dart';

class FeaturedTiles extends StatelessWidget {
   FeaturedTiles({Key?key,required this.screenSize}):super(key: key);

  final screenSize;


  final List<String> assets=['assets/faq_travel.jpg','assets/news.jpg','assets/fest.jpg','assets/gov.jpg'];
  final List<String> title=['Faq','News','Festivels','Gov Services'];

  @override
  Widget build(BuildContext context) {
    return screenSize.width<800?Padding(padding: EdgeInsets.only(top: screenSize.width/50,left: 5,right: 5),
    child: SingleChildScrollView(scrollDirection: Axis.horizontal
    ,child: Row(
      children: [
        SizedBox(),
        ...Iterable<int>.generate(assets.length).map(
          (int pageIndex) =>Row(
          children: [
            GestureDetector(
              onTap: () {
                title[pageIndex]=='Faq'?Get.to(()=>Faq_Page()):title[pageIndex]=='Festivels'?Get.to(()=>FestivalsPage()):title[pageIndex]=='News'?Get.to(()=>NewsListPage()): Get.to(()=>GovServices());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width/2.5,
                    height: screenSize.width/1.5,
                    child: ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.asset(assets[pageIndex],fit: BoxFit.cover,),),
                  ),
                  Padding(padding: EdgeInsets.only(top: screenSize.height/70),child: Center(child: Text(title[pageIndex],textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontFamily:'Montserrat',fontWeight: FontWeight.w500),)),)
                ],
              ),
            ),
            SizedBox(
              width: screenSize.width/15,
            )
          ],
        ) )
      ],
    ),),
    ):Padding(padding: EdgeInsets.only(
      top: screenSize.height*0.06,
      left: screenSize.width/15,
      right: screenSize.width/15,
    
    ),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        ...Iterable<int>.generate(assets.length).map((int pageIndex) =>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                title[pageIndex]=='Faq'?Get.to(()=>Faq_Page()):title[pageIndex]=='Festivels'?Get.to(()=>FestivalsPage()):title[pageIndex]=='News'?Get.to(()=>NewsListPage()): Get.to(()=>GovServices());
              },
              child: SizedBox(
                height: screenSize.width/6,
                width: screenSize.width/7.8,
                child: Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                assets[pageIndex],
                               // fit: BoxFit.cover,
                              ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 8,
                                  spreadRadius: 5,
                                  color:Color.fromARGB(255, 2, 2, 2).withOpacity(0.3),
                                )
                              ]
                            ),
                          ),
                        ),
            ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 70,
                        ),
                        child: Text(
                          title[pageIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ]
    ));
  }
}