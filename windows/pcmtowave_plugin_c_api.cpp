#include "include/pcmtowave/pcmtowave_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "pcmtowave_plugin.h"

void PcmtowavePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  pcmtowave::PcmtowavePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
