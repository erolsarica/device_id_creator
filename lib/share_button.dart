import 'package:flutter/material.dart';

shareButton(String title, Function()? onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      onPrimary: Colors.white,
      shape: const StadiumBorder(),
    ),  
    onPressed: () {},
    child: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
  );
}
