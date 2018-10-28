import 'dart:async';
import 'package:http/http.dart' as http;

class NetUtils{
  // get请求的封装，请求参数map格式
  static Future<String> get(String url,{Map<String,String> params}) async{
    if(params != null && params.isNotEmpty){
      StringBuffer sb = new StringBuffer('');
      params.forEach((key ,value){
        sb.write("$key"+"=" + "$value");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url+=paramStr;
    }
    http.Response res = await http.get(url);
    return res.body;
  }

  // post请求
  static Future<String> post(String url ,{Map<String,String> params}) async{
    http.Response res = await http.post(url,body:params);
    return res.body;
  }
}