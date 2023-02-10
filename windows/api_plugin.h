#ifndef FLUTTER_PLUGIN_API_PLUGIN_H_
#define FLUTTER_PLUGIN_API_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace api {

class ApiPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ApiPlugin();

  virtual ~ApiPlugin();

  // Disallow copy and assign.
  ApiPlugin(const ApiPlugin&) = delete;
  ApiPlugin& operator=(const ApiPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace api

#endif  // FLUTTER_PLUGIN_API_PLUGIN_H_
