// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'App_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

App_Brain app_brain = App_Brain();

void main() {
  runApp(const ekhtibarapp());
}

class ekhtibarapp extends StatelessWidget {
  const ekhtibarapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Exam',
            style: TextStyle(color: Color.fromARGB(255, 3, 55, 98)),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: exampages(),
        ),
      ),
    );
  }
}

class exampages extends StatefulWidget {
  const exampages({super.key});

  @override
  State<exampages> createState() => _exampagesState();
}

class _exampagesState extends State<exampages> {
  // هذه القائمة من اجل انشاء الايقونات ضمن الصف العلوي
  List<Widget> anserres = [];
  int answertrue = 0;
  // عند الضغط على الزر سيقوم بعملية التأكد من الاجابة اذا كانت صحيحة أم لا وعندها سيقوم بالنقل للسؤال التالي وانشاء الايقونة المناسبة اما لايك او ديسلايك
  void checkanswer(bool whatuserpickt) {
// ignore: unused_local_variable
    setState(() {
      bool correctanswer = app_brain.getQuestionAnswer();
      if (correctanswer == whatuserpickt) {
        answertrue++;
        anserres.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_up, color: Colors.green),
          ),
        );
      } else {
        anserres.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_down, color: Colors.red),
        ));
      }
      if (app_brain.isquestionend() == true) {
        Alert(
          context: context,
          title: "انتهى الاختبار",
          desc: "من أصل 7 أسئلة  $answertrue لقد أجبت على ",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              color: const Color.fromRGBO(0, 179, 134, 1.0),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ).show();
        app_brain.resetapp();
        anserres = [];
        answertrue = 0;
      } else {
        app_brain.quetionplus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        children: anserres,
      ),
      Expanded(
        flex: 5,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(app_brain.getQuestionimages()),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              app_brain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26.0,
                color: Color.fromARGB(255, 73, 146, 218),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: ElevatedButton(
            // height: 30.0,
            // color: Colors.indigo,
            onPressed: () {
              checkanswer(true);
            },
            child: const Text(
              'True',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: ElevatedButton(
            //   height: 30.0,
            //    color: Colors.deepOrange,
            onPressed: () {
              checkanswer(false);
            },
            child: const Text(
              'False',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }
}
