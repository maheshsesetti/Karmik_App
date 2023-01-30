import 'package:flutter/material.dart';

abstract class SUSPage<T> extends Page<T> {
  final String keyValue;
  final String routeName;

  SUSPage({
    required this.keyValue,
    required this.routeName,
  }) : super(key: ValueKey(keyValue), name: routeName);
}
