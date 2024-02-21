import 'package:flutter/material.dart';
import 'package:sample_quiz_app/view/questionss.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 1000,
          ),
          Text(
            "Your Score",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  //////FOR THE RESULT
                  strokeWidth: 10,
                  value: score / 4,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: TextStyle(fontSize: 80),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${(score / questions.length * 100).round()}%",
                    style: TextStyle(fontSize: 25),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
