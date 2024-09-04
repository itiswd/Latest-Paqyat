import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paqy_yat/quran.dart';

class VerseAudio extends StatefulWidget {
  final int index;
  final dynamic previousVerses;
  final String av;
  const VerseAudio({
    super.key,
    required this.index,
    this.previousVerses,
    required this.av,
  });

  @override
  State<VerseAudio> createState() => _VerseAudioState();
}

class _VerseAudioState extends State<VerseAudio> {
  bool isplayyyy = false;
  String av = '';
  AudioPlayer palyVersAudio = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(
          () {
            av = widget.av;
          },
        );
        if (isplayyyy == false) {
          isplayyyy = true;
          await palyVersAudio.play(UrlSource(widget.av));
        } else if (isplayyyy == true) {
          isplayyyy = false;
          await palyVersAudio.pause();
        }
        palyVersAudio.onPlayerComplete.listen(
          (event) {
            setState(
              () {
                isplayyyy = false;
              },
            );
          },
        );
      },
      child: Icon(
        isplayyyy == false ? Icons.play_arrow : Icons.pause,
        color: qurantext,
        size: 22,
      ),
    );
  }
}
