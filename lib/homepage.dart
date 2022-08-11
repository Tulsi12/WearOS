import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wear/wear.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final firstcontroller = TextEditingController();
  final secondcontroller = TextEditingController();
  int result = 0;
  _add() {
    int first = int.parse(firstcontroller.text);
    int second = int.parse(secondcontroller.text);
    setState(() {
      result = first + second;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(builder: (context, mode, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: firstcontroller,
                  decoration: const InputDecoration(
                    labelText: 'First ',
                  ),
                ),
                 TextFormField(
                  controller: secondcontroller,
                  decoration: const InputDecoration(
                    labelText: 'Second ',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _add();
                        Fluttertoast.showToast(
                          msg: 'sum is:$result',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      },
                      child: const Text('Add')),
                )
                  ],
            ),
          ),
        );
      });
    });
  }
}
