import 'package:flutter/material.dart';

class GreetingsQuizScreen extends StatefulWidget {
  @override
  _GreetingsQuizScreenState createState() => _GreetingsQuizScreenState();
}

class _GreetingsQuizScreenState extends State<GreetingsQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is a formal way to say hello?',
      'options': ['Hey', 'What’s up?', 'Good morning', 'Hi there'],
      'answer': 'Good morning',
    },
    {
      'question': 'Which greeting is commonly used in Japan?',
      'options': ['Hola', 'Bonjour', 'Konnichiwa', 'Hello'],
      'answer': 'Konnichiwa',
    },
    {
      'question': 'What is a casual greeting?',
      'options': ['Good evening', 'How are you?', 'What’s up?', 'Namaste'],
      'answer': 'What’s up?',
    },
    {
      'question': 'What phrase would you use when meeting someone for the first time?',
      'options': ['Goodbye', 'See you later', 'Nice to meet you', 'Hey there'],
      'answer': 'Nice to meet you',
    },
    {
      'question': 'What is an appropriate farewell phrase?',
      'options': ['Good morning', 'Bye', 'Hello', 'Welcome'],
      'answer': 'Bye',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      score++;
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('Your score is $score out of ${questions.length}',style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to Basic Greetings Screen
            },
            child: const Text('Back to Lessons'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              setState(() {
                // Restart the quiz
                currentQuestionIndex = 0;
                score = 0;
              });
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: const Text('Greetings Quiz',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
              return  ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.limeAccent),
                foregroundColor: MaterialStatePropertyAll(Colors.black)  ),
                onPressed: () => checkAnswer(option),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
