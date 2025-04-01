import 'package:flutter/material.dart';

void main() => runApp(StarLightApp());

class StarLightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarLight',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TranslatorPage(),
    );
  }
}

class TranslatorPage extends StatefulWidget {
  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  String inputText = '';
  String translatedText = '';
  String selectedLanguage = 'Japanese';

  void translateText() {
    setState(() {
      translatedText = 'Translation of "$inputText" to $selectedLanguage (mocked)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StarLight Translator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: <String>[
                'Japanese',
                'Spanish',
                'French',
                'German',
                'Chinese'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              onChanged: (value) => inputText = value,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: translateText,
              child: Text('Translate'),
            ),
            SizedBox(height: 20),
            Text(
              translatedText,
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            Text('Voice & Camera functionality coming soon!', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
