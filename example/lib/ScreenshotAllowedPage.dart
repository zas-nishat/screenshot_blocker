import 'package:flutter/material.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';

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
