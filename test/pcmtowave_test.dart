import 'package:flutter_test/flutter_test.dart';
import 'package:pcmtowave/pcmtowave.dart';
import 'package:pcmtowave/pcmtowave_platform_interface.dart';
import 'package:pcmtowave/pcmtowave_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPcmtowavePlatform
    with MockPlatformInterfaceMixin
    implements PcmtowavePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PcmtowavePlatform initialPlatform = PcmtowavePlatform.instance;

  test('$MethodChannelPcmtowave is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPcmtowave>());
  });

  test('getPlatformVersion', () async {
    Pcmtowave pcmtowavePlugin = Pcmtowave();
    MockPcmtowavePlatform fakePlatform = MockPcmtowavePlatform();
    PcmtowavePlatform.instance = fakePlatform;

    expect(await pcmtowavePlugin.getPlatformVersion(), '42');
  });
}
