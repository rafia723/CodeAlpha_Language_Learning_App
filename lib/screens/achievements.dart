import 'package:flutter/material.dart';

class AchievementsScreen extends StatefulWidget {
  @override
  _AchievementsScreenState createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  // List of achievements with description and a condition to check if it's unlocked
  List<Map<String, dynamic>> achievements = [
    
    {
      'title': 'Quiz Master',
      'description': 'Score 100% on any quiz.',
      'unlocked': false,
    },
    {
      'title': 'Steady Learner',
      'description': 'Use the app for 7 days in a row.',
      'unlocked': false,
    },
     {
      'title': 'Vocabulary Level 3',
      'description': 'Achieved Level 3 in Vocabulary.',
      'unlocked': false,
    },
    {
      'title': 'Vocabulary Pro',
      'description': 'Learn 50 new vocabulary words.',
      'unlocked': false,
    },
  ];

  // Track user progress (example)
  int lessonsCompleted = 1; // Example: User completed 1 lesson
  int quizzesCompleted = 1; // Example: User completed 0 quizzes
  int vocabularyWordsLearned = 10; // Example: User has learned 10 vocabulary words

  // Check achievements based on user progress
  void checkAchievements() {
    setState(() {
      // Unlock 'First Lesson' achievement if the user has completed 1 lesson
      if (quizzesCompleted >= 1) {
        achievements[0]['unlocked'] = true;
      }

      // Unlock 'Quiz Master' achievement if the user has scored 100% on a quiz
      if (vocabularyWordsLearned >= 50) { // Add logic for 100% score
        achievements[1]['unlocked'] = true;
        
      }

      // Unlock 'Steady Learner' achievement if the user has used the app for 7 days in a row
      if (lessonsCompleted >= 1) {
        achievements[2]['unlocked'] = true;
      }

      // Unlock 'Vocabulary Pro' achievement if the user has learned 50 vocabulary words
      if (vocabularyWordsLearned >= 50) {
        achievements[3]['unlocked'] = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAchievements(); // Check for achievements when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              achievements[index]['unlocked'] ? Icons.star : Icons.star_border,
              color: achievements[index]['unlocked'] ? Colors.amber : Colors.grey,
            ),
            title: Text(
              achievements[index]['title']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(achievements[index]['description']!),
          );
        },
      ),
    );
  }
}
