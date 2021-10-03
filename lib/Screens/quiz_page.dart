import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/quiz_page.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizConfig = Provider.of<QuizConfig>(context, listen: false);

    return Scaffold(
      body: Consumer<QuizConfig>(
        builder: (context, myType, child) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quiz No  ${myType.quizNo}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Marks  = ${myType.currentMarks}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  quizConfig.quizs[myType.quizNo].toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                        value: 1,
                        groupValue: 0,
                        onChanged: (val) {},
                        title: Text(quizConfig.answers[myType.quizNo]![index]
                            .toString()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonBar(
                  children: [
                    myType.quizNo != 1
                        ? ElevatedButton(
                            onPressed: () {
                              quizConfig.navigatePages(
                                  context, "Previous Quiz");
                            },
                            child: const Text("Previous Quiz"),
                          )
                        : Container(),
                    ElevatedButton(
                      onPressed: () {
                        quizConfig.navigatePages(context, "Next Quiz");
                      },
                      child: const Text("Next Quiz"),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
