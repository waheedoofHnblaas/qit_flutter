
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future errorDialog(data) {
  return Get.defaultDialog(
    title: data,
    content: const Text(''),
  );
}