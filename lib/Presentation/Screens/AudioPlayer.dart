import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_trip/Presentation/constants.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer = AssetsAudioPlayer();
bool isFirst = true;

class AudioPlayer extends StatefulWidget {
  final String link;
  final String title;

  AudioPlayer({@required this.link, this.title});

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  bool isPlaying = assetsAudioPlayer.isPlaying.value;

  @override
  void dispose() {
    assetsAudioPlayer.pause();
    assetsAudioPlayer.stop();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              assetsAudioPlayer.pause();
              assetsAudioPlayer.dispose();
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          'Player',
          style: kTitle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            RawMaterialButton(
              onPressed: () async {
                if (isFirst) {
                  try {
                    await assetsAudioPlayer.open(Audio.network(widget.link),
                        showNotification: true, autoStart: true);
                    isFirst = false;
                  } catch (t) {
                    print(t);
                    print('Exception Occurred');
                  }
                }
                setState(() {
                  isPlaying = !assetsAudioPlayer.isPlaying.value;
                });
                assetsAudioPlayer.playOrPause();
              },
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 35.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            )
          ],
        ),
      ),
    );
  }
}
