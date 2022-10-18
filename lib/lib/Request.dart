import 'package:http/http.dart' as http;
import 'dart:convert';

class Request {

  static const String _uri = 'https://worldtimeapi.org/api/';
  static Request _request = Request._instance();

  factory Request(){
    return _request;
  }

  Request._instance();

  Future get(uri, { Function? onResponseError }) async {

    http.Response response = await http.get(Uri.parse(_uri+uri));

    if(response.statusCode != 200 && onResponseError != null){
      onResponseError(response.statusCode);
    }

    return json.decode(response.body);

  }

}