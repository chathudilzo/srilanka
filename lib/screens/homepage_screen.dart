import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/bottom_bar.dart';
import 'package:srilanka/widgets/carousel.dart';
import 'package:srilanka/widgets/featured_heading.dart';
import 'package:srilanka/widgets/featured_tiles.dart';
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

  

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)+0.25
        : 1;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawer:const MenuDrawer(),
      // appBar: screenSize.width<800?AppBar(
      //   iconTheme: IconThemeData(color: Colors.blue),
      //   elevation: 0,
      //   backgroundColor: Color.fromARGB(255, 7, 29, 99),
      //   title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
      //         fontSize: 26,
      //         fontWeight: FontWeight.w900
      //       )),
      // ):
      // PreferredSize(child: TopBar(_opacity), 
      // preferredSize: Size(screenSize.width, 70)),

      body:SingleChildScrollView(controller: _scrollController,child: Column(
        children: [
          TopScroll(),
          FloatingQuickAccessBar(screenSize:screenSize),
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