import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/finalpage.dart';

class QuizConfig extends ChangeNotifier {
  int quizNo = 1;
  double currentMarks = 1.0;

  Map<int, String> quizs = {
    1: "How to insert a Image in html?",
    2: "How to Navigate in flutter?",
    3: "How to create reusable widget in flutter?",
    4: "What is good practise in flutter?",
  };

  Map<int, List<String>> answers = {
    1: [
      "Answer 01",
      "Answer 02",
      "Answer 03",
      "Answer 04",
    ],
    2: [
      "Answer 01",
      "Answer 02",
      "Answer 03",
      "Answer 04",
    ],
    3: [
      "Answer 01",
      "Answer 02",
      "Answer 03",
      "Answer 04",
    ],
    4: [
      "Answer 01",
      "Answer 02",
      "Answer 03",
      "Answer 04",
    ],
  };
  void _incrementCount() {
    quizNo++;
    notifyListeners();
  }

  void _decrementCount() {
    quizNo--;
    notifyListeners();
  }

  navigatePages(BuildContext context, String text) {
    if (quizNo < quizs.length) {
      if (text == "Next Quiz") {
        _incrementCount();
        currentMarks++;

        notifyListeners();
      } else {
        _decrementCount();
      }
    } else {
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const FinalPage();
          },
        ),
      );
      notifyListeners();
    }
    notifyListeners();
  }
}
