import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pcmtowave_platform_interface.dart';

/// An implementation of [PcmtowavePlatform] that uses method channels.
class MethodChannelPcmtowave extends PcmtowavePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pcmtowave');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
