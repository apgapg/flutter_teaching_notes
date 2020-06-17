import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:http/http.dart' as http;

class NetworkResponse {
  final http.Response _response;

  NetworkResponse(this._response) {
    _logRequest(_response);
  }

  bool get isSuccess =>
      (_response.statusCode >= 200 && _response.statusCode <= 300);

  String get body => _response.body;

  String get statusCode => _response.statusCode.toString();

  void _logRequest(http.Response response) {
    printLog("*****NETWORK REQUEST START*****");
    printLog("NetworkReq Url: " + _response.request.url.toString());
    printLog("NetworkReq Status: " + _response.statusCode.toString());
    printLog("NetworkReq Body: " + _response.body);
    printLog("*****NETWORK REQUEST END*****");
  }
}
