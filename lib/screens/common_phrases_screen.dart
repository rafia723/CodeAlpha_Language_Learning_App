import 'package:flutter/material.dart';
import 'common_phrases_quiz_screen.dart';

class CommonPhrasesScreen extends StatelessWidget {
 final List<Map<String, String>> phrases = [
  {'phrase': 'Excuse me', 'meaning': 'Used to politely get someone’s attention.'},
  {'phrase': 'Thank you', 'meaning': 'Used to express gratitude.'},
  {'phrase': 'You’re welcome', 'meaning': 'A polite response to "Thank you".'},
  {'phrase': 'I’m sorry', 'meaning': 'Used to apologize.'},
  {'phrase': 'Could you help me?', 'meaning': 'A polite way to ask for help.'},
  {'phrase': 'How are you?', 'meaning': 'A common way to ask about someone’s well-being.'},
  {'phrase': 'Good morning', 'meaning': 'Used to greet someone in the morning.'},
  {'phrase': 'Good night', 'meaning': 'Used to say goodbye at night or before sleeping.'},
  {'phrase': 'Please', 'meaning': 'Used to make a polite request.'},
  {'phrase': 'What’s your name?', 'meaning': 'A polite way to ask someone their name.'},
  {'phrase': 'Nice to meet you', 'meaning': 'Used to express pleasure upon meeting someone.'},
  {'phrase': 'I don’t understand', 'meaning': 'Used when you cannot comprehend something.'},
  {'phrase': 'Can you repeat that?', 'meaning': 'A polite way to ask for repetition.'},
  {'phrase': 'Where is the restroom?', 'meaning': 'Used to ask the location of the bathroom.'},
  {'phrase': 'See you later', 'meaning': 'A casual way to say goodbye.'},
  {'phrase': 'What time is it?', 'meaning': 'A polite way to ask for the time.'},
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Phrases'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Learn Common Phrases',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: phrases.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        phrases[index]['phrase']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(phrases[index]['meaning']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CommonPhrasesQuizScreen()),
          );
        },
        label: const Text('Start Quiz'),
        icon: const Icon(Icons.quiz),
      ),
    );
  }
}
