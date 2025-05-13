import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

final Uri _url_0 = Uri.parse('https://github.com/inatagan');
final Uri _url_1 = Uri.parse('https://github.com/KevinPrince2024');

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('About Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for profile image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile1.png'),
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 20),
            // Placeholder for GitHub link
            GestureDetector(
              onTap: () {
                _launchUrl(_url_0);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'GitHub Inatagan',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Space between items
            // Placeholder for profile image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile2.jpeg'),
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            // Placeholder for GitHub link
            GestureDetector(
              onTap: () {
                _launchUrl(_url_1);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'GitHub KevinPrince2024',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => exit(0),
        tooltip: 'Close app',
        label: Text('Close'),
        icon: Icon(Icons.close),
      ),
    );
  }
}
