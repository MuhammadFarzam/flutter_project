import 'package:flutter/material.dart';
import 'package:flutter_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading....';
  void setupWorldTimeApi() async {
    WorldTime instance =
        WorldTime(location: 'karachi', flag: 'pakistan', url: 'Asia/Karachi');
    time = await instance.getTimeForPK();
    setState(() {
      time = time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTimeApi();
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(child: Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            ),
            ),
          ),
      )),
    );
  }
}
