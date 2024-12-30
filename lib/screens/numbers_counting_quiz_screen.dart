import 'package:flutter/material.dart';

class NumbersCountingQuizScreen extends StatefulWidget {
  @override
  _NumbersCountingQuizScreenState createState() =>
      _NumbersCountingQuizScreenState();
}

class _NumbersCountingQuizScreenState extends State<NumbersCountingQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the word for the number 1?',
      'options': ['One', 'Two', 'Three', 'Four'],
      'answer': 'One',
    },
    {
      'question': 'What is the word for the number 3?',
      'options': ['Four', 'Three', 'Two', 'One'],
      'answer': 'Three',
    },
    {
      'question': 'What is the word for the number 7?',
      'options': ['Six', 'Seven', 'Eight', 'Five'],
      'answer': 'Seven',
    },
    {
      'question': 'What is the word for the number 10?',
      'options': ['Nine', 'Ten', 'Eight', 'Seven'],
      'answer': 'Ten',
    },
    {
      'question': 'What is the word for the number 5?',
      'options': ['Four', 'Six', 'Five', 'Seven'],
      'answer': 'Five',
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
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Quiz Completed'),
            content: Text('Your score is $score/${questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers and Counting Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex]['question']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]['options'].map((option) {
              return ElevatedButton(
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
