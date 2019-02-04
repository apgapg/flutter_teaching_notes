import 'dart:convert';
import 'dart:io';

import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/network/api_helper.dart';
import 'package:flutter_teaching_notes/utils/constants.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  final _dataSubject = BehaviorSubject<List<CourseItem>>();

  Stream<List<CourseItem>> get dataStream => _dataSubject.stream;

  Sink get dataSink => _dataSubject.sink;

  HomeBloc() {
    _init();
  }

  void _init() async {
    try {
      var response = await ApiHelper().get(endpoint: "course");
      if (response.isSuccess) {
        var _model = CourseModel.fromJson(json.decode(response.body));
        _dataSubject.sink.add(_model.list);
      } else {
        _dataSubject.addError(ERROR_SOMETHING_WRONG);
      }
    } on SocketException catch (e) {
      _dataSubject.addError(ERROR_NETWORK_ERROR);
    } catch (e) {
      printLog(e);
      _dataSubject.addError(ERROR_SOMETHING_WRONG);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

abstract class BaseBloc {
  void dispose();
}
