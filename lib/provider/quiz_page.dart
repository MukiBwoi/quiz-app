import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/finalpage.dart';
import 'package:quiz_app/widgets/snackbar.dart';

class QuizConfig extends ChangeNotifier {
  int quizNo = 1;
  double currentMarks = 0.0;
  Object? radioVal = 0;
  Map<int, Object?> userAnswers = {};
  Map<int, Object?> correctAnswers = {
    1: 2,
    2: 1,
    3: 3,
    4: 1,
  };

  Map<int, String> quizs = {
    1: "What does HTML stand for?",
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

  void setRadioVal(Object? value) {
    radioVal = value;
    notifyListeners();
  }

  void setUserAnswers(BuildContext context, int quizNumber, Object? answer) {
    userAnswers.addAll({quizNumber: answer});
    notifyListeners();
    if (userAnswers[quizNumber] == correctAnswers[quizNumber]) {
      currentMarks++;

      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          "Correct Answer",
          const Color(0xff2ecc71),
        ),
      );
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          "Wrong Answer",
          const Color(0xffe74c3c),
        ),
      );
      currentMarks = currentMarks;
      notifyListeners();
    }
  }

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
