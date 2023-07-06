import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({super.key});

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {

final CarouselController _controller=CarouselController();


List _isHovering=[false,false,false,false,false,false,false,false];
List _isSelected=[true,false,false,false,false,false,false,false];
List<String>_urls=[];
List<String>_places=[];
int _current=0;

var _isLoading=true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('loaded');
    fetchData();
  }

  fetchData()async{
    try{
      QuerySnapshot snapshot=await FirebaseFirestore.instance.collection('carousel_img').get();
      List<String>urls=[];
      List<String>places=[];

      snapshot.docs.forEach((doc) { 
        
        urls.add(doc['url' as String]);
        places.add(doc['name'] as String);
      });

      setState(() {
        print('loaded$urls');
        print('loaded$places');
        _urls=urls;
        _places=places;
        _isLoading=urls.isEmpty||places.isEmpty?true:false;
      });
    }catch(e){
      setState(() {
        print(e);
        _isLoading=true;
      });
    }
  }

  List<Widget> generateImageTiles(screenSize){
    return _urls.map((e) => ClipRRect(
      borderRadius: BorderRadius.circular(8),
    
      child: Image.network(e,fit: BoxFit.cover,width: double.infinity,),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    var imageSliders=generateImageTiles(screenSize);

    return _isLoading?LoadingAnimationWidget.prograssiveDots(color: Colors.green, size: 35)
    
    :SizedBox(
      height: screenSize.height*0.8,
      width: screenSize.width*0.8,
      child: Stack(
        children: [
          CarouselSlider(items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            height: double.infinity,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            aspectRatio: 19/9,
            onPageChanged: (index, reason) {
              setState(() {
                _current=index;
                for(int i=0;i<imageSliders.length;i++){
                  if(i==index){
                    _isSelected[i]=true;
                  }else{
                    _isSelected[i]=false;
                  }
                }
              });
          },)
          ),AspectRatio(aspectRatio: 12/6,
          child: Center(
            child: Text(_places[_current],style: TextStyle(
                  letterSpacing: 8,
                  fontFamily: 'Electrolize',
                  fontSize: screenSize.width / 25,
                  color:screenSize.width<800?Colors.black: Colors.white,
                ),),
          ),
          ),
          screenSize.width<1100?Container():AspectRatio(aspectRatio: 21/10,child: Center(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(padding: EdgeInsets.only(
                left: screenSize.width/8,
                right: screenSize.width/8),
                child: Card(
                elevation: 5,
                child: Padding(padding:  EdgeInsets.only(
                              top: screenSize.height / 50,
                              bottom: screenSize.height / 50,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for(int i=0;i<_places.length;i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                
                                  children: [
                                     InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onHover: (value) {
                                          setState(() {
                                            value
                                                ? _isHovering[i] = true
                                                : _isHovering[i] = false;
                                          });
                                        },
                                        onTap: () {
                                          _controller.animateToPage(i);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenSize.height / 80,
                                              bottom: screenSize.height / 90),
                                          child: Text(
                                            _places[i],
                                            style: TextStyle(
                                              //fontSize: 12,
                                              color: _isHovering[i]
                                                  ? Colors.blueGrey[900]
                                                  : Colors.blueGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: _isSelected[i],
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 400),
                                          opacity: _isSelected[i] ? 1 : 0,
                                          child: Container(
                                            height: 5,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            width: screenSize.width / 20,
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                            ),
              ),),
            ),
          ),)
        ],
      ),
    );
  }
}