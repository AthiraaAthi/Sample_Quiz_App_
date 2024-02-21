import 'package:flutter/material.dart';
import 'package:sample_quiz_app/view/answer_card.dart';
import 'package:sample_quiz_app/view/questions.dart';
import 'package:sample_quiz_app/view/questionss.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuestionModel = questions[0];
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
                  onTap: () {},
                  child: AnswerCard(
                    currentIndex: index,
                    question: QuestionModel.options[index],
                    isSelected: false,
                    selectedAnswerIndex: 0,
                    correctAnswerIndex: QuestionModel.correctAnswerIndex,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
