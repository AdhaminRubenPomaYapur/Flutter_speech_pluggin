/*import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class textosUrl extends StatefulWidget {
  final List<String> textos;
  textosUrl({Key key, this.textos}) : super(key: key);

  @override
  State<textosUrl> createState() => _textosUrlState();
}

class _textosUrlState extends State<textosUrl> {
  Future<void> _launch(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: buildTexturl(),
    );
  }
}

/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'URL Launcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launch(Uri(
                      scheme: 'https', host: 'www.google.com.bo', path: '/'));
                }),
                child: const Text('Abrir en navegador'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launch(Uri(scheme: 'tel', host: '+59170495671'));
                }),
                child: const Text('Abrir llamada'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launch(Uri(
                      scheme: 'mailto', path: 'joseandreshurtadov@gmail.com'));
                }),
                child: const Text('Abrir email'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
            ],
          ),
        ],
      ),
    );
  }
}
 */*/