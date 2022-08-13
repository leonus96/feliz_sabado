import 'package:feliz_sabado/presentation/theme.dart';
import 'package:flutter/material.dart';

class TheWaitPage extends StatelessWidget {
  const TheWaitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text('The Wait'),
      ),
    );
  }
}
