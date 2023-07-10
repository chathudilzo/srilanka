import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:srilanka/screens/about.dart';
import 'package:srilanka/screens/homepage_screen.dart';
import 'package:srilanka/screens/province.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Color.fromARGB(255, 21, 3, 54),Color.fromARGB(255, 66, 66, 66)])
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(padding: const EdgeInsets.all(10),child: Column(
              children: [
                InkWell(
              onTap: (){
                Get.to(()=>HomePage());
              },
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,fontSize: 16
                  ),
                  ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){
                Get.to(()=>Province());
              },
              child: Text(
                'Province',
                style: TextStyle(
                  color: Colors.white,fontSize: 16
                  ),
                  ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){
                Get.to(()=>About());
              },
              child: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,fontSize: 16
                  ),
                  ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){},
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,fontSize: 16
                  ),
                  ),
            ),Padding(
              padding: const  EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Divider(color: Colors.grey,thickness: 2,)
              ,),
              InkWell(
              onTap: (){},
              child: Text(
                'Signup',
                style: TextStyle(
                  color: Colors.white,fontSize: 16
                  ),
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