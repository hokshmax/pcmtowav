
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pcmtowave/convertToWav.dart';
import 'package:pcmtowave/pcmtowave.dart';
import 'package:record/record.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  //init
  final _pcmtowave = convertToWav(
    sampleRate: 44100,
    converMiliSeconds: 1000,
    numChannels: 2
  );
  final record = AudioRecorder();
  final player = AudioPlayer();

  String text="";

  @override
  void initState() {
    super.initState();
    _pcmtowave.convert.listen((event) async {






    });
  }

  bool isrecord=false;

  Uint8List ? data;

  recor() async {

    if (await record.hasPermission()) {
      // Start recording to file
      // ... or to stream

      if (!isrecord) {
        final stream = await record.startStream(const RecordConfig(
            encoder: AudioEncoder.pcm16bits
        ));
        isrecord = true;

        stream.listen((event) {
          _pcmtowave.run(event);
        });
      }else{
        record.stop();
        isrecord=false;
      }
    }




setState(() {

});

  }




  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('pcm'),
        ),
        body:Column(
          children: [
            Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: Row(children: [
                ElevatedButton(
                  onPressed:(){ recor();},
                  //color: Colors.white,
                  //disabledColor: Colors.grey,
                  child: Text(isrecord? 'Stop' : 'Record'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(isrecord
                    ? 'Recording in progress'
                    : 'Recorder is stopped'),
              ]),
            ),

            Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: Row(children: [

                SizedBox(
                  width: 20,
                ),
                Text(text),
              ]),
            ),

          ],
        )
      ),
    );
  }

}
