import 'package:flutter/material.dart';

void main() {
  runApp(btc());
}

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
        body: Container(
          width: MediaQuery.of(context).size.width * 0.94,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            color: Colors.white70,
            elevation: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.28,
                      maxHeight: MediaQuery.of(context).size.width * 0.28,
                    ),
                    child: Image.asset('lib/images/burger_texas_angus.jpg',
                        fit: BoxFit.fill),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          'Texas Angus Burger',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Text(
                          '100% Australian Angus grain-fed beef with cheese and pickles.  Served with fries.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 40, 0, 0),
                      child: Text(
                        '\$ 24.00',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
