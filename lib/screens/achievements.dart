import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  final List<Map<String, String>> achievements = [
    {'title': 'First Lesson', 'description': 'Complete your first lesson!'},
    {'title': 'Quiz Master', 'description': 'Score 100% on any quiz.'},
    {'title': 'Steady Learner', 'description': 'Use the app for 7 days in a row.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: Text(
              achievements[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(achievements[index]['description']!),
          );
        },
      ),


    );
  }
}
