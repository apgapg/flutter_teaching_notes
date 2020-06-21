import 'dart:async';
import 'dart:convert';

import 'package:flutter_teaching_notes/utils/log_utils.dart';

import 'base_prefs.dart';

final prefsHelper = SharedPrefsHelper();

class SharedPrefsHelper {
  static SharedPrefsHelper _instance;
  BasePrefs _prefs;
  final String prefsSessionId = "SessionId";
  final String prefsToken = "TOKEN";
  final String prefsImages = "images";
  final String prefsIsBeatSelected = "IsBeatSelected";
  final String prefsIsLogin = "LOGIN";
  final String prefsIsDayStarted = "STARTED";
  final String prefsName = "NAME";
  final String PREFS_BEAT = "SelectedBeat";
  final String prefsRoute = "SelectedRoute";
  final String prefsEntitySync = "entitySync";
  String PREFS_NON_WORKING_LIST = "nonworkinglist";
  String PREFS_SESSION_DATE = "sessionDate";
  String PREFS_MARKED_LEAVE = "markedLeave";
  String PREFS_USER_RANK = "userRank";
  String CONFIG_COMPANY_NAME = "config_companyName";
  String CONFIG_SHOW_BEATS = "config_showBeats";
  String PREFS_TEMP_MSQID = "tempmsqId";
  String PREFS_TEMP_HEADEND_TITLE = "tempheadend";
  String PREFS_PREFILLED_DATA = "prefilleddata";
  String PREFS_PLANNER_FILLED = "plannerfilled";
  String PREFS_PLANNING_MODEL = "planningModel";
  String PREFS_PLANNER_DOCUMENT_ID = "planningDocumentId";
  static const String PREFS_PREFILL_BEAT = "internal_beat";
  static const String PREFS_PREFILL_MSO = "internal_mso";
  static const String PREFS_PREFILL_PHASE = "internal_phase";
  static const String PREFS_PREFILL_AUDIT_DATE = "internal_audit_date";
  static const String PREFS_CLIENT_SELECTED = "debugclientselected";
  static const String PREFS_SELECTED_CLIENT = "debugselectedclient";
  static const String PREFS_TEMP_LCO_NAME_LIST = "templcoNameList";
  static const String PREFS_MOBILE_NUMBER = "mobilenumber";
  static const String PREFS_MENU_LIST = "showMenuList";
  static const String PREFS_LAST_VISIT_ITEM_LIST = "lastvisititemlist";
  static const String PREFS_LEAD_ID = "leadId";
  static const String PREFS_LOCALE = "locale";
  static const String PREFS_CITY = "tempcity";
  static const String PREFS_COMPANY = "selectedcompany";
  static const String PREFS_LAST_LOCATION = "lastLocations";
  static const String PREFS_GLOBAL_USER = "globaladminuser";
  static const String PREFS_DARK_MODE = "darkMode";
  static const String PREFS_COMPANY_SELECTED = "globaladminusercompanyselected";
  static const String PREFS_COMPANY_SELECTION_LIST =
      "globaladminusercompanyselectionlist";
  static const String PREFS_MANAGER = "isManager";
  static const String prefsIsAdmin = "isAdmin";
  static const String PREFS_FIELD_USER = "isFieldUser";

  static const String userDesignation = 'userDesignation';
  static const String userDivision = 'userDivision';

  static const String PREFS_FIRST_TIME = 'firstTime';
  static const String PREFS_LAST_LOCATION_LIST = 'trackLocationList';

  static const String PREFS_LAST_ACTIVITY = 'lastActivity';

  static const String _showElementInfo = 'showElementInfo';

  static const String _userData = 'userData';

  bool get showElementInfo => _prefs.getBool(_showElementInfo) ?? true;

  set userData(String value) => _prefs.setString(_userData, value);

  String get userData => _prefs.getString(_userData);

  set showElementInfo(value) => _prefs.setBool(_showElementInfo, value);

  set firstTime(value) => _prefs.setBool(PREFS_FIRST_TIME, value);

  bool get firstTime => _prefs.getBool(PREFS_FIRST_TIME) ?? false;

  set isManager(value) => _prefs.setBool(PREFS_MANAGER, value);

  bool get isManager => _prefs.getBool(PREFS_MANAGER) ?? false;

  set isAdmin(value) => _prefs.setBool(prefsIsAdmin, value);

