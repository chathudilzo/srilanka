import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srilanka/screens/about.dart';
import 'package:srilanka/screens/homepage_screen.dart';
import 'package:srilanka/screens/province.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
          gradient: LinearGradient(colors:[Color.fromARGB(255, 21, 3, 54),Color.fromARGB(255, 36, 35, 35)])
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(padding: const EdgeInsets.all(10),child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: Image.asset('assets/drawer_icon.jpg',fit: BoxFit.cover,),),
                      ),
                      Text('Sri Lanka',style:GoogleFonts.dancingScript(
               fontSize: 30,
               fontWeight: FontWeight.w900,
               color: Colors.amberAccent
             )),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
              onTap: (){
                Get.to(()=>HomePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.home,size:30,color: Colors.white30,),
                  SizedBox(width: 15,),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                      ),
                      ),
                ],
              ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){
                Get.to(()=>Province());
              },
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.star_half,size:30,color: Colors.white30,),
                  SizedBox(width: 15,),
                  Text(
                    'Province',
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                      ),
                      ),
                ],
              ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){
                Get.to(()=>About());
              },
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.man,size:30,color: Colors.white30,),
                  SizedBox(width: 15,),
                  Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                      ),
                      ),
                ],
              ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){},
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.login,size:30,color: Colors.white30,),
                  SizedBox(width: 15,),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                      ),
                      ),
                ],
              ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){},
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.app_registration_rounded,size:30,color: Colors.white30,),
                  SizedBox(width: 15,),
                  Text(
                    'Signup',
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                      ),
                      ),
                ],
              ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              ],
            ),),
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height* 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(100)),
                    image: DecorationImage(image: AssetImage('assets/placeholder.jpg'),fit: BoxFit.cover)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Copyright © 2023 | Dilzo',
                          style: TextStyle(
                            color: Color.fromARGB(255, 88, 88, 88),
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              ))
          ],
        ),
        ),
   
    );
  }
}