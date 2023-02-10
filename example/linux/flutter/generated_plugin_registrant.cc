//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <api/api_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) api_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ApiPlugin");
  api_plugin_register_with_registrar(api_registrar);
}
