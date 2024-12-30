import 'package:flutter/material.dart';
import 'package:lang_app/screens/edit_account_screen.dart';

class AccountScreen extends StatefulWidget {
  final String initialUsername;
  final String initialEmail;

  const AccountScreen({
    Key? key,
    required this.initialUsername,
    required this.initialEmail,
  }) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late String username;
  late String email;

  @override
  void initState() {
    super.initState();
    username = widget.initialUsername;
    email = widget.initialEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Username: $username',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 20),

            // Edit Account Button
            ElevatedButton(
              onPressed: () async {
                // Navigate to the Edit Account Screen and get the updated data
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAccountScreen(
                      currentUsername: username,
                      currentEmail: email,
                    ),
                  ),
                );

                // Check if we got a result back and update the UI
                if (result != null) {
                  setState(() {
                    username = result['username'];
                    email = result['email'];
                  });
                }
              },
              child: const Text('Edit Account'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.limeAccent, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 16),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Account Settings'),
              onTap: () {
                // Navigate to account settings screen or show settings options
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy and Security'),
              onTap: () {
                // Navigate to privacy and security settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language Preferences'),
              onTap: () {
                // Navigate to language preferences settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                // Navigate to help and support screen
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // Handle log out action (e.g., sign out the user)
              },
              child: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
