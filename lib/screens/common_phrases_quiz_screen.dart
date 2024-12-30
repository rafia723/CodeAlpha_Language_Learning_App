import 'package:flutter/material.dart';

class CommonPhrasesQuizScreen extends StatefulWidget {
  @override
  _CommonPhrasesQuizScreenState createState() => _CommonPhrasesQuizScreenState();
}

class _CommonPhrasesQuizScreenState extends State<CommonPhrasesQuizScreen> {
 final List<Map<String, dynamic>> questions = [
  {
    'question': 'What do you say to express gratitude?',
    'options': ['Excuse me', 'Thank you', 'I’m sorry', 'You’re welcome'],
    'answer': 'Thank you',
  },
  {
    'question': 'Which phrase is used to politely get someone’s attention?',
    'options': ['Excuse me', 'You’re welcome', 'Could you help me?', 'Thank you'],
    'answer': 'Excuse me',
  },
  {
    'question': 'How do you respond to "Thank you"?',
    'options': ['Excuse me', 'I’m sorry', 'You’re welcome', 'Could you help me?'],
    'answer': 'You’re welcome',
  },
  {
    'question': 'What phrase would you use to ask about someone’s name?',
    'options': ['What’s your name?', 'Good morning', 'I’m sorry', 'Nice to meet you'],
    'answer': 'What’s your name?',
  },
  {
    'question': 'What do you say when you don’t understand something?',
    'options': ['Please', 'I don’t understand', 'Could you help me?', 'Excuse me'],
    'answer': 'I don’t understand',
  },
  {
    'question': 'Which phrase is used to say goodbye at night?',
    'options': ['See you later', 'Good night', 'Thank you', 'Good morning'],
    'answer': 'Good night',
  },
  {
    'question': 'What’s a polite way to ask for repetition?',
    'options': ['Can you repeat that?', 'Excuse me', 'Please', 'What’s your name?'],
    'answer': 'Can you repeat that?',
  },
  {
    'question': 'Which phrase expresses pleasure upon meeting someone?',
    'options': ['Nice to meet you', 'How are you?', 'I’m sorry', 'Thank you'],
    'answer': 'Nice to meet you',
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
        content: Text('Your score is $score out of ${questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to Common Phrases Screen
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
        title: const Text('Common Phrases Quiz'),
        backgroundColor: Colors.limeAccent,
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
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
              return ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.limeAccent)),
                onPressed: () => checkAnswer(option),
                child: Text(option,style: TextStyle(color: Colors.black),),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
