
import 'dart:typed_data';


 class Pcmtowave {

 static Uint8List pcmToWav(Uint8List pcmData, int sampleRate, int numChannels) {
    int bytesPerSample = 2; // Assuming 16-bit PCM
    int numSamples = pcmData.length ~/ bytesPerSample;

    int subchunk2Size = numSamples * numChannels * bytesPerSample;

    // WAV header
    List<int> wavHeader = [
      // Chunk ID
      'RIFF'.codeUnitAt(0),
      'RIFF'.codeUnitAt(1),
      'RIFF'.codeUnitAt(2),
      'RIFF'.codeUnitAt(3),

      // Chunk Size (36 + Subchunk2Size)
      (36 + subchunk2Size) & 0xFF,
      ((36 + subchunk2Size) >> 8) & 0xFF,
      ((36 + subchunk2Size) >> 16) & 0xFF,
      ((36 + subchunk2Size) >> 24) & 0xFF,

      // Format (WAVE)
      'WAVE'.codeUnitAt(0),
      'WAVE'.codeUnitAt(1),
      'WAVE'.codeUnitAt(2),
      'WAVE'.codeUnitAt(3),

      // Subchunk1 ID (fmt )
      'fmt '.codeUnitAt(0),
      'fmt '.codeUnitAt(1),
      'fmt '.codeUnitAt(2),
      'fmt '.codeUnitAt(3),

      // Subchunk1 Size (16 for PCM)
      16, 0, 0, 0,

      // Audio Format (PCM)
      1, 0,

      // Num Channels
      numChannels & 0xFF,
      (numChannels >> 8) & 0xFF,

      // Sample Rate
      sampleRate & 0xFF,
      (sampleRate >> 8) & 0xFF,
      (sampleRate >> 16) & 0xFF,
      (sampleRate >> 24) & 0xFF,

      // Byte Rate
      (sampleRate * numChannels * bytesPerSample) & 0xFF,
      ((sampleRate * numChannels * bytesPerSample) >> 8) & 0xFF,
      ((sampleRate * numChannels * bytesPerSample) >> 16) & 0xFF,
      ((sampleRate * numChannels * bytesPerSample) >> 24) & 0xFF,

      // Block Align
      (numChannels * bytesPerSample) & 0xFF,
      ((numChannels * bytesPerSample) >> 8) & 0xFF,

      // Bits Per Sample
      bytesPerSample * 8, 0,

      // Subchunk2 ID (data)
      'data'.codeUnitAt(0),
      'data'.codeUnitAt(1),
      'data'.codeUnitAt(2),
      'data'.codeUnitAt(3),

      // Subchunk2 Size
      subchunk2Size & 0xFF,
      (subchunk2Size >> 8) & 0xFF,
      (subchunk2Size >> 16) & 0xFF,
      (subchunk2Size >> 24) & 0xFF,
    ];

    // Combine WAV header and PCM data
    List<int> wavData = List.from(wavHeader)..addAll(pcmData);

    return Uint8List.fromList(wavData);
  }

}
