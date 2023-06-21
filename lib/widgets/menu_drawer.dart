import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        color: Colors.black,
        child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            InkWell(
              onTap: (){},
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
              onTap: (){},
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
              onTap: (){},
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
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                    'Copyright © 2023 | Dilzo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 211, 215, 218),
                      fontSize: 14,
                    ),
                  ),
              ))
          ],
        ),
        ),
      ),
    );
  }
}