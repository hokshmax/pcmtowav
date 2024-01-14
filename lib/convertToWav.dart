import 'dart:async';
import 'dart:typed_data';

import 'package:pcmtowave/pcmtowave.dart';

class convertToWav{

   int sampleRate ;
   int numChannels ;

   int converMiliSeconds;


   List<int> ? bytesSink =[];

   Timer ? timer;

   StreamController<Uint8List> streamController=StreamController();


   convertToWav({ this.sampleRate=44100, this.numChannels=2,this.converMiliSeconds=1000});

  void Function(Timer timer) get callBack => (timer){



      final res =   Pcmtowave.pcmToWav( Uint8List.fromList(bytesSink!),sampleRate,numChannels);
      streamController.add(res);

      bytesSink=[];



  };


   void run(   Uint8List ? pcmData ){

     bytesSink!.addAll(pcmData!.toList());


if(timer==null){

  timer=  Timer.periodic( Duration(milliseconds: converMiliSeconds),callBack);

}





   }



  Stream<Uint8List>  get convert =>streamController.stream;



  void dispose()  {

   streamController.close();
   timer!.cancel();

  }



}