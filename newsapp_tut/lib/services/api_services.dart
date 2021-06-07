import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp_tut/model/article_model.dart';

// now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  // let's add am Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  // for this examplle i'm goint to use a singel endpoint

  // NOTE: make sure to use your owm apikey, you can make a free acount and
  // choose a developer option
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7bc9f5bb1fca4f139e60be3e7060d1e6";
  // now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    //first of all let's check that we got a 200 status code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      // this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Article");
    }
  }
}
