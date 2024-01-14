#ifndef FLUTTER_PLUGIN_PCMTOWAVE_PLUGIN_H_
#define FLUTTER_PLUGIN_PCMTOWAVE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace pcmtowave {

class PcmtowavePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PcmtowavePlugin();

  virtual ~PcmtowavePlugin();

  // Disallow copy and assign.
  PcmtowavePlugin(const PcmtowavePlugin&) = delete;
  PcmtowavePlugin& operator=(const PcmtowavePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace pcmtowave

#endif  // FLUTTER_PLUGIN_PCMTOWAVE_PLUGIN_H_
