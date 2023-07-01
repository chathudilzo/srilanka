import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/menu_drawer.dart';
import 'package:srilanka/widgets/top_bar.dart';

import '../widgets/post.dart';

class Province extends StatefulWidget {
  const Province({super.key});

  @override
  State<Province> createState() => _ProvinceState();
}

class _ProvinceState extends State<Province> {

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
var screenSize=MediaQuery.of(context).size;

_opacity=_scrollPosition<=screenSize.width*0.40?_scrollPosition/(screenSize.width*0.40)+0.25:1;


    return Scaffold(
      drawer: MenuDrawer(),
      appBar: screenSize.width<800?AppBar(iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 7, 29, 99),
        title:Text('Sri Lanka',style:GoogleFonts.dancingScript(
              fontSize: 26,
              fontWeight: FontWeight.w900
            )),
      ):PreferredSize(child: TopBar(_opacity), preferredSize: Size(screenSize.width, 50)),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenSize.width,
          child: SingleChildScrollView(
            controller: _scrollController,
              scrollDirection: Axis.horizontal,
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                      
                      SizedBox(
                        
                        width: screenSize.width*0.65,
                        height:screenSize.height*0.65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),child: Image.asset('assets/slmap.png',fit: BoxFit.contain,),
                        )
                        ),
                
                 
                  
                    Post(screenSize: screenSize,),Post(screenSize: screenSize,),Post(screenSize: screenSize,),Post(screenSize: screenSize,),Post(screenSize: screenSize,)
                  ],
                ),
              ),
        ),
          ),
            
    );
  }
}

