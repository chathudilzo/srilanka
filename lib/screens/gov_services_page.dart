import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/menu_drawer.dart';


class Ministry{
  final String name;
  final String address;
  final String description;
  final String img;
  bool _isHovering = false;

  Ministry({required this.name,required this.description,required this.address,required this.img});

  bool get isHovering => _isHovering; // Getter for hover state

  set isHovering(bool value) {
    _isHovering = value;
  }
}



class GovServices extends StatefulWidget {
  const GovServices({super.key});

  @override
  State<GovServices> createState() => _GovServicesState();
}

class _GovServicesState extends State<GovServices> {
  List<Ministry> _ministries=[];
  bool _isLoading=true;
  bool _isHovering=false;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  static Future<List<Ministry>> loadMinistries()async{
    final String jsonString=await rootBundle.loadString('assets/goverment.json');
    final List<dynamic> jsonList=json.decode(jsonString);

    List<Ministry> ministries=jsonList.map((json){
      return Ministry(
        name: json['ministryName'], 
        description: json['description'],
         address: json['webAddress'],
         img: json['img']

         );
    }).toList();

    return ministries;
  }



  Future<void> _loadData()async{
    final ministries=await loadMinistries();
    if(ministries.isNotEmpty){
      setState(() {
        _ministries=ministries;
        _isLoading=false;
      });
    }
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
        child: _isLoading?Center(child: LoadingAnimationWidget.beat(color: Colors.black, size: 50),)
        :Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: _ministries.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:width>800?4:1
            ,mainAxisSpacing: 20,crossAxisSpacing: 30),
             itemBuilder: (BuildContext context,index){
              return GridTile(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 3,
                      offset: Offset(1,5),
                      color: Colors.black
                    )],
                    gradient: LinearGradient(colors: [Color.fromARGB(255, 10, 10, 10),Color.fromARGB(255, 49, 72, 73),Color.fromARGB(255, 12, 12, 12)],begin: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          children: [
                            Text(_ministries[index].name,textAlign:TextAlign.center,style: GoogleFonts.robotoCondensed(
                 fontSize: 26,
                 //fontWeight: FontWeight.w900,
                 color: Color.fromARGB(255, 255, 255, 255)
             ),),
                           ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:  Image(
                              width: width>800?width*0.15:width*0.7,
                              height: width>800?width*0.15:width*0.7,
                              image: AssetImage(_ministries[index].img,),fit: BoxFit.fill,),
                            
                           ),
                           InkWell(
                            onFocusChange: (value) {
                              _ministries[index].isHovering=value;
                            },
                            onTap: () {
                              launchUrl(Uri.parse(_ministries[index].address));
                            },
                            child: 
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              
                               Container(
                                width:width>800? width*0.1:width*0.7,
                                
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:_ministries[index].isHovering?Colors.blueAccent: Color.fromARGB(255, 124, 134, 150)
                                ),
                                child: Center(child: DefaultTextStyle(
    style: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
    child: AnimatedTextKit(
      totalRepeatCount: 100,
      animatedTexts: [
        FadeAnimatedText('Visit!'),
        FadeAnimatedText('Click Here!!'),

      ],
      onTap: () {
        print("Tap Event");
      },
    ),
  ),),
                              ),
                            ),
                          ),
                            Text(_ministries[index].description,style: TextStyle(color: Color.fromARGB(255, 230, 228, 211)),),
                            
                          ],
                      ),
                    ),
                  ),
                ),
              ));
             }
             
             ),
        )
        ,
       ),
    );
  }
}