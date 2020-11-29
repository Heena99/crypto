import 'package:crypto_font_icons/crypto_font_icons.dart' show CryptoFontIcons;
import 'package:finalcrypto/btc.dart';
import 'package:flutter/material.dart';
import 'package:finalcrypto/bitcoin.dart' show SecondRoute;

void main() => runApp(MaterialApp(
      home: MyApp(),
      routes: {
        "/second": (context) => SecondRoute(),
        "/bitcoinimg": (context) => btc(),
      },
    ));

class MyApp extends StatelessWidget {
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
            body: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                      leading: Icon(CryptoFontIcons.BTC),
                      title: Text('Bitcoin'),
                      trailing: RaisedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          })),
                  ListTile(
                      leading: Icon(CryptoFontIcons.LTC),
                      title: Text('Litecoin'),
                      trailing: RaisedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          })),
                  ListTile(
                      leading: Icon(CryptoFontIcons.ETC),
                      title: Text('Ethereum'),
                      trailing: RaisedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          })),
                  ListTile(
                      leading: Icon(CryptoFontIcons.NMC),
                      title: Text('Namecoin'),
                      trailing: RaisedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          })),
                  ListTile(
                      leading: Icon(CryptoFontIcons.PPC),
                      title: Text('Peercoin'),
                      dense: false,
                      trailing: RaisedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          })),
                  ListTile(
                      leading: Icon(CryptoFontIcons.NUC),
                      title: Text('Novacoin'),
                      trailing: RaisedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          }))
                ],
              ).toList(),
            )));
  }
}
