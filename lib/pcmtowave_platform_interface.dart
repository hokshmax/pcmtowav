import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pcmtowave_method_channel.dart';

abstract class PcmtowavePlatform extends PlatformInterface {
  /// Constructs a PcmtowavePlatform.
  PcmtowavePlatform() : super(token: _token);

  static final Object _token = Object();

  static PcmtowavePlatform _instance = MethodChannelPcmtowave();

  /// The default instance of [PcmtowavePlatform] to use.
  ///
  /// Defaults to [MethodChannelPcmtowave].
  static PcmtowavePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PcmtowavePlatform] when
  /// they register themselves.
  static set instance(PcmtowavePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
