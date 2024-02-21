import 'package:flutter/material.dart';
import 'package:sample_quiz_app/view/answer_card.dart';
import 'package:sample_quiz_app/view/questions.dart';
import 'package:sample_quiz_app/view/questionss.dart';
import 'package:sample_quiz_app/view/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final QuestionModel = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              QuestionModel.question,
              style: TextStyle(fontSize: 21),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: QuestionModel.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: QuestionModel.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: QuestionModel.correctAnswerIndex,
                  ),
                );
              },
            ),
            isLastQuestion
                ? InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              score: score,
                            ),
                          ));
                    },
                    child: Container(
                      color: Colors.white10,
                      height: 50,
                      width: 320,
                      child: Center(
                          child: Text(
                        "Finish",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  )
                // ElevatedButton(
                //     style: ButtonStyle(
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20))),
                //         backgroundColor:
                //             MaterialStatePropertyAll(Colors.white10)),
                //     onPressed: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => ResultScreen(),
                //           ));
                //     },
                //     child: Text(
                //       "Finish",
                //       style: TextStyle(color: Colors.white),
                //     ))
                : InkWell(
                    onTap:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    child: Container(
                      color: Colors.white10,
                      height: 50,
                      width: 320,
                      child: Center(
                          child: Text(
                        "Next",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  )
            // ElevatedButton(
            //     style: ButtonStyle(
            //         shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(.5),
            //               side: BorderSide(color: Colors.white10)),
            //         ),
            //         backgroundColor:
            //             MaterialStatePropertyAll(Colors.white10)),
            //     onPressed:
            //         selectedAnswerIndex != null ? goToNextQuestion : null,
            //     child: Text(
            //       "Next",
            //       style: TextStyle(color: Colors.white),
            //     ))
          ],
        ),
      ),
    );
  }
}
