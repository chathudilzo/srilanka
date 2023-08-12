import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:srilanka/widgets/menu_drawer.dart';


class Faq{
  final String question;
  final String answer;

  Faq({required this.question,required this.answer});
}


class Faq_Page extends StatefulWidget {
  const Faq_Page({super.key});

  @override
  State<Faq_Page> createState() => _Faq_PageState();
}

class _Faq_PageState extends State<Faq_Page> {
  bool _isLoading=true;
  List<Faq> _faqList=[];


  _loadData()async{
    try{
      String jsonString=await rootBundle.loadString('assets/faq.json');
      List<dynamic> jsonList=json.decode(jsonString);
      print(jsonList);

      List<Faq> faqList=jsonList.map((json){
        return Faq(question: json['question'], answer: json['answer']);
      }).toList();
      if(faqList.isNotEmpty){
        setState(() {
          _faqList=faqList;
          _isLoading=false;
        });
      }
    }catch(e){
      print(e.toString());
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
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
      body: Container(
          width: width,
          height: height,
          child:_isLoading? Center(
            child: LoadingAnimationWidget.beat(color: Colors.blue, size: 50),
          ):ListView.builder(
            itemCount: _faqList.length,
            itemBuilder:(context,index){
              return 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width*0.9,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandablePanel(
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.question_answer),
                              ],
                            ),
                            
                            collapsed:Text(_faqList[index].question,style: TextStyle(color: Color.fromARGB(255, 34, 188, 226),fontSize: 20,fontWeight: FontWeight.bold)),
                            expanded: 
                                   Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Q: ',style: TextStyle(color: Color.fromARGB(255, 226, 34, 34),fontSize: 18,fontWeight: FontWeight.bold)),
                                            Expanded(child:Column(children: [Text(_faqList[index].question,style: TextStyle(color: Color.fromARGB(255, 34, 188, 226),fontSize:width>800? 18:16,fontWeight: FontWeight.bold))],)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Ans: ',style: TextStyle(color: Color.fromARGB(255, 79, 226, 34),fontSize: 18,fontWeight: FontWeight.bold)),
                                            Expanded(child:Column(children: [Text(_faqList[index].answer,style: TextStyle(color: Color.fromARGB(255, 43, 41, 46),fontSize:width>800? 20:14,fontWeight: FontWeight.bold))],)),
                                          ],
                                        )
                                      ],
                                    ),
                                  
                                  ),
                      ),
                    ),
                  );
                     
                   
                      
                      
                      
                   
                 
              
            })
      ),
    );
  }
}