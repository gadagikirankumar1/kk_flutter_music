import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _songs;
  @override
  void initState() {
    super.initState();
    initMusicPlayer();
  }

  void initMusicPlayer() async {
    var songs = await MusicFinder.allSongs();
    songs = List.from(songs);
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget home() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Music Player"),
        ),
        body: ListView.builder(
          itemCount: _songs.length,
          itemBuilder: (context, int index) {
            return new ListTile(
              leading: new CircleAvatar(
                child: Text(_songs[index].title[0]),
              ),
              title: Text(_songs[index].title),
            );
          },
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
