#include "include/api/api_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "api_plugin.h"

void ApiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  api::ApiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
