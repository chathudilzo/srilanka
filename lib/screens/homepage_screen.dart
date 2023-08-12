import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/bottom_bar.dart';
import 'package:srilanka/widgets/carousel.dart';
import 'package:srilanka/widgets/featured_heading.dart';
import 'package:srilanka/widgets/featured_tiles.dart';
import 'package:srilanka/widgets/general_info_bar.dart';
import 'package:srilanka/widgets/homeTopScroll.dart';
import 'package:srilanka/widgets/quick_access_bar.dart';
import 'package:srilanka/widgets/top_bar.dart';

import '../widgets/menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final ScrollController _scrollController=ScrollController();
double _opacity=0;

double _scrollPosition=0;


 final colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

final colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

_scrollListner(){
    setState(() {
      _scrollPosition=_scrollController.position.pixels;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_scrollListner);
  }

// Widget _animeText(){
//   return SizedBox(
//   width: 250.0,
//   child: AnimatedTextKit(
//     animatedTexts: [
//       ColorizeAnimatedText(
//         'Welcome',
//         textStyle: colorizeTextStyle,
//         colors: colorizeColors,
//       ),
//       ColorizeAnimatedText(
//         'To',
//         textStyle: colorizeTextStyle,
//         colors: colorizeColors,
//       ),
//       ColorizeAnimatedText(
//         'Sri Lanka',
//         textStyle: colorizeTextStyle,
//         colors: colorizeColors,
//       ),
//     ],
//     isRepeatingAnimation: true,
//     onTap: () {
//       print("Tap Event");
//     },
//   ),
// );
// }
  

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)+0.25
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      
       appBar: AppBar(
         iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0),size: 50),
         elevation: 0,
         backgroundColor: Color.fromARGB(255, 7, 29, 99).withOpacity(0.001),
         title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
               fontSize: 26,
               fontWeight: FontWeight.w900
             )),
       ),
       endDrawer: const MenuDrawer(),
       
      // PreferredSize(child: TopBar(_opacity), 
      // preferredSize: Size(screenSize.width, 70)),

      body:SingleChildScrollView(controller: _scrollController,child: Column(
        children: [
          TopScroll(),
          FloatingQuickAccessBar(screenSize:screenSize),
          //_animeText(),
          Text('Welcome To Sri Lanka!',textAlign: TextAlign.center,style:GoogleFonts.dancingScript(
               fontSize:screenSize.width<800?40: 60,
               fontWeight: FontWeight.bold
             )),
             GeneralBar(),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const MainCarousel(),
              )
             , 
             
            ],
          ),
           Column(

                  children: [
                    Center(
                      child: SizedBox(
                        width: screenSize.width,
                        height: screenSize.height*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: 20.0, height: 100.0),
           Text(
            'Explore',
            style: TextStyle(
              fontSize:screenSize.width<800?20: 43.0,
              color: Color.fromARGB(255, 6, 155, 201),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20.0, height: 100.0),
          DefaultTextStyle(
            style:  TextStyle(
              fontSize: screenSize.width<800?20: 43.0,
              fontFamily: 'Horizon',
              color: Color.fromARGB(255, 7, 7, 7),
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText('Breathtaking Views'),
                RotateAnimatedText('Cultural Diversity'),
                RotateAnimatedText('Unforgettable Adventures'),
                RotateAnimatedText('Exquisite Cuisine'),
    RotateAnimatedText('Historical Landmarks'),
    RotateAnimatedText('Thrilling Water Sports'),
    RotateAnimatedText('Enchanting Beaches'),
    RotateAnimatedText('Wildlife Safari'),
    RotateAnimatedText('Traditional Crafts'),
    RotateAnimatedText('Festivals and Events'),
    RotateAnimatedText('Tranquil Retreats'),
    RotateAnimatedText('Local Hospitality'),
              ],
              onTap: () {
                // You can navigate to a specific page when tapped
                //Navigator.pushNamed(context, '/explore');
              },
            ),
          ),
        ],
      ),
                      ),
                    ),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize:screenSize),
                    
                    
                    SizedBox(height: 20,),
                    BottomBar()
                  ],
                ),
        ],
      ),),
    );
  }
}