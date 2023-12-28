import 'package:flutter/material.dart';

shareButton(String title, Function()? onPressed) {
  return Container(
    width: double.infinity,
    height: 60,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton( 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 2, 141, 211)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
