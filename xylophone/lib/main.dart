import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "Xylophone App",
        home: XylophoneScreen(),
      ),
    );
  }
}

class XylophoneScreen extends StatelessWidget {
  final keys = [1, 2, 3, 4, 5, 6, 7];
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.teal,
    Colors.amber,
    Colors.black
  ];

  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    final keyWidgets = keys
        .map(
          (k) => createXylophoneKey(
                color: colors[k - 1],
                audioKey: k,
              ),
        )
        .toList();

    return Container(
      color: Colors.red,
      child: Column(
        children: keyWidgets,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  Widget createXylophoneKey({Color color, int audioKey}) {
    return Expanded(
      child: FlatButton(
        color: color,
        padding: EdgeInsets.zero,
        onPressed: () {
          print(audioKey);
          player.play('note$audioKey.wav');
        },
        child: Container(
        ),
      ),
    );
  }
}
