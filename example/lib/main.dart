import 'package:flutter/material.dart';
import 'package:flutter_kbz_pay/flutter_kbz_pay.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String prepayId = 'xxxxxxx',
      merchCode = 'xxxxxxxx',
      appId = 'xxxxxxxx',
      signKey = 'xxxxxxxx';
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    FlutterKbzPay.onPayStatus().listen((event) {
      print('onPayStatus $event');
    });
  }

  void success(dynamic data) {
    print(data);
  }

  void error(dynamic data) {
    print(data);
  }

  void startPay() {
    FlutterKbzPay.startPay(
      prepayId: this.prepayId,
      merchCode: this.merchCode,
      appId: this.appId,
      urlScheme: 'KbzPayExample',
      signKey: this.signKey,
    ).then((res) {
      print('startPay' + res.toString());
    });
  }

  void instantStartPay({
    required String buildInfo,
    required String signKey,
    required String signType,
  }) {
    FlutterKbzPay.instantStartPay(
      buildInfo: buildInfo,
      urlScheme: 'KbzPayExample',
      signType: signType,
      signKey: signKey,
    ).then((res) {
      print('startPay' + res.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'prepayId:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7826ea),
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: 'xxxxxxx',
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                    validator: (String? value) => value == null ? '' : null,
                    onSaved: (String? value) =>
                        value != null ? prepayId = value : null,
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'merchCode:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7826ea),
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: 'xxxxxxx',
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                    validator: (String? value) => value == null ? '' : null,
                    onSaved: (String? value) =>
                        value == null ? null : merchCode = value,
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'appId:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7826ea),
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: 'xxxxxxx',
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                    validator: (String? value) => value == null ? '' : null,
                    onSaved: (String? value) =>
                        value == null ? null : appId = value,
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'signKey:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7826ea),
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: 'xxxxxxx',
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                    validator: (String? value) => value == null ? '' : null,
                    onSaved: (String? value) =>
                        value == null ? null : signKey = value,
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                    child: Text('Pay'),
                    onPressed: () {
                      startPay();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Instant Pay'),
                    onPressed: () {
                      instantStartPay(
                        buildInfo: "xxxxxx",
                        signKey: "xxxxxx",
                        signType: "SHA256",
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
