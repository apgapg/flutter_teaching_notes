bool checkIfNotEmpty(String value) {
  return value != null && value.isNotEmpty && value != "null";
}

bool checkIfListIsNotEmpty(List list) {
  return list != null && list.isNotEmpty;
}
