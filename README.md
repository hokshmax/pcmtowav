# pcmtowave

pcm to wave converter

convert pcm to wav in real time using dart code 

## Usage

```dart
  final _pcmtowave = convertToWav(
    sampleRate: 44100, 
    converMiliSeconds: 1000, //convert every 1 sec
    numChannels: 2  
);


//use any audio recorder 

final stream = await record.startStream(const RecordConfig(
encoder: AudioEncoder.pcm16bits
));
isrecord = true;

stream.listen((event) {
_pcmtowave.run(event); //convert recoded data to wav
});


//listen to wav data 
_pcmtowave.convert.listen((event) async {

data=event;

});


_pcmtowave.dispose();






```

For a complete example, please go to /example folder.







