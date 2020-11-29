import "package:finalcrypto/btc.dart" show btc;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondRoute extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<SecondRoute> {
  int final_val = 0;
  double _value = 0.0;
  double op = 0.0;
  double op1 = 1.0;
  var print_this = 20;
  var newvar = "some";
  String text = "Choose a value between 0 to 50 and press Submit";
  void _setvalue(double value) {
    setState(() {
      _value = value;
      final_val = (_value * 50).round();
      op = 0.0;
    });
  }

  void changeText() {
    setState(() {
      text = "You chose the value $final_val. Press next to see the graph";
      op = 1.0;
    });
  }

  void web() async {
    var url = "http://65.0.177.168/cgi-bin/litecoin_prediction.py?x=$final_val";
    var response = await http.get(url);
    print(response.body);
    setState(() {
      print_this = response.statusCode;
      newvar = print_this.toString();
      print(newvar);
    });
    print(print_this);
    print_this = 100;
  }

  Widget get submitRatingButton {
    return FlatButton(
      onPressed: () {
        web();
        changeText();
      },
      child: Text('Submit'),
      color: Colors.amber[200],
    );
  }

  Widget get getgraph {
    return FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => btc()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
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
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(children: <Widget>[
            new Text(final_val.toString()),
            new Slider(value: _value, onChanged: _setvalue),
            submitRatingButton,
            SizedBox(
              height: 16,
            ),
            Center(
                child: Container(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )),
            SizedBox(
              height: 297,
            ),
            Opacity(
              opacity: op,
              child: getgraph,
            ),
          ]),
        ),
      ),
    );
  }
}
