import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/home.dart';
import 'package:quiz_app/provider/quiz_page.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<QuizConfig>(
      builder: (context, myType, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(myType.currentMarks.toString()),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    myType.quizNo = 1;
                    myType.currentMarks = 0;
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const Home();
                    }));
                  },
                  child: const Text("Reattempt Quiz"))
            ],
          ),
        );
      },
    ));
  }
}
