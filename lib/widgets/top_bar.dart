
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/province.dart';


class TopBar extends StatefulWidget {
   const TopBar(this.opacity, {super.key});

  final double opacity;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

final List _isHovering=[false,false,false];

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 59, 59, 59).withOpacity(widget.opacity),Color.fromARGB(255, 15, 57, 73).withOpacity(widget.opacity)])),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sri Lanka',style:GoogleFonts.dancingScript(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 6, 31, 1)
            )),
            SizedBox(width: screenSize.width/15,),
            InkWell(
              onHover: (value) {
                setState(() {
                  value?_isHovering[0]=true:_isHovering[0]=false;
                });
              },
              onTap: () {
                
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Home',style: TextStyle(
                    color: _isHovering[0]?Color.fromARGB(255, 165, 14, 107):Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),SizedBox(height: 5,),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[0],
                    child: Container(
                    height: 2,
                    width: 20,
                    color: Colors.amberAccent,
                  ))
                ],
              ),
            ),
            SizedBox(width: screenSize.width/15,),
            InkWell(
              onHover: (value) {
                setState(() {
                  value?_isHovering[1]=true:_isHovering[1]=false;
                });
              },
              onTap: () {
                Get.to(()=>Province());
              },
             
                child: Column(
                  children: [
                    Text('Province',style: TextStyle(
                      color: _isHovering[1]?Color.fromARGB(255, 165, 14, 107):Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                    SizedBox(height: 5,),
                    Visibility(
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      visible: _isHovering[1],
                      child: Container(width: 20,height: 2,color: Colors.amber,))
                  ],
                ),
              ),
         
             SizedBox(width: screenSize.width/15,),
            InkWell(
              onHover: (value) {
                setState(() {
                  value?_isHovering[2]=true:_isHovering[2]=false;
                });
              },
              onTap: () {
                
              },
              child: Column(
                children: [
                  Text('About',style: TextStyle(
                    color: _isHovering[2]?Color.fromARGB(255, 165, 14, 107):Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                  SizedBox(height: 5,),
                  Visibility(
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    visible: _isHovering[2],
                    child: Container(width: 20,height: 2,color: Colors.amber,))
                ],
              ),
            ),
            SizedBox(width: screenSize.width/15,),
            GestureDetector(
              
              onTap: () {
                
              },
              child: Container(child: Center(child: Text('LogIn',style: TextStyle(color: Color.fromARGB(255, 140, 4, 158),fontWeight: FontWeight.bold,
                      fontSize: 16),),),),
            ),
            SizedBox(width: screenSize.width/40,),
            ElevatedButton(onPressed: (){}, child: Center(child: Text('SignUp')))
          ],
        ),
      ),
    );
  }
}