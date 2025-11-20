import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _player.play(AssetSource('audio/song.mp3'));
    _isPlaying = true;

    // Listen for duration and position updates
    _player.onDurationChanged.listen((d) {
      setState(() => _duration = d);
    });

    _player.onPositionChanged.listen((p) {
      setState(() => _position = p);
    });

    _player.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    });
  }


  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play(AssetSource('audio/Gyubin__Really_Like_You.mp3'));
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = min(constraints.maxWidth, 300);
        final double height = constraints.maxHeight;
        final TextTheme textTheme = Theme.of(context).textTheme;
        return Material(
          color: Colors.white,
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: min(height * 0.5, 350),
                  width: width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Lottie.asset(
                          "assets/music_notes.json",
                          height: 300,
                          width: 300,
                          fit: BoxFit.contain
                        )
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Lottie.asset(
                          "assets/lovely_cats.json",
                          height: 290,
                          width: 290,
                          fit: BoxFit.contain
                        )
                      )
                    ],
                  )
                ),
                Text(
                  "Gyubin - Really Like You 🫰",
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
                Slider(
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  value: _position.inSeconds.toDouble().clamp(0, _duration.inSeconds.toDouble()),
                  onChanged: (value) async {
                    final newPosition = Duration(seconds: value.toInt());
                    await _player.seek(newPosition);
                  },
                ),

                // ⏯ Play/Pause button
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, size: 40, color: Colors.blue),
                  onPressed: _togglePlayPause,
                ),

                // ⏱ Time display
                Text(
                  "${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')} / "
                  "${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",
                ),
              ],
            ),
          )
        );
      }
    );
  }
}

