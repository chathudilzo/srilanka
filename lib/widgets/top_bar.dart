import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 185, 37, 32).withOpacity(widget.opacity),Color.fromARGB(255, 20, 20, 20).withOpacity(widget.opacity)])),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sri Lanka',style:GoogleFonts.dancingScript(
              fontSize: 26,
              fontWeight: FontWeight.w900
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
                    color: _isHovering[0]?Color.fromARGB(255, 238, 215, 4):Colors.black,
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
                
              },
              child: Column(
                children: [
                  Text('Province',style: TextStyle(
                    color: _isHovering[1]?Color.fromARGB(255, 238, 215, 4):Colors.black,
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
                    color: _isHovering[2]?Color.fromARGB(255, 238, 215, 4):Colors.black,
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
              child: Container(child: Center(child: Text('LogIn',style: TextStyle(color: Color.fromARGB(255, 236, 119, 23),fontWeight: FontWeight.bold,
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