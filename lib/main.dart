import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vital/core/presentation/widgets/custom_dropdown.dart';

import 'my_app.dart';

void main() {
  runApp( MyApp());
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDropDown(onChange: (int value) { if (kDebugMode) {
                print(value);
              } },),
            ),
          ],
        ),
      ),
    );
  }
}
