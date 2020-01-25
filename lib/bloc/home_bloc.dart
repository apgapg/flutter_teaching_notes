import 'dart:convert';
import 'dart:io';

import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/network/api_helper.dart';
import 'package:flutter_teaching_notes/utils/constants.dart';
import 'package:flutter_teaching_notes/utils/file_utils.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  final _dataSubject = BehaviorSubject<List<CourseItem>>();

  Stream<List<CourseItem>> get dataStream => _dataSubject.stream;

  Sink get dataSink => _dataSubject.sink;

  HomeBloc() {
    //_init();
  }

  void _init() async {
    bool hasCacheData = await getData();

    try {
      var response = await ApiHelper().get(endpoint: "course");
      if (response.isSuccess) {
        var _model = CourseModel.fromJson(json.decode(response.body));
        _dataSubject.sink.add(_model.list);
        saveResponse(response.body);
      } else {
        if (!hasCacheData) _dataSubject.addError(ERROR_SOMETHING_WRONG);
      }
    } on SocketException catch (e) {
      if (!hasCacheData) _dataSubject.addError(ERROR_NETWORK_ERROR);
    } catch (e) {
      printLog(e);
      if (!hasCacheData) _dataSubject.addError(ERROR_SOMETHING_WRONG);
    }
  }

  @override
  void dispose() {
    _dataSubject.close();
  }

  void saveResponse(String text) {
    FileUtils.dataFile.then((file) {
      file.writeAsString(text);
    });
  }

  Future<bool> getData() async {
    File file = await FileUtils.dataFile;
    try {
      var text = file.readAsStringSync();
      var _model = CourseModel.fromJson(jsonDecode(text));
      _dataSubject.sink.add(_model.list);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

abstract class BaseBloc {
  void dispose();
}
