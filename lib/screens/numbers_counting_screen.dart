import 'package:flutter/material.dart';
import 'package:lang_app/screens/numbers_counting_quiz_screen.dart';

class NumbersCountingScreen extends StatelessWidget {
  final List<Map<String, String>> numbersData = [
    {'number': '1', 'word': 'One'},
    {'number': '2', 'word': 'Two'},
    {'number': '3', 'word': 'Three'},
    {'number': '4', 'word': 'Four'},
    {'number': '5', 'word': 'Five'},
    {'number': '6', 'word': 'Six'},
    {'number': '7', 'word': 'Seven'},
    {'number': '8', 'word': 'Eight'},
    {'number': '9', 'word': 'Nine'},
    {'number': '10', 'word': 'Ten'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers and Counting'),
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
      body: ListView.builder(
        itemCount: numbersData.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white38,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black38,
                child: Text(
                  numbersData[index]['number']!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                numbersData[index]['word']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NumbersCountingQuizScreen(),
            ),
          );
        },
        child: const Icon(Icons.quiz),
        tooltip: 'Start Quiz',
      ),
    );
  }
}
