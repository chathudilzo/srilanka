import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/bottom_bar.dart';

import '../widgets/menu_drawer.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
final colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

final colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  
);
  List<String> images=['assets/swip1.jpg','assets/swip2.jpg','assets/swip3.jpg','assets/swip4.jpg','assets/swip5.jpg','assets/swip6.jpg','assets/swip7.jpg'];

  bool isSelectedServicves=true;
  bool isSelectedGallery=false;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      
       appBar: AppBar(
         iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255),size: 30),
         elevation: 0,
         backgroundColor: Color.fromARGB(255, 7, 29, 99).withOpacity(0.001),
         title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
               fontSize: 26,
               fontWeight: FontWeight.w900
             )),
       ),
       endDrawer: const MenuDrawer(),
       body: SingleChildScrollView(
         child: Column(
          children: [
            Container(
              width: width,
              height: height*0.4,
             
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/abtus.jpg'),fit: BoxFit.cover)
              ),
            ),
            Container(
              width: width,
              height: height*0.1,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Text('About Us',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            ),
            width>800?Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [Colors.grey,Colors.blueAccent])
                    ),
                    width:width*0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sri Lanka's premier travel authority.",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 38, 8, 170)),),
                          Text("Welcome to the Sri Lanka Tourism webpage! We are delighted to showcase the mesmerizing beauty, rich culture, and warm hospitality of this tropical paradise.\n\nAt Sri Lanka Tourism, our mission is to inspire and assist travelers in discovering the wonders of Sri Lanka. Whether you're seeking stunning beaches, lush tea plantations, ancient historical sites, or thrilling wildlife encounters, Sri Lanka has it all.\n\nImmerse yourself in the cultural diversity of our vibrant cities, such as the bustling capital Colombo with its vibrant markets and historic landmarks. Explore the UNESCO World Heritage Sites of Sigiriya, Polonnaruwa, and Anuradhapura, which offer a glimpse into our ancient civilization and architectural marvels.Experience the breathtaking natural beauty of our national parks, where you can spot majestic elephants, elusive leopards, and colorful birdlife. Enjoy the thrill of whale watching in Mirissa or embark on a scenic train ride through the misty hills of Nuwara Eliya.Indulge in our culinary delights, savoring the flavors of spicy curries, fresh seafood, and aromatic teas. Discover the art of Ayurveda, an ancient healing tradition that rejuvenates mind, body, and soul.\n\nOur team at Sri Lanka Tourism is dedicated to ensuring your journey is filled with unforgettable experiences. Whether you're a solo traveler, a couple seeking a romantic getaway, or a family on an adventure, we will tailor an itinerary that suits your interests and preferences.\n\nWe invite you to explore our website and discover the wonders of Sri Lanka. Let us be your guide as you create memories that will last a lifetime. Come, experience the warmth and beauty of Sri Lanka, where every moment is a captivating story waiting to be told.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  )),
                ),
                
                 Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Container(
                        
                        height: width*0.25,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 3,offset: Offset(1,1),color: Colors.black)],
                          borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [Colors.black54,Color.fromARGB(255, 44, 43, 43)])
                        ),
                        child:Center(child: Text('We supply the best travel experince!',textAlign: TextAlign.center,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.amberAccent),))
                      ),
                    ),
                 )
              ]
            ):Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [Colors.grey,Colors.blueAccent])
                    ),

                    width:width*0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Welcome to the Sri Lanka Tourism webpage! We are delighted to showcase the mesmerizing beauty, rich culture, and warm hospitality of this tropical paradise.\n\nAt Sri Lanka Tourism, our mission is to inspire and assist travelers in discovering the wonders of Sri Lanka. Whether you're seeking stunning beaches, lush tea plantations, ancient historical sites, or thrilling wildlife encounters, Sri Lanka has it all.\n\nImmerse yourself in the cultural diversity of our vibrant cities, such as the bustling capital Colombo with its vibrant markets and historic landmarks. Explore the UNESCO World Heritage Sites of Sigiriya, Polonnaruwa, and Anuradhapura, which offer a glimpse into our ancient civilization and architectural marvels.Experience the breathtaking natural beauty of our national parks, where you can spot majestic elephants, elusive leopards, and colorful birdlife. Enjoy the thrill of whale watching in Mirissa or embark on a scenic train ride through the misty hills of Nuwara Eliya.Indulge in our culinary delights, savoring the flavors of spicy curries, fresh seafood, and aromatic teas. Discover the art of Ayurveda, an ancient healing tradition that rejuvenates mind, body, and soul.\n\nOur team at Sri Lanka Tourism is dedicated to ensuring your journey is filled with unforgettable experiences. Whether you're a solo traveler, a couple seeking a romantic getaway, or a family on an adventure, we will tailor an itinerary that suits your interests and preferences.\n\nWe invite you to explore our website and discover the wonders of Sri Lanka. Let us be your guide as you create memories that will last a lifetime. Come, experience the warmth and beauty of Sri Lanka, where every moment is a captivating story waiting to be told.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  )),
                ),
                
                Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Container(
                        width: width*0.9,
                        height: height*0.5,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 3,offset: Offset(1,1),color: Colors.black)],
                          borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [Colors.black54,Color.fromARGB(255, 44, 43, 43)])
                        ),
                        child:Center(child: Text('We supply the best travel experince!',textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.amberAccent),))
                      ),
                    ),
              
              
              ],
            ),
           
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelectedGallery=false;
                      isSelectedServicves=true;
                      });
                    },
                    child: Column(
                      children: [
                        Text('Services',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        Container(
                          width: 90,
                          height: 3,
                          decoration: BoxDecoration(
                            color:isSelectedServicves? Colors.blueAccent:Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelectedGallery=true;
                      isSelectedServicves=false;
                      });
                    },
                    child: Column(
                      children: [
                        Text('Gallery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Container(
                          width: 90,
                          height: 5,
                          decoration: BoxDecoration(
                            color:isSelectedGallery? Colors.blueAccent:Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            isSelectedServicves? Container(
              width: width>800?width*0.5:width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 241, 241, 241),
                boxShadow: [BoxShadow(
                  blurRadius: 3,spreadRadius: 5,offset: Offset(0,3)
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Our Services",style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: "Personalized Itineraries:",
              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
              children: const <TextSpan>[TextSpan(text: "Our dedicated team of travel experts will work closely with you to create a customized itinerary that suits your preferences, interests, and budget. Whether you're seeking a relaxing beach holiday, an adventurous wildlife expedition, or a cultural immersion, we will craft a unique travel plan that fulfills your dreams.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200))]
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: "Accommodation Arrangements:",
              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
              children: const <TextSpan>[TextSpan(text: "We have established partnerships with a wide range of accommodations, from luxury resorts and boutique hotels to cozy homestays and eco-lodges. We will help you find the perfect place to stay that matches your style and provides the utmost comfort and relaxation during your visit.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200))]
            )),
            
            SizedBox(height: 20,),
 RichText(text: TextSpan(
              text: "Transportation Services: ",
              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
              children: const <TextSpan>[TextSpan(text: "Navigating through Sri Lanka is made easy with our reliable transportation services. We arrange private transfers, chauffeur-driven vehicles, and comfortable coaches to ensure seamless and hassle-free travel between destinations. Sit back, relax, and enjoy the scenic routes as our experienced drivers take you to your desired locations.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200))]
            )),
           
            SizedBox(height: 20,),
RichText(text: TextSpan(
              text: "Local Guides and Experts: ",
              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
              children: const <TextSpan>[TextSpan(text: "To truly immerse yourself in the rich culture, history, and traditions of Sri Lanka, our knowledgeable local guides and experts are ready to accompany you on your explorations. They will share fascinating stories, provide insights into the local way of life, and ensure you don't miss out on any hidden gems that make Sri Lanka so special.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200))]
            )),
           
            SizedBox(height: 20,),
RichText(text: TextSpan(
              text: "24/7 Customer Support: ",
              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
              children: const <TextSpan>[TextSpan(text: "Your satisfaction is our top priority. Our dedicated customer support team is available 24/7 to assist you with any queries, concerns, or emergencies that may arise during your trip. We strive to ensure that you have a seamless and stress-free travel experience from start to finish.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200))]
            )),
           
            SizedBox(height: 20,),
RichText(text: TextSpan(
              text: "Excursions and Activities:",
              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
              children: const <TextSpan>[TextSpan(text: " Enhance your journey with a range of exciting excursions and activities. Embark on thrilling wildlife safaris, go hiking in lush tea plantations, participate in cooking classes to learn the art of Sri Lankan cuisine, or indulge in rejuvenating Ayurvedic spa treatments. We offer a wide array of experiences to cater to every interest and create lifelong memories.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200))]
            )),
           
                  ],
                ),
              ),
            ):Container(
               width: width>800?width*0.5:width*0.9,
              height:height*0.5,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Swiper(itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(images[index],fit: BoxFit.contain,);
                },
                itemWidth:width>800? width*0.50:width*0.7,
                itemHeight: height*0.50,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,

                layout: SwiperLayout.STACK,
                ),
              )
            ),
            SizedBox(height: 20,),
            
            BottomBar()
            
          ],
         ),
        
       ),
    );
  }
}