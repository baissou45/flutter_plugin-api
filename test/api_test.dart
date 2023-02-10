// import 'package:flutter_test/flutter_test.dart';
// import 'package:api/api.dart';
// import 'package:api/api_platform_interface.dart';
// import 'package:api/api_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockApiPlatform
//     with MockPlatformInterfaceMixin
//     implements ApiPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final ApiPlatform initialPlatform = ApiPlatform.instance;

//   test('$MethodChannelApi is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelApi>());
//   });

//   test('getPlatformVersion', () async {
//     Api apiPlugin = Api();
//     MockApiPlatform fakePlatform = MockApiPlatform();
//     ApiPlatform.instance = fakePlatform;

//     expect(await apiPlugin.getPlatformVersion(), '42');
//   });
// }
