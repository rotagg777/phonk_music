import 'package:flutter/material.dart';
import '../../data/models/music_model.dart';

class MusicStateManager extends ChangeNotifier {
  final List<MusicModel> likedMusics = [];

  void toggleLike(MusicModel music) {
    if (likedMusics.contains(music)) {
      likedMusics.remove(music);
    } else {
      likedMusics.add(music);
    }
    notifyListeners(); // Оповещаем виджеты об изменениях
  }
}
