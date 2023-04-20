import 'package:flutter/material.dart';
import 'package:training_and_testing/test_room/test_room.dart';
import 'app.dart';

void main() {
  const isTest = false;
  // const isTest = true;

  // ignore: dead_code
  if (isTest) {
    runApp(const TestApp());
    return;
  }

  runApp(BonusesApp());
}
