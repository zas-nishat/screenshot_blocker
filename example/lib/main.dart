import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';
import 'ScreenshotAllowedPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenshotBlocker.secureScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Screenshot Blocker')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Screenshots are currently blocked on this page.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const ScreenshotAllowedPage());
                },
                child: const Text('Go to Screenshot Allowed Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
