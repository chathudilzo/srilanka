import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:srilanka/content_controller.dart';

import '../responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({Key? key, required this.screenSize}) : super(key: key);
  final screenSize;

  @override
  State<FloatingQuickAccessBar> createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
//ContentController _controller=Get.find();

List _isHovering=[false,false,false,false,false,false];

  List<Widget> rowElements=[];

  List<String> items=['Historical','Cultural','Natural','WildLife','Adventure','Gardens'];

  List<IconData>icons=[Icons.history,Icons.temple_buddhist,Icons.nature,Icons.pets,Icons.hiking,Icons.grass];


  List<Widget>generateRowElements(){
    rowElements.clear();

    for(int i=0;i<items.length;i++){
      Widget elementTile=InkWell(
        splashColor:Colors.transparent,
        hoverColor: Colors.transparent,
        
        onHover: (value) {
          setState(() {
            value?_isHovering[i]=true:_isHovering[i]=false;
          });
        },
        onTap: () {
          
        },
        child: Text(items[i],style: TextStyle(color:_isHovering[i]?Colors.blueAccent:Colors.blueGrey,fontWeight: FontWeight.bold),),
      );
      Widget spacer=SizedBox(
        height:widget.screenSize.height/20,
        child: VerticalDivider(color: Colors.blueGrey,width: 1,thickness: 1,),
      );
      Widget icon=Icon(icons[i],color: Colors.blueAccent,);
      rowElements.add(icon);
      rowElements.add(elementTile);
      if(i<items.length-1){
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.01,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),child: widget.screenSize.width<800?Column(
children: [
  for(int i=0;i<items.length;i++)
  Padding(padding: EdgeInsets.only(bottom: widget.screenSize.height/45),child: Card(
    elevation: 4,
    child:Padding(
                 padding:  EdgeInsets.only(top:widget.screenSize.height/45,bottom: widget.screenSize.height/45,left:widget.screenSize.height/45),
                 child: Row(
                   children: [
                    Icon(icons[i],color: Colors.blueAccent,),
                    SizedBox(width: widget.screenSize.width/50,),
                     InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
              value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
              color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
          ),
        ),
      ),
                   ],
                 ),
               ),
              ),
            ),
          ],
        ):Card(
          color: Colors.black,
          elevation: 5,
          child: Padding(padding: EdgeInsets.only(top: widget.screenSize.height/50,bottom: widget.screenSize.height/50),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
              generateRowElements()
            ,
          ),),
        )
      ),
    );
  }
}