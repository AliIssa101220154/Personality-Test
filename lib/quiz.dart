import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'models/personality.dart';
import 'screens/start_screen.dart';
import 'screens/questions_screen.dart';
import 'screens/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreenName = 'start-screen';
  int currentQuestionIndex = 0;
  late Map<Personality, int> scores;
  Personality? resultPersonality;

  @override
  void initState() {
    super.initState();
    _resetScores();
  }

  void _resetScores() {
    scores = {for (final p in Personality.values) p: 0};
  }

  void switchScreen() {
    setState(() {
      activeScreenName = 'questions-screen';
      currentQuestionIndex = 0;
      _resetScores();
      resultPersonality = null;
    });
  }

  void chooseAnswer(Personality personality) {
    setState(() {
      scores[personality] = (scores[personality] ?? 0) + 1;

      final isLast = currentQuestionIndex == questions.length - 1;
      if (!isLast) {
        currentQuestionIndex++;
      } else {
        resultPersonality = _calculateResultPersonality();
        activeScreenName = 'results-screen';
      }
    });
  }

  Personality _calculateResultPersonality() {
    Personality best = Personality.thinker;
    int bestScore = -1;

    scores.forEach((p, s) {
      if (s > bestScore) {
        bestScore = s;
        best = p;
      }
    });

    return best;
  }

  void restartQuiz() {
    setState(() {
      activeScreenName = 'start-screen';
      currentQuestionIndex = 0;
      _resetScores();
      resultPersonality = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen);

    if (activeScreenName == 'questions-screen') {
      activeScreen = QuestionsScreen(
        question: questions[currentQuestionIndex],
        questionNumber: currentQuestionIndex + 1,
        totalQuestions: questions.length,
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreenName == 'results-screen') {
      activeScreen = ResultScreen(
        resultPersonality: resultPersonality ?? Personality.thinker,
        onRestart: restartQuiz,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF27435A), Color(0xFF233B50)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: activeScreen),
      ),
    );
  }
}
