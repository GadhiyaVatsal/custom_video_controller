import 'package:flutter/material.dart';

class TvHomeScreen extends StatefulWidget {
  const TvHomeScreen({Key? key}) : super(key: key);

  @override
  _TvHomeScreenState createState() => _TvHomeScreenState();
}

class _TvHomeScreenState extends State<TvHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('First'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
