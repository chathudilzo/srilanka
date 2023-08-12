import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:srilanka/controllers/news_controller.dart';
import 'package:srilanka/screens/news_page.dart';
import 'package:srilanka/widgets/menu_drawer.dart';

import '../classes/news.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

List<News> newsList=[];

NewsController controller=Get.find();




Future<void>loadNews()async{
await controller.getNews();

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNews();
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
      body: Center(
        child: Obx(
          (){
            if(controller.newsData.isEmpty){
              return Center(
                child: LoadingAnimationWidget.beat(color: Colors.blue, size: 50),
              );
            }else{
              return Container(
                width: width*0.6,
                child: GridView.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:width>800? 2:1),
                  itemCount: controller.newsData.length,
                  itemBuilder: (context,index){
                    final news=controller.newsData[index];
                    return NewsContainer(news:news);
                  }
                  ),
              );
            }
          }
        ),
      ),
    );
  }
}


class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key,required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Get.to(()=>NewsPage(news: news));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,color: Colors.black
            )]
          ),
          width: width*0.3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(news.title??'',style: TextStyle(color: Colors.blue,fontSize:width>800? 20:16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  //news.imageUrl!=null?
                    ClipRRect(
                      
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      errorBuilder:(context, error, stackTrace) {
                        return Image.asset('assets/news.jpg');
                      },
                      news.imageUrl??'https://cdn.pixabay.com/photo/2015/02/15/09/33/news-636978_1280.jpg',width:width>800? width*0.25:width*0.8,height: 200,),
                    )
                  //):Container(),
                  ,
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(news.author??'',style: TextStyle(color: Color.fromARGB(255, 3, 46, 82),fontSize:width>800? 12:12,fontWeight: FontWeight.bold)),
                      SizedBox(width: 10,),
                      Text(news.date??'',style: TextStyle(color: Color.fromARGB(255, 3, 46, 82),fontSize:width> 800? 12:12,fontWeight: FontWeight.bold)),
                    ],),
                  ),
                  Text(news.description??'',style: TextStyle(color: Color.fromARGB(255, 34, 34, 34),fontSize: 16,)),
                  SizedBox(height: 10,),
                  Text(news.source??'',style: TextStyle(color:Color.fromARGB(255, 80, 80, 80),fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}