import 'package:flutter/material.dart';

class AnswerFeedbackHolder extends ChangeNotifier {
  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;
  bool _isCorrect = false;
  bool get isCorrect => _isCorrect;

  AnswerFeedbackHolder(this._isCorrect, this._isAnswered);

  void setAnswered(bool b){
    _isAnswered = b;
    notifyListeners();
  }

  void setCorrect(bool b){
    _isCorrect = b;
    notifyListeners();
  }

}