import 'package:http/http.dart' as http;
import 'dart:convert';
class Networkhelp{
  Networkhelp(this.url);
  final String url;
  Future getdata() async{
    http.Response response =await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String data=response.body;
      print(data);
      return jsonDecode(data);
  }
    else{
      print(response.statusCode);
    }
    }

}
