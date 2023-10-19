// ignore_for_file: file_names

class Question {
  late String questiontext;
  late String questionimages;
  late bool questioninv;

  Question({required String q, required String i, required bool t}) {
    questiontext = q;
    questionimages = i;
    questioninv = t;
  }
}
