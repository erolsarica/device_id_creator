import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceId = 'Unknown';
  final _mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String deviceId;
    try {
      deviceId = await _mobileDeviceIdentifierPlugin.getDeviceId() ?? 'Unknown platform version';
    } on PlatformException {
      deviceId = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _deviceId = deviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mobile Device Identifier',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Device ID',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey[300],
                    ),
                    child: Text(_deviceId, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(height: 30, color: Colors.grey),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Encoded Device ID',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Builder(builder: (context) {
                    String encoded = base64.encode(utf8.encode(_deviceId));
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: Colors.grey[300],
                      ),
                      child: Text(encoded, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    );
                  })
                ],
              )),
        ),
      ),
    );
  }
}
