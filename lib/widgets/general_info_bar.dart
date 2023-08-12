import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GeneralBar extends StatefulWidget {
  const GeneralBar({super.key});

  @override
  State<GeneralBar> createState() => _GeneralBarState();
}

class _GeneralBarState extends State<GeneralBar> {
bool _isLoading=true;
Map<String, dynamic> _data={};

_loadJson()async{
  String path='assets/general.json';

  String jsonString=await rootBundle.loadString(path);
  print(jsonString);

if(jsonString.isNotEmpty){
  setState(() {
    _data=json.decode(jsonString);
    _isLoading=false;
  });
}
 
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      width: width,
      child:_isLoading?LoadingAnimationWidget.bouncingBall(color: Colors.blueAccent, size: 40):
                Column(
                  children: [
                    width>800?
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Column(
                              children: [
                                Text('Demographics',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                                SvgPicture.asset('assets/image.svg'),
                                SizedBox(height: 5,),
                                Container(
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 195, 243, 252)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('The population of Sri Lanka is roughly ${_data['population']['value']} million with annual population growth rate of ${_data['population']['growthRate']}%'),
                                  ),)
                              ],
                            )),
                          ),
                        ),
                      ),
                      

                      Container(
                        width: width*0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Geography',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Coordinates : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['coordinates']}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Area : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['area']}'),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Coastline : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['coastline']}'),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Largest City : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['largestCity']}'),
                                ],
                              ),
                              
                              SizedBox(height: 5,),
                              Container(
                                    width: width*0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 195, 243, 252)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('An island southeast of the Indian subcontinent, Sri Lanka is strategically located close to major shipping lanes.'),
                                    ),)
                            ],
                          ),
                        ),
                      ), 
                      ),

                      Container(
                        width: width*0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: 
                              Column(
                                children: [

                                  Center(child: Text('GDP Rate',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                Text(_data['GDPRate'],style: TextStyle(color: Color.fromARGB(255, 40, 4, 141),fontSize: 40,fontWeight: FontWeight.bold)),
                                ],
                              ),
                              
                          
                        ),
                      ), 
                      ),
                      Container(
                        width: width*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: 
                              Column(
                                children: [
                                  
                                  Center(child: Text('lifeExpectancy',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Center(child: Text('(Years)',style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                            Text(_data['health']['lifeExpectancy']['male'],style: TextStyle(color: Color.fromARGB(255, 40, 4, 141),fontSize: 35,fontWeight: FontWeight.bold)),
                                          Center(child: Text('male',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                        
                                        ],
                                        
                                      ),
                                      Divider(color: Color.fromARGB(255, 0, 0, 0),height: 2,thickness: 5,),
                                      Column(
                                        children: [
                                              Text(_data['health']['lifeExpectancy']['female'],style: TextStyle(color: Color.fromARGB(255, 40, 4, 141),fontSize: 35,fontWeight: FontWeight.bold)),
                                          Center(child: Text('female',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                        
                                        ],
                                        
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                          
                        ),
                      ), 
                      ),

                    ],
                  ):Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Column(
                              children: [
                                Text('Demographics',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                                SvgPicture.asset('assets/image.svg'),
                                SizedBox(height: 5,),
                                Container(
                                  width: width*0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 195, 243, 252)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('The population of Sri Lanka is roughly ${_data['population']['value']} million with annual population growth rate of ${_data['population']['growthRate']}%'),
                                  ),)
                              ],
                            )),
                          ),
                        ),
                      ),
                      

                      Container(
                        width: width*0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Geography',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Coordinates : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['coordinates']}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Area : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['area']}'),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Coastline : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['coastline']}'),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Largest City : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${_data['geography']['largestCity']}'),
                                ],
                              ),
                              
                              SizedBox(height: 5,),
                              Container(
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 195, 243, 252)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('An island southeast of the Indian subcontinent, Sri Lanka is strategically located close to major shipping lanes.'),
                                    ),)
                            ],
                          ),
                        ),
                      ), 
                      ),

                      Container(
                        width: width*0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: 
                              Column(
                                children: [

                                  Center(child: Text('GDP Rate',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                Text(_data['GDPRate'],style: TextStyle(color: Color.fromARGB(255, 40, 4, 141),fontSize: 40,fontWeight: FontWeight.bold)),
                                ],
                              ),
                              
                          
                        ),
                      ), 
                      ),
                      Container(
                        width: width*0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: 
                              Column(
                                children: [
                                  
                                  Center(child: Text('lifeExpectancy',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Center(child: Text('(Years)',style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                            Text(_data['health']['lifeExpectancy']['male'],style: TextStyle(color: Color.fromARGB(255, 40, 4, 141),fontSize: 35,fontWeight: FontWeight.bold)),
                                          Center(child: Text('male',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                        
                                        ],
                                        
                                      ),
                                      Divider(color: Color.fromARGB(255, 0, 0, 0),height: 2,thickness: 5,),
                                      Column(
                                        children: [
                                              Text(_data['health']['lifeExpectancy']['female'],style: TextStyle(color: Color.fromARGB(255, 40, 4, 141),fontSize: 35,fontWeight: FontWeight.bold)),
                                          Center(child: Text('female',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                                        
                                        ],
                                        
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                          
                        ),
                      ), 
                      ),

                    ],
                  )
                  ],
                )
            
           
      
          
      
      
      
    );
  }
}