  bool get isAdmin => _prefs.getBool(prefsIsAdmin) ?? false;

  set isFieldUser(value) => _prefs.setBool(PREFS_FIELD_USER, value);

  bool get isFieldUser => _prefs.getBool(PREFS_FIELD_USER) ?? false;

  set globalAdminUser(value) => _prefs.setBool(PREFS_GLOBAL_USER, value);

  bool get globalAdminUser => _prefs.getBool(PREFS_GLOBAL_USER) ?? false;

  set darkMode(value) => _prefs.setBool(PREFS_DARK_MODE, value);

  bool get darkMode => _prefs.getBool(PREFS_DARK_MODE);

  set companySelected(value) => _prefs.setBool(PREFS_COMPANY_SELECTED, value);

  get companySelected => _prefs.getBool(PREFS_COMPANY_SELECTED) ?? false;

  set selectedClient(value) => _prefs.setInt(PREFS_SELECTED_CLIENT, value);

  get selectedClient => _prefs.getInt(PREFS_SELECTED_CLIENT);

  set lastLocation(value) => _prefs.setString(PREFS_LAST_LOCATION, value);

  get lastLocation => _prefs.getString(PREFS_LAST_LOCATION);

  set company(value) => _prefs.setString(PREFS_COMPANY, value);

  get company => _prefs.getString(PREFS_COMPANY);

  set companySelectionList(value) =>
      _prefs.setString(PREFS_COMPANY_SELECTION_LIST, value);

  String get companySelectionList =>
      _prefs.getString(PREFS_COMPANY_SELECTION_LIST);

  set mobile(value) => _prefs.setString(PREFS_MOBILE_NUMBER, value);

  get mobile => _prefs.getString(PREFS_MOBILE_NUMBER);

  set city(value) => _prefs.setString(PREFS_CITY, value);

  get city => _prefs.getString(PREFS_CITY);

  set lastActivity(value) => _prefs.setString(PREFS_LAST_ACTIVITY, value);

  get lastActivity => _prefs.getString(PREFS_LAST_ACTIVITY);

  set leadId(value) => _prefs.setString(PREFS_LEAD_ID, value);

  get leadId => _prefs.getString(PREFS_LEAD_ID);

  set locale(value) => _prefs.setString(PREFS_LOCALE, value);

  get locale => _prefs.getString(PREFS_LOCALE);

  set showMenuList(value) => _prefs.setStringList(PREFS_MENU_LIST, value);

  get showMenuList => _prefs.getStringList(PREFS_MENU_LIST);

  get locationList => _prefs.getStringList(PREFS_LAST_LOCATION_LIST);

  set lastVisitItemList(value) =>
      _prefs.setStringList(PREFS_LAST_VISIT_ITEM_LIST, value);

  List<String> get lastVisitItemList =>
      _prefs.getStringList(PREFS_LAST_VISIT_ITEM_LIST);

  set isClientSelected(value) => _prefs.setBool(PREFS_CLIENT_SELECTED, value);

  get isClientSelected => _prefs.getBool(PREFS_CLIENT_SELECTED) ?? false;

  set plannerFilled(value) => _prefs.setBool(PREFS_PLANNER_FILLED, value);

  get plannerFilled => _prefs.getBool(PREFS_PLANNER_FILLED) ?? false;

  //Company Identifier
  set config_companyName(value) => _prefs.setString(CONFIG_COMPANY_NAME, value);

  get config_companyName => _prefs.getString(CONFIG_COMPANY_NAME);

  set config_showBeats(value) => _prefs.setBool(CONFIG_SHOW_BEATS, value);

  get config_showBeats => _prefs.getBool(CONFIG_SHOW_BEATS);

  //
  set lcoNameList(value) =>
      _prefs.setStringList(PREFS_TEMP_LCO_NAME_LIST, value);

  List<String> get lcoNameList =>
      _prefs.getStringList(PREFS_TEMP_LCO_NAME_LIST);

  set phase(value) => _prefs.setString(PREFS_PREFILL_PHASE, value);

  get phase => _prefs.getString(PREFS_PREFILL_PHASE);

  set list_MSO(value) => _prefs.setStringList(PREFS_PREFILL_MSO, value);

  set userRank(value) => _prefs.setInt(PREFS_USER_RANK, value);

  get userRank => _prefs.getInt(PREFS_USER_RANK) ?? 0;

  set markedLeave(value) => _prefs.setBool(PREFS_MARKED_LEAVE, value);

