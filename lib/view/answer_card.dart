import 'package:flutter/material.dart';
import 'package:sample_quiz_app/view/questions.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard(
      {super.key,
      required this.question,
      required this.isSelected,
      required this.correctAnswerIndex,
      required this.selectedAnswerIndex,
      required this.currentIndex});

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: selectedAnswerIndex != null
            //condition
            ? Container(
                height: 70,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isCorrectAnswer
                        ? Colors.green
                        : isWrongAnswer
                            ? Colors.red
                            : Colors.white24,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        question /*mentioned above,not the modelcls*/,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    isCorrectAnswer
                        ? buildCorrectIcon()
                        : isWrongAnswer
                            ? buildWrongIcon()
                            : SizedBox.shrink()
                  ],
                ),
              )
            : Container(
                height: 70,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      question /*mentioned above,not the modelcls*/,
                      style: TextStyle(fontSize: 16),
                    ))
                  ],
                ),
              ));
  }
}

Widget buildCorrectIcon() => CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
Widget buildWrongIcon() => CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
