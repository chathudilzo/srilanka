import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/widgets/menu_drawer.dart';

import '../classes/news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key,required this.news});

  final News news;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Text(widget.news.title??'',style: TextStyle(color: Colors.blue,fontSize:width>800? 30:20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              ClipRRect(
                        
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        errorBuilder:(context, error, stackTrace) {
                          return Image.asset('assets/news.jpg');
                        },
                        widget.news.imageUrl??'https://cdn.pixabay.com/photo/2015/02/15/09/33/news-636978_1280.jpg',width:width>800? width*0.60:width*0.8,height: 350,),
                      ),
                      SizedBox(height: 10,),
                      Text(widget.news.author??'',style: TextStyle(color: Color.fromARGB(255, 3, 46, 82),fontSize:width>800? 12:12,fontWeight: FontWeight.bold)),
                        SizedBox(width: 10,),
                        Text(widget.news.date??'',style: TextStyle(color: Color.fromARGB(255, 3, 46, 82),fontSize:width> 800? 12:12,fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        Text(widget.news.content??'',style: TextStyle(color: Color.fromARGB(255, 34, 34, 34),fontSize: 16,)),

            ],
          ),
        ),
      ),
    );
  }
}