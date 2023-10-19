// ignore_for_file: file_names

import 'Quetion.dart';

// ignore: camel_case_types
class App_Brain {
// عداد
  // ignore: prefer_final_fields, unused_field
  int _qnum = 0;
  // هذه الئمة لكي اقوم بانشاء كلاسات تحتوي على الاسئلة

  // ignore: prefer_final_fields, unused_field
  List<Question> _questioongroup = [
    Question(
        q: 'عدد الكواكب في المجموعة الشمسية ثمانية',
        i: 'images/image-1.jpg',
        t: true),
    Question(q: 'القطط حيوانات لاحمة', i: 'images/image-2.jpg', t: true),
    Question(
        q: ' الصين موجودة في القارة الافريقية',
        i: 'images/image-3.jpg',
        t: false),
    Question(q: 'الارض مسطحة وليست كروية', i: 'images/image-4.jpg', t: false),
    Question(
        q: 'باستطاعة الانسان البقاء حي دون اكل لحوم',
        i: 'images/image-5.jpg',
        t: true),
    Question(
        q: 'الشمس تدور حول الارض والارض تدور حول القمر',
        i: 'images/image-6.jpg',
        t: false),
    Question(q: 'الحيوانات لاتشعر بالالم', i: 'images/image-7.jpg', t: false),
  ];
  void quetionplus() {
    if (_qnum < _questioongroup.length - 1) {
      _qnum++;
    }
  }

  String getQuestionText() {
    return _questioongroup[_qnum].questiontext;
  }

  String getQuestionimages() {
    return _questioongroup[_qnum].questionimages;
  }

  bool getQuestionAnswer() {
    return _questioongroup[_qnum].questioninv;
  }

  bool isquestionend() {
    if (_qnum >= _questioongroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetapp() {
    _qnum = 0;
  }
}
