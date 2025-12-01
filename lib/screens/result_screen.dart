import 'package:flutter/material.dart';
import '../models/personality.dart';

class ResultScreen extends StatelessWidget {
  final Personality resultPersonality;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.resultPersonality,
    required this.onRestart,
  });

  String _articleFor(String title) {
    final first = title.toLowerCase().characters.first;
    if ('aeiou'.contains(first)) return 'an';
    return 'a';
  }

  @override
  Widget build(BuildContext context) {
    final title = personalityName(resultPersonality);
    final message = personalityMessages[resultPersonality]!;
    final emoji = personalityEmoji(resultPersonality);
    final article = _articleFor(title);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are $article $title',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(emoji, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Restart Test', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
