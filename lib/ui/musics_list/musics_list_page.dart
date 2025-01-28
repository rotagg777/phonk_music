import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../data/models/music_model.dart';
import '../audio_player/audio_player_page.dart';
import '../musics_list/widgets/music_item.dart';
import 'musicstatemanager.dart';

class MusicsListPage extends StatefulWidget {
  final MusicStateManager musicStateManager;

  const MusicsListPage({required this.musicStateManager, super.key});

  @override
  State<MusicsListPage> createState() => _MusicsListPageState();
}

class _MusicsListPageState extends State<MusicsListPage> {
  int currentMusic = 0;
  final player = AudioPlayer();
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phonk Музыка"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListenableBuilder(
        listenable: widget.musicStateManager,
        builder: (context, child) => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: musics.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentMusic = index;
                isOpened = !isOpened;
              });
            },
            child: MusicItem(
              music: musics[index],
              isLiked: widget.musicStateManager.likedMusics.contains(musics[index]),
              onLikePressed: () => widget.musicStateManager.toggleLike(musics[index]),
            ),
          ),
        ),
      ),
    );
  }
}
