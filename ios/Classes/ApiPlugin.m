#import "ApiPlugin.h"
#if __has_include(<api/api-Swift.h>)
#import <api/api-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "api-Swift.h"
#endif

@implementation ApiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftApiPlugin registerWithRegistrar:registrar];
}
@end
