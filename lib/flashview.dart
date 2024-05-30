import 'package:flutter/material.dart';

class FlashCard_View extends StatelessWidget {
  final String text;
  const FlashCard_View({required Key key , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(child: Text(text, textAlign: TextAlign.center,)),
    );
  }
}
