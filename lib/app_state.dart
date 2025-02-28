import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  dynamic _currentUserData;
  dynamic get currentUserData => _currentUserData;
  set currentUserData(dynamic value) {
    _currentUserData = value;
  }

  String _jwt = '';
  String get jwt => _jwt;
  set jwt(String value) {
    _jwt = value;
  }

  dynamic _currentLearner;
  dynamic get currentLearner => _currentLearner;
  set currentLearner(dynamic value) {
    _currentLearner = value;
  }

  int _classId = 0;
  int get classId => _classId;
  set classId(int value) {
    _classId = value;
  }

  dynamic _classData;
  dynamic get classData => _classData;
  set classData(dynamic value) {
    _classData = value;
  }

  int _xp = 0;
  int get xp => _xp;
  set xp(int value) {
    _xp = value;
  }

  int _learningHours = 0;
  int get learningHours => _learningHours;
  set learningHours(int value) {
    _learningHours = value;
  }

  int _passedClasses = 0;
  int get passedClasses => _passedClasses;
  set passedClasses(int value) {
    _passedClasses = value;
  }

  int _enrolledClasses = 0;
  int get enrolledClasses => _enrolledClasses;
  set enrolledClasses(int value) {
    _enrolledClasses = value;
  }

  int _attendedClasses = 0;
  int get attendedClasses => _attendedClasses;
  set attendedClasses(int value) {
    _attendedClasses = value;
  }

  int _sessionId = 0;
  int get sessionId => _sessionId;
  set sessionId(int value) {
    _sessionId = value;
  }

  /// to store answers post to server
  List<dynamic> _internalQuizAnswers = [];
  List<dynamic> get internalQuizAnswers => _internalQuizAnswers;
  set internalQuizAnswers(List<dynamic> value) {
    _internalQuizAnswers = value;
  }

  void addToInternalQuizAnswers(dynamic value) {
    internalQuizAnswers.add(value);
  }

  void removeFromInternalQuizAnswers(dynamic value) {
    internalQuizAnswers.remove(value);
  }

  void removeAtIndexFromInternalQuizAnswers(int index) {
    internalQuizAnswers.removeAt(index);
  }

  void updateInternalQuizAnswersAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    internalQuizAnswers[index] = updateFn(_internalQuizAnswers[index]);
  }

  void insertAtIndexInInternalQuizAnswers(int index, dynamic value) {
    internalQuizAnswers.insert(index, value);
  }
}
