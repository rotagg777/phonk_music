import 'package:flutter/material.dart';
import '../../data/models/music_model.dart';
import '../musics_list/widgets/music_item.dart';
import 'musicstatemanager.dart';

class LikesScreen extends StatelessWidget {
  final MusicStateManager musicStateManager;

  const LikesScreen({required this.musicStateManager, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Избранные треки"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: musicStateManager,
        builder: (context, child) => musicStateManager.likedMusics.isEmpty
            ? const Center(
          child: Text(
            "Пока нет избранных треков",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
            : ListView.builder(
          itemCount: musicStateManager.likedMusics.length,
          itemBuilder: (context, index) => MusicItem(
            music: musicStateManager.likedMusics[index],
            isLiked: true,
            onLikePressed: () =>
                musicStateManager.toggleLike(musicStateManager.likedMusics[index]),
          ),
        ),
      ),
    );
  }
}
