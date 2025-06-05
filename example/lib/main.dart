import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';

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

class ScreenshotAllowedPage extends StatefulWidget {
  const ScreenshotAllowedPage({super.key});

  @override
  State<ScreenshotAllowedPage> createState() => _ScreenshotAllowedPageState();
}

class _ScreenshotAllowedPageState extends State<ScreenshotAllowedPage> {
  @override
  void initState() {
    super.initState();
    ScreenshotBlocker.clearSecureScreen();
  }

  @override
  void dispose() {
    super.dispose();
    ScreenshotBlocker.secureScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screenshot Allowed Page')),
      body: const Center(
        child: Text(
          'You can take a screenshot on this page.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
