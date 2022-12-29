import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'home.dart';

void main() async {
  await GetStorage.init('Storage');
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  Main({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
