import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawer:const MenuDrawer(),
      appBar: screenSize.width<800?AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 7, 29, 99),
        title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
              fontSize: 26,
              fontWeight: FontWeight.w900
            )),
      ):
      PreferredSize(child: TopBar(_opacity), 
      preferredSize: Size(screenSize.width, 70)),

      body:SingleChildScrollView(controller: _scrollController,child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: SizedBox(
                  height: screenSize.height*0.65,
                  width: screenSize.width,
                  child: Container(color: Colors.red,),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:screenSize.height*0.65),
                child: Column(
                  children: [
                    Text('ddddddddddd'),
           Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('ddddddddddd'), Text('cccccccccccc'), Text('cccccccccccc'), Text('cccccccccccc'), Text('cccccccccccc'),
                  ],
                ),
              )
            ],
          )
        ],
      ),),
    );
  }
}