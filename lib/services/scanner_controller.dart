import 'dart:convert';

import 'package:flutter/services.dart';

/// scaner service controller
class ScannerController {
  static ScannerController? _instance;

  ScannerController._internal();

  /// singleton factory
  factory ScannerController() {
    if (_instance == null) {
      _instance = ScannerController._internal();
    }

    return _instance!;
  }

  void Function(String)? _scanCallback;

  ///register callback to be called when any data from scanner arrives
  void registerCallback(void Function(String) scanCallback) {
    _scanCallback = scanCallback;
    _scanChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    _createProfile("KudaLager");
  }

  /// unset callback in order not to receive any scandata
  void unregisterCallback(void Function(String) scanCallback) {
    if (_scanCallback == scanCallback) {
      _scanCallback = null;
    }
  }

  /// turn scanner on
  void startScan() {
    _sendDataWedgeCommand(
        "com.symbol.datawedge.api.SOFT_SCAN_TRIGGER", "START_SCANNING");
  }

  /// turn scanner off
  void stopScan() {
    _sendDataWedgeCommand(
        "com.symbol.datawedge.api.SOFT_SCAN_TRIGGER", "STOP_SCANNING");
  }

  static const MethodChannel _methodChannel =
      MethodChannel('at.futurefactory.kuda_lager/command');
  static const EventChannel _scanChannel =
      EventChannel('at.futurefactory.kuda_lager/scan');

  Future<void> _sendDataWedgeCommand(String command, String parameter) async {
    try {
      var argumentAsJson =
          jsonEncode({"command": command, "parameter": parameter});

      await _methodChannel.invokeMethod(
          'sendDataWedgeCommandStringParameter', argumentAsJson);
    } on PlatformException {
      //  Error invoking Android method
    }
  }

  Future<void> _createProfile(String profileName) async {
    try {
      await _methodChannel.invokeMethod('createDataWedgeProfile', profileName);
    } on PlatformException {
      //  Error invoking Android method
    }
  }

  void _onEvent(dynamic event) {
    if (_scanCallback != null) {
      Map barcodeScan = jsonDecode(event);
      _scanCallback!(barcodeScan['scanData']);
    }
  }

  void _onError(Object error) {
    if (_scanCallback != null) {
      _scanCallback!("Scan Error");
    }
  }
}