  get markedLeave => _prefs.getBool(PREFS_MARKED_LEAVE) ?? false;

  set nonWorkingActivities(list) =>
      _prefs.setStringList(PREFS_NON_WORKING_LIST, list);

  List<String> get nonWorkingActivities =>
      _prefs.getStringList(PREFS_NON_WORKING_LIST);

  set sessionDay(value) => _prefs.setInt(PREFS_SESSION_DATE, value);

  int get sessionDay => _prefs.getInt(PREFS_SESSION_DATE);

  factory SharedPrefsHelper() {
    if (_instance == null)
      return _instance = SharedPrefsHelper._internal();
    else
      return _instance;
  }

  SharedPrefsHelper._internal();

  set sessionId(value) => _prefs.setString(prefsSessionId, value);

  String get sessionId => _prefs.getString(prefsSessionId);

  String get token => _prefs.getString(prefsToken);

  set token(value) => _prefs.setString(prefsToken, value);

  String get designation => _prefs.getString(userDesignation) ?? "";

  set designation(value) => _prefs.setString(userDesignation, value);

  String get division => _prefs.getString(userDivision) ?? "";

  set division(value) => _prefs.setString(userDivision, value);

  String get images => _prefs.getString(prefsImages);

  get isBeatSelected => _prefs.getBool(prefsIsBeatSelected) ?? false;

  set isBeatSelected(value) => _prefs.setBool(prefsIsBeatSelected, value);

  bool get isLogin => _prefs.getBool(prefsIsLogin) ?? false;

  set isLogin(value) => _prefs.setBool(prefsIsLogin, value);

  bool get isDayStarted => _prefs.getBool(prefsIsDayStarted) ?? false;

  set isDayStarted(value) => _prefs.setBool(prefsIsDayStarted, value);

  String get name => (_prefs.getString(prefsName) ?? "").trim();

  set name(value) => _prefs.setString(prefsName, value);

  String get beat => _prefs.getString(PREFS_BEAT);

  set beat(value) => _prefs.setString(PREFS_BEAT, value);

  String get route => _prefs.getString(prefsRoute);

  set route(value) => _prefs.setString(prefsRoute, value);

  //Entity
  String get entitySyncString => _prefs.getString(prefsEntitySync) ?? "{}";

  set entitySyncString(value) => _prefs.setString(prefsEntitySync, value);

  /*set msqId(value) => _prefs.setString(PREFS_TEMP_MSQID, value);

  String get msqId => _prefs.getString(PREFS_TEMP_MSQID) ?? "Fill Details";

  set headendName(value) => _prefs.setString(PREFS_TEMP_HEADEND_TITLE, value);

  get headendName => _prefs.getString(PREFS_TEMP_HEADEND_TITLE);
*/
  set planningModel(value) => _prefs.setString(PREFS_PLANNING_MODEL, value);

  get planningModel => _prefs.getString(PREFS_PLANNING_MODEL);

  set plannerDocumentId(value) =>
      _prefs.setString(PREFS_PLANNER_DOCUMENT_ID, value);

  get plannerDocumentId => _prefs.getString(PREFS_PLANNER_DOCUMENT_ID);

  Future<void> initialize(BasePrefs prefs) async {
    _prefs = prefs;
    try {
      await _prefs.initialise();
    } catch (e, s) {
      logger.e(e, s);
    }
  }

  void checkIsInitialize() {
    if (_prefs == null) {
      throw SharedPrefsNotInitialisedException();
    }
  }

  void setprefilledData(String headendName, Map<String, dynamic> filledQa) {
    _prefs.setString(headendName, json.encode(filledQa));
  }

  String getprefilledData(String headendName) {
    return _prefs.getString(headendName);
  }

  List<String> getStringList(String prefs_mso) {
    return _prefs.getStringList(prefs_mso);
  }

  void clear() {
    _prefs.clear();
  }

  Future<void> refresh() async {
    await _prefs.reload();
  }

  void removeLocationList() {
    _prefs.remove(PREFS_LAST_LOCATION_LIST);
  }

  void clearLastActivity() {
    lastActivity = null;
  }

  Future<Map<String, dynamic>> getMap() async {
    return _prefs.getMap();
  }
}

class SharedPrefsNotInitialisedException implements Exception {
  @override
  String toString() {
    return "Call prefsHelper.initialize first before using Shared Prefs";
  }
}
