import 'package:flutter/material.dart';
import '../models/personality.dart';
import '../models/question.dart';
import '../widgets/answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  final Question question;
  final int questionNumber;
  final int totalQuestions;
  final void Function(Personality) onSelectAnswer;

  const QuestionsScreen({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onSelectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final answers = question.answers;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 28),
            ...answers.map(
              (answer) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: AnswerButton(
                  text: answer.text,
                  onTap: () => onSelectAnswer(answer.personality),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
