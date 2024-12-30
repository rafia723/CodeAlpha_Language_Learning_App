import 'package:flutter/material.dart';
import 'package:lang_app/model/UserProgress.dart';
import 'package:lang_app/screens/achievements.dart';
import 'package:lang_app/screens/basic_greetings_screen.dart';
import 'package:lang_app/screens/common_phrases_screen.dart';
import 'package:lang_app/screens/numbers_counting_screen.dart';
import 'package:lang_app/screens/community_forum_screen.dart';
import 'package:lang_app/screens/account_screen.dart';
import 'package:lang_app/screens/vocabulary_screen.dart'; // Vocabulary Lesson

class LessonSelectionScreen extends StatefulWidget {
  final String username;
  final String email;

  LessonSelectionScreen({required this.username, required this.email});

  @override
  _LessonSelectionScreenState createState() => _LessonSelectionScreenState();
}

class _LessonSelectionScreenState extends State<LessonSelectionScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> lessons = [
    {
      'title': 'Basic Greetings',
      'description': 'Learn how to greet people in different situations.',
      'icon': Icons.chat,
      'screen': BasicGreetingsScreen(),
    },
    {
      'title': 'Common Phrases',
      'description': 'Familiarize yourself with essential phrases.',
      'icon': Icons.abc,
      'screen': CommonPhrasesScreen(),
    },
    {
      'title': 'Numbers and Counting',
      'description': 'Master numbers and counting in a new language.',
      'icon': Icons.calculate,
      'screen': NumbersCountingScreen(),
    },
    {
      'title': 'Vocabulary',
      'description': 'Expand your vocabulary for better language skills.',
      'icon': Icons.book,
      'screen': VocabularyScreen(), // Vocabulary Lesson screen
    },
  ];

  final List<UserProgress> userProgress = [
    UserProgress('Basic Greetings', 3, 5),
    UserProgress('Common Phrases', 2, 4),
    UserProgress('Numbers and Counting', 0, 6),
    UserProgress('Vocabulary', 0, 6), // New lesson progress
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToScreen(int index) {
    // Navigate to the respective screen based on the selected lesson
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => lessons[index]['screen'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'English Learning App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lime, Colors.limeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${widget.username}!',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () => _navigateToScreen(index),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black38,
                                    child: Icon(
                                      lessons[index]['icon'],
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lessons[index]['title']!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          lessons[index]['description']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        if (index < userProgress.length)
                                          LinearProgressIndicator(
                                            value: userProgress[index]
                                                    .completedSteps /
                                                userProgress[index].totalSteps,
                                            backgroundColor: Colors.grey[300],
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(Colors.green),
                                          ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : _selectedIndex == 1
              ? AchievementsScreen()
              : _selectedIndex == 2
                  ? CommunityForumScreen()
                  : _selectedIndex == 3
                      ? AccountScreen(
                          initialUsername: widget.username,
                          initialEmail: widget.email,
                        )
                      : Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.lime,
            icon: Icon(Icons.book),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.lime,
            icon: Icon(Icons.star),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.lime,
            icon: Icon(Icons.forum),
            label: 'Community Forum',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.lime,
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
