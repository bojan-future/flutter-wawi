import 'package:flutter/material.dart';
import '../views/login_view.dart';

/// MaterialApp Wrap for the tested widget
class LoginViewTestWidgetWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginViewTestWidget();
  }
}

///
class LoginViewTestWidget extends StatefulWidget {
  @override
  _LoginViewTestWidgetState createState() => _LoginViewTestWidgetState();
}

class _LoginViewTestWidgetState extends State<LoginViewTestWidget> {
  @override
  Widget build(BuildContext context) {
    Stream<double> testStream = Stream<double>.value(1.0);
    return MaterialApp(
      home: LoginView(testStream),
    );
  }
}
