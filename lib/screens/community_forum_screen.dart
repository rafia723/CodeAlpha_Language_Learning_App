import 'package:flutter/material.dart';

class CommunityForumScreen extends StatefulWidget {
  @override
  _CommunityForumScreenState createState() => _CommunityForumScreenState();
}

class _CommunityForumScreenState extends State<CommunityForumScreen> {
  final List<Map<String, String>> forumPosts = [
    {
      'user': 'Alice',
      'message': 'Does anyone have tips for remembering numbers?',
    },
    {
      'user': 'Bob',
      'message': 'Practice makes perfect! Try writing them repeatedly.',
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _addMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        forumPosts.add({
          'user': 'You',
          'message': _controller.text.trim(),
        });
      });
      _controller.clear(); // Clear the input field after adding the message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: forumPosts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(forumPosts[index]['user']![0]),
                  ),
                  title: Text(forumPosts[index]['user']!),
                  subtitle: Text(forumPosts[index]['message']!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Write a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
