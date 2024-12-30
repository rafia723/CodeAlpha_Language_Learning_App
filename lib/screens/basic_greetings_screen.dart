import 'package:flutter/material.dart';
import 'package:lang_app/screens/greetings_quiz_screen.dart';

class BasicGreetingsScreen extends StatefulWidget {
  @override
  _BasicGreetingsScreenState createState() => _BasicGreetingsScreenState();
}

class _BasicGreetingsScreenState extends State<BasicGreetingsScreen> {
  final List<Map<String, String>> lessons = [
    {
      'title': 'Introduction to Greetings',
      'content': 'Greetings are a way to acknowledge someone. Examples: Hello, Hi, How are you?'
    },
    {
      'title': 'Formal Greetings',
      'content': 'Use phrases like "Good morning," "Good evening," or "It’s a pleasure to meet you."'
    },
    {
      'title': 'Casual Greetings',
      'content': 'Say "Hey," "What’s up?" or "Hi there!" in informal settings.'
    },
    {
      'title': 'Time-Based Greetings',
      'content': 'Use time-based phrases like "Good afternoon" or "Good evening."'
    },
    {
      'title': 'Farewell Phrases',
      'content': 'Say goodbye with phrases like "See you," "Take care," or "Bye!"'
    },
    {
      'title': 'Cultural Greetings',
      'content': 'Learn unique greetings from different cultures. Example: Namaste (India), Konnichiwa (Japan).'
    },
    {
      'title': 'Polite Inquiries',
      'content': 'Pair greetings with polite questions like "How are you?" or "How have you been?"'
    },
    {
      'title': 'Greeting with a Compliment',
      'content': 'Start with a greeting and add a compliment like "Hi! You look great today!"'
    },
    {
      'title': 'Welcoming Greetings',
      'content': 'Use welcoming phrases like "Welcome!" or "Glad to see you!" in formal situations.'
    },
    {
      'title': 'Meeting Someone New',
      'content': 'Use "Nice to meet you" or "It’s a pleasure to meet you" when meeting someone for the first time.'
    },
    {
      'title': 'Apologetic Greetings',
      'content': 'When late, start with "Sorry for keeping you waiting" or "I apologize for the delay."'
    },
    {
      'title': 'Reunion Greetings',
      'content': 'Say "Long time no see!" or "It’s been a while!" when meeting someone after a long time.'
    },
  ];

  String? selectedTitle;
  String? selectedContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: const Text(
          'Basic Greetings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // List of lessons
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white38,
                  margin: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text(
                      lessons[index]['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(lessons[index]['content']!),
                    onTap: () {
                      setState(() {
                        // Update the selected lesson content
                        selectedTitle = lessons[index]['title'];
                        selectedContent = lessons[index]['content'];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Display selected lesson content
          if (selectedTitle != null && selectedContent != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedTitle!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    selectedContent!,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GreetingsQuizScreen()),
          );
        },
        label: const Text(
          'Start Quiz',
          style: TextStyle(color: Colors.black87),
        ),
        icon: const Icon(
          Icons.quiz,
          color: Colors.black87,
        ),
      ),
    );
  }
}
