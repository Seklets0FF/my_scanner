import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Scanner Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Scanner Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scanTxt = 'No Scan';

  Future<void> scanCode() async {
    String scanRes;

    scanRes = await FlutterBarcodeScanner.scanBarcode(
        '#28386a', 'Cancel', true, ScanMode.QR);

    if (!mounted) return;

    setState(() {
      _scanTxt = scanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Scan text: \n $_scanTxt',
                style: const TextStyle(fontSize: 23),
              ),
              ElevatedButton(
                  onPressed: () => scanCode(), child: const Text('Start scan'))
            ],
          ),
        ));
  }
}
