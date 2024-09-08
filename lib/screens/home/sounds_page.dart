import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1000,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/sounds-page-bg.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Card(
              elevation: 4.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.0),
                    const Text(
                      "Listen & Unwind",
                      style: TextStyle(
                        fontFamily: 'FontMainHeavy',
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      width: 300,
                      child: Center(
                        child: Text(
                          'Sit back, relax, and listen to these soothing sounds, curated just for you.',
                          style: TextStyle(
                            fontFamily: 'FontMain',
                            fontSize: 14.0,
                            color: Colors.grey[300],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                  //bottomLeft: Radius.circular(25.0),
                  //bottomRight: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
               // Adjust the height as needed
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    AudioWidget(title: 'Forest', audioFilePath: 'sounds/birds-singing-forest-sound.mp3'),
                    AudioWidget(title: 'Gushing River', audioFilePath: 'sounds/river-sound.mp3'),
                    AudioWidget(title: 'Calm River', audioFilePath: 'sounds/calm-river-sound.mp3'),
                    AudioWidget(title: 'Heavy Rain', audioFilePath: 'sounds/heavy-rain-sound.mp3'),
                    AudioWidget(title: 'Thunder', audioFilePath: 'sounds/natural-thunder-sound.mp3'),
                    AudioWidget(title: 'Cafe Ambience', audioFilePath: 'sounds/cafe-ambience-sound.mp3'),
                    AudioWidget(title: 'Brown Noise', audioFilePath: 'sounds/brown-noise-sound.mp3'),
                    AudioWidget(title: 'Sandy Beach', audioFilePath: 'sounds/beach-ocean-waves-sound.mp3'),
                    AudioWidget(title: 'Piano Ambience', audioFilePath: 'sounds/piano-ambience-sound.mp3'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AudioWidget extends StatefulWidget {
  final String title;
  final String audioFilePath;

  AudioWidget({required this.title, required this.audioFilePath});

  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title, style: TextStyle(fontFamily: 'FontMainSemibold')),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.playpause_fill),
            onPressed: () {
              player.play(AssetSource(widget.audioFilePath));
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.stop_fill),
            onPressed: () {
              player.stop();
            },
          ),
        ],
      ),
    );
  }
}
