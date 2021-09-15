import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:developer';
import 'dart:core';

typedef ScanResultHandler = void Function(List<ScanResult> datas);
typedef CharacteristicHandler = void Function(List<int> datas);

class BleManager {
  FlutterBlue _flutterBlue;
  factory BleManager() => _getInstance();
  static BleManager get instance => _getInstance();
  static  BleManager _instance;
   BleManager._internal() {
    _flutterBlue = FlutterBlue.instance;
  }
  static BleManager _getInstance() {
    if (_instance == null) {
      _instance = BleManager._internal();
    }
    return _instance;
  }

  startScan(ScanResultHandler dataHandler, {int timeout = 60}) {
    log("_scan");
    // _flutterBlue?.startScan(timeout: Duration(seconds: timeout));

    _flutterBlue?.startScan(timeout: Duration(seconds: timeout),withServices: []);
    // _flutterBlue?.startScan(timeout: Duration(seconds: timeout),withServices: [Guid("0003CDD0-0000-1000-8000-00805F9B0131")]);
    _flutterBlue?.scanResults.listen(dataHandler);
  }

  stopScan() {
    log("_stopScan");
    _flutterBlue?.stopScan();
  }

  Future<void> connectDevice(BluetoothDevice device) async {
    log("_connect");
    await device.connect(autoConnect: false);
  }

  Future<List<BluetoothService>> deviceToDiscoverServices(
      BluetoothDevice device) async {
    return await device.discoverServices();
  }

  Future<bool> characteristicToSetNotifyValue(
      BluetoothCharacteristic characteristic) async {
    return await characteristic.setNotifyValue(true);
  }

  listenCharacteristicValue(BluetoothCharacteristic characteristic,
      CharacteristicHandler characteristicHandler) {
    characteristic.value.listen(characteristicHandler);
  }

  Future<Null> characteristicToWriteValue(
      BluetoothCharacteristic characteristic, List<int> list,{bool withoutResponse = false}) async {
    log("_write  withoutResponse = $withoutResponse",);
    return await characteristic.write(list,withoutResponse: withoutResponse);
  }

  Future<List<int>> characteristicToReadValue(
      BluetoothCharacteristic characteristic) async {
    log("_read");
    return await characteristic.read();
  }

  Future<List<BluetoothDevice>> getConnectedDevices() {
    return _flutterBlue?.connectedDevices;
  }

  Future<dynamic> disconnectDevice(BluetoothDevice device) async {
    log("_disconnect");
    return await device.disconnect();
  }
}
