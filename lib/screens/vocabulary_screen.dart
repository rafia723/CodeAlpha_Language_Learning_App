import 'package:flutter/material.dart';

class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
 
  final List<Map<String, String>> vocabularyWords = [
    {'word': 'Abundant', 'meaning': 'Existing or available in large quantities.'},
    {'word': 'Eloquent', 'meaning': 'Fluent or persuasive in speaking or writing.'},
    {'word': 'Serene', 'meaning': 'Calm, peaceful, and untroubled.'},
    {'word': 'Meticulous', 'meaning': 'Showing great attention to detail; very careful and precise.'},
    {'word': 'Pensive', 'meaning': 'Engaged in serious thought.'},
    {'word': 'Resilient', 'meaning': 'Able to withstand or recover quickly from difficult conditions.'},
    {'word': 'Vivid', 'meaning': 'Producing powerful feelings or strong, clear images in the mind.'},
    {'word': 'Optimistic', 'meaning': 'Hopeful and confident about the future.'},
    {'word': 'Intricate', 'meaning': 'Very detailed and complex.'},
    {'word': 'Courageous', 'meaning': 'Not deterred by danger or pain; brave.'},
  ];


  int _points = 0;
  int _level = 1;
  int _wordsLearned = 0;

  // List to track if a word has been learned (initially set to false for each word)
  List<bool> _wordsLearnedStatus = List.generate(10, (index) => false);


  // Function to update user's progress when a word is checked or unchecked
  void _toggleLearnedStatus(int index) {
   setState(() {
    _wordsLearnedStatus[index] = !_wordsLearnedStatus[index];
  

      if (_wordsLearnedStatus[index]) {
        // Word is marked as learned
        _points += 10; // Add points for marking the word as learned
        _wordsLearned++;
       
      } else {
        // Word is unmarked as learned (optional: you can subtract points if needed)
        _points -= 10; // Optionally deduct points
        _wordsLearned--;
    
      }

      // Level up when reaching multiples of 5 words learned
      if (_wordsLearned % 5 == 0) {
        _level++;
      }
    });
  }

  // Function to calculate progress bar value
  double get progress => _wordsLearned / vocabularyWords.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary Lesson'),
        backgroundColor: Colors.lime,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display progress bar and points
            Text(
              'Level: $_level',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            const SizedBox(height: 10),
            Text(
              'Points: $_points',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            
            // List of vocabulary words
            Expanded(
              child: ListView.builder(
                itemCount: vocabularyWords.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Circle Avatar for Vocabulary Word
                          CircleAvatar(
                            backgroundColor: Colors.black38,
                            child: Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vocabularyWords[index]['word']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  vocabularyWords[index]['meaning']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Checkbox for marking the word as learned or not
                          Checkbox(
                            value: _wordsLearnedStatus[index],
                            onChanged: (bool? value) {
                              // Toggle the learned status when checkbox is clicked
                              _toggleLearnedStatus(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
