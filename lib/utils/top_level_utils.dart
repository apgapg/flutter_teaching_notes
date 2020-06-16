import 'package:flutter/material.dart';

bool checkIfNotEmpty(String value) {
  return value != null && value.isNotEmpty && value != "null";
}

bool checkIfListIsNotEmpty(List list) {
  return list != null && list.isNotEmpty;
}

Color getLevelColor(int level) {
  if (level == 1) {
    return Colors.green;
  } else if (level == 2) {
    return Colors.orange;
  } else if (level == 3) {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}
