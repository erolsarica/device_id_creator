import 'package:flutter/material.dart';

shareButton(String title, Function()? onPressed) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
  );
}
