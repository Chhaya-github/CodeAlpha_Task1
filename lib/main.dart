import 'package:flashcard_app/flashcard.dart';
import 'package:flashcard_app/flashview.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlashCard());

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  List<Flashcard> flashcard = [
    Flashcard(question: 'What language does flutter use?', answer: 'Dart'),
    Flashcard(question: 'What language does react use?', answer: 'JavaScript'),
    Flashcard(question: 'What language does Angular use?', answer: 'Javascript'),
    Flashcard(question: 'What language does flutter use?', answer: 'Dart'),
  ];

  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'FlashCard Quiz',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: Card(
                  elevation: 10,
                  child: FlipCard(
                    front: FlashcardView(
                        text: flashcard[currIndex].question),
                    back: FlashcardView(
                        text: flashcard[currIndex].answer),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    onPressed: previousCard,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Prev'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedButton.icon(
                    onPressed: nextCard,
                    label: const Text('Next'),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void nextCard() {
    setState(() {
      currIndex = (currIndex + 1 < flashcard.length) ? currIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      currIndex = (currIndex - 1 >= 0) ? currIndex - 1 : flashcard.length - 1;
    });
  }
}

class FlashcardView extends StatelessWidget {
  final String text;

  const FlashcardView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
