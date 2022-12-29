import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'utilities.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _selected_color = Colors.grey;
  GetStorage _storage = GetStorage("Storage");

  void read() async {
    var data = await _storage.read("app_bar_color");
    if (data != null) {
      _selected_color = Color(data);
    }
  }

  void write() async {
    await _storage.write("app_bar_color", _selected_color.value);
  }

  @override
  void initState() {
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _selected_color,
        elevation: 0.0,
        title: Text(
          "Pick your Color",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {
              setState(() {
                _selected_color = colors[index];
                write();
              });
            },
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                Colors.transparent,
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 40.0,
                bottom: 40.0,
              ),
              margin: EdgeInsets.only(
                top: 25.0,
              ),
              decoration: BoxDecoration(
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
