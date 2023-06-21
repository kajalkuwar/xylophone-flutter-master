import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound (int noteNo) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$noteNo.wav'));
    player.resume();
  }
  Expanded buildKey(Color colors, int soundNo){
   return Expanded(
      child: TextButton(
        onPressed: () async {
          playSound(soundNo);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors),
        ),
        // child: Text("NOTE 1"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1),
              buildKey(Colors.blue, 1),
              buildKey(Colors.green, 1),
              buildKey(Colors.purple, 1),
              buildKey(Colors.orange, 1),
              buildKey(Colors.yellow, 1),
              buildKey(Colors.pink, 1),
            ],
          )),
        ),
      ),
    );
  }
}
