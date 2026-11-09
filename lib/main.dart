import 'package:flutter/material.dart';
import 'package:xc_app_module/xc_app_module.dart';

/// 壳工程的入口：只有两件事——bootstrap（装配层完成）+ runApp。
/// 主题、Module 装配、首屏、全局浮层都在 xc_app_module 里，这里不掺业务。
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();
  runApp(const XcApp());
}
