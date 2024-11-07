import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  _LanguageSettingsPageState createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  String selectedLanguage = 'English'; // Default selected language

  final List<String> languages = [
    'English',
    'French',
    'Spanish',
    'German',
    'Italian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language Settings"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            trailing: Radio<String>(
              value: languages[index],
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
            onTap: () {
              setState(() {
                selectedLanguage = languages[index];
              });
            },
          );
        },
      ),
    );
  }
}
