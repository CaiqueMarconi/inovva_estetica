import 'package:flutter/cupertino.dart';

@immutable
abstract class IAppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IAppException({required this.message, required this.stackTrace});
}
