enum Personality { thinker, feeler, planner, adventurer }

const Map<Personality, String> personalityMessages = {
  Personality.feeler:
      'You are a Feeler 💖 Empathetic, warm, and guided by emotion.',
  Personality.thinker:
      'You are a Thinker 🧠 Logical, curious, and focused on ideas.',
  Personality.planner:
      'You are a Planner 📅 Organized, strategic, and goal-oriented.',
  Personality.adventurer:
      'You are an Adventurer 🗺️ Spontaneous, bold, and always exploring.',
};

String personalityName(Personality personality) {
  switch (personality) {
    case Personality.thinker:
      return 'Thinker';
    case Personality.feeler:
      return 'Feeler';
    case Personality.planner:
      return 'Planner';
    case Personality.adventurer:
      return 'Adventurer';
  }
}

String personalityEmoji(Personality personality) {
  switch (personality) {
    case Personality.thinker:
      return '🧠';
    case Personality.feeler:
      return '💖';
    case Personality.planner:
      return '📅';
    case Personality.adventurer:
      return '🗺️';
  }
}
