import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuda_lager/services/synchro_controller.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import '../business_logic/auth_controller.dart';
import '../main.dart';
import '../services/scanner_controller.dart';
import '../ui_widgets/alert_warnings.dart';
import '../conf/conf.dart';

/// Widget representing Login Screen
class LoginView extends StatefulWidget {
  final Stream<double>? progressStream;
  LoginView(this.progressStream);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final textEditController = TextEditingController();
  double progress = 0.0;
  StreamSubscription<double>? progressSubscription;

  @override
  void dispose() {
    textEditController.dispose();
    progressSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.progressStream != null) {
      progressSubscription = widget.progressStream!.listen((synchroProgress) {
        setState(() {
          progress = synchroProgress;
        });
      });
    }
  }

  void loginWithBarcode(String barcode) async {
    var authController = Provider.of<AuthController>(context, listen: false);
    var success = await authController.loginWithBarcode(barcode);
    _handleLoginSuccess(success: success, context: context);
  }

  void loginWithNumber(BuildContext context) async {
    var authController = Provider.of<AuthController>(context, listen: false);
    var userNumber = textEditController.text;

    var success = await authController.loginWithUserNumber(userNumber);
    _handleLoginSuccess(success: success, context: context);
  }

  @override
  Widget build(BuildContext context) {
    var scanner = Provider.of<ScannerController>(context);
    scanner.registerCallback(loginWithBarcode);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(value: progress),
            Flexible(
              child: SizedBox(
                height: 180,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mitarbeiternummer',
                    ),
                    controller: textEditController,
                    onSubmitted: (value) {
                      loginWithNumber(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: TextButton(
                    onPressed: () {
                      loginWithNumber(context);
                    },
                    child: Icon(
                      Icons.done,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (conf_use_barcode_for_login)
              GestureDetector(
                  onTapDown: (tapDownDetails) {
                    scanner.startScan();
                  },
                  onTapUp: (tapUpDetails) {
                    scanner.stopScan();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Center(
                      child:
                          Icon(Mdi.barcodeScan, size: 35, color: Colors.white),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLoginSuccess(
      {required bool success, required BuildContext context}) async {
    if (success) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => MyHomePage(),
      ));
    } else {
      setState(() {
        buildAlert(
                context, "", "Die Mitarbeiternummer oder Barcode ist ungültig!")
            .show();
      });
    }
  }
}
