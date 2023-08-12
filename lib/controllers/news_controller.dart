
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:srilanka/classes/news.dart';





class NewsController extends GetxController{

RxList<News> newsData=RxList<News>();




Future<void> getNews()async{
  try{
    final apiUrl='http://localhost:3000/news';
  final response=await http.get(Uri.parse(apiUrl));
  //print(response.body);
  if(response.statusCode==200){
    final data=json.decode(response.body);
    List articles=data['articles'];
    List<News>newsList=articles.map((article){
      String content = article['content'] ?? '';
  // Remove the trailing "[+... chars]" if present
  content = content.replaceAll(RegExp(r'\[+\d+ chars\]'), '').trim();
          return News(
            source: article['source']['name'],
            author: article['author'],
            title: article['title'],
            description: article['description'],
            imageUrl: article['urlToImage'],
            content: article['content'],
            date: DateFormat('yyyy-MM-dd').format(DateTime.parse(article['publishedAt']??''))
            
            
            
          );
        }).toList();
        print(newsList[2].content);

        if(newsList.isNotEmpty){
          newsData.value=newsList;
        }
  }
  }catch(error){
    print(error);
  }
}



}