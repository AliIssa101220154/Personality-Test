import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Discover Your\nPersonality Type!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 32),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _EmojiCard('🧠'),
                    SizedBox(width: 16),
                    _EmojiCard('🗺️'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _EmojiCard('📅'),
                    SizedBox(width: 16),
                    _EmojiCard('💖'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 36),
            OutlinedButton(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Start Test', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmojiCard extends StatelessWidget {
  final String emoji;
  const _EmojiCard(this.emoji);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: Text(emoji, style: const TextStyle(fontSize: 28)),
    );
  }
}
