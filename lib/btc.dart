import 'package:flutter/material.dart';

class btc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/pm.jpg',
                fit: BoxFit.contain,
                height: 32,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                'PredictaMint',
              ),
            ],
          ),
        ),
        body: Image.network(
            'https://flutterbucket12345.s3.ap-south-1.amazonaws.com/prediction1.PNG'),
      ),
    );
  }
}
