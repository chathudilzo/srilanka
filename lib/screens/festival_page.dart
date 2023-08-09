import 'dart:convert';
import 'package:animated_list_item/animated_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../widgets/menu_drawer.dart';


class Festival{
  final String name;
  final String description;
  final String image;
  final String image1;
  final String image2;

  Festival({required this.name,required this.description,required this.image,required this.image1,required this.image2});
}


class FestivalsPage extends StatefulWidget {
  const FestivalsPage({super.key});

  @override
  State<FestivalsPage> createState() => _FestivalsPageState();
}

class _FestivalsPageState extends State<FestivalsPage> implements TickerProvider{
List<Festival> _festivals=[];
bool _isLoading=true;
late AnimationController _animationController;


static Future<List<Festival>> loadFestivals()async{
  final String jsonString=await rootBundle.loadString('assets/festivals.json');
  final List<dynamic>jsonList=json.decode(jsonString);

  List<Festival> festivals=jsonList.map((json){
    return Festival(
      name: json['name'],
       description: json['description'],
        image: json['image'],
         image1: json['image1'],
          image2: json['image2']
          );
  }).toList();
return festivals;
}


@override
  Ticker createTicker(onTick) {
    return Ticker(onTick);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFestivals();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animationController.forward();
  }


Future<void>_loadFestivals()async{
  final festivals=await loadFestivals();
  if(festivals.isNotEmpty){
    setState(() {
      _festivals=festivals;
    _isLoading=false;
    });
  }
}

Padding item(int index){
  return Padding(
    padding: const EdgeInsets.only(bottom:10.0),
    child: Container(
      width:MediaQuery.of(context).size.width<800?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.5,
          //height: MediaQuery.of(context).size.height*0.4,
      child: Column(
        children: [
          Text(_festivals[index].name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
          SizedBox(height: 10,),
          SizedBox(width:MediaQuery.of(context).size.width*0.5,
          //height: MediaQuery.of(context).size.height*0.3,
          child: Image(image: AssetImage('assets/festivals/${_festivals[index].image}'
          ),fit: BoxFit.contain,
          ),
          ),SizedBox(height: 10,),
          Text(_festivals[index].description,style: TextStyle(color: Colors.black,fontSize: 18),),SizedBox(height: 20,),
          Divider(height: 1,thickness: 5,indent: 40,endIndent: 40,color: Colors.amberAccent,)
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Container(
          width:MediaQuery.of(context).size.width<800? width:width*0.5,
          height: height,
          child:_isLoading?Center(
            child: LoadingAnimationWidget.beat(color: Colors.blue, size: 50),
          ):ListView.builder(
            itemCount: _festivals.length,
            itemBuilder:(context,index){
              return AnimatedListItem(child: item(index), index: index, length: _festivals.length, aniController: _animationController);
            })
        ),
      )
    );
  }
}