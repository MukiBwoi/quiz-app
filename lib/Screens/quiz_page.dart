import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/mediaquery.dart';
import 'package:quiz_app/provider/quiz_page.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizConfig = Provider.of<QuizConfig>(context, listen: false);

    return Scaffold(
      body: Consumer<QuizConfig>(
        builder: (context, myType, child) {
          return Consumer<MediaResponsive>(
            builder: (context, screeSize, child) {
              return SingleChildScrollView(
                child: Padding(
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
                            "Marks : ${myType.currentMarks}",
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
                              value: index + 1,
                              groupValue: myType.radioVal,
                              onChanged: (val) {
                                quizConfig.setRadioVal(val);
                                debugPrint(myType.radioVal.toString());
                              },
                              title: Text(quizConfig
                                  .answers[myType.quizNo]![index]
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
                              quizConfig.setUserAnswers(
                                context,  myType.quizNo, myType.radioVal);
                              quizConfig.navigatePages(context, "Next Quiz");
                              myType.radioVal = 0;
                              debugPrint(myType.userAnswers.toString())
                              ;
                            },
                            child: const Text("Next Quiz"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
