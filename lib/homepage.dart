import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ia_ultimate/widgetsurl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _speechToText = stts.SpeechToText();
  bool islisteing = false;
  String text = 'Please Press the button for speaking.';
  List<String> textos = ['Please Press the button for speaking.'];
  void listen() async {
    if (!islisteing) {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print("$status"),
        onError: (errorNotification) => print("$errorNotification"),
      );
      if (available) {
        setState(() {
          islisteing = true;
        });
        _speechToText.listen(
          onResult: (result) => setState(() {
            text = result.recognizedWords;
            textos = text.split(' ');
            print(textos);
          }),
        );
      }
    } else {
      setState(() {
        islisteing = false;
      });

      _speechToText.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _speechToText = stts.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Speech To Text',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  children: textos
                      .map((e) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: ActionChip(
                              label: Text(e),
                              backgroundColor: Colors.green,
                              onPressed: () => {
                                _launch(Uri(
                                    scheme: "https",
                                    host: "www.google.com",
                                    path: "/search",
                                    queryParameters: {"q": e}))
                              },
                            ),
                          ))
                      .toList(),
                ))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: islisteing,
        repeat: true,
        endRadius: 80,
        glowColor: Colors.red,
        duration: const Duration(milliseconds: 1000),
        child: FloatingActionButton(
          onPressed: () {
            listen();
          },
          child: Icon(islisteing ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  buildTexturl() {
    List<Widget> chips = [];
    for (var texto in textos) {
      chips.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: ActionChip(
          label: Text(texto),
          backgroundColor: Colors.green,
          onPressed: () => {
            _launch(Uri(
                scheme: "https",
                host: "www.google.com",
                path: "/search",
                queryParameters: {"q": texto}))
          },
        ),
      ));
    }
  }
}
