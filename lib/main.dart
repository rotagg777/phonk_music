import 'package:flutter/material.dart';
import 'package:phonk_music/ui/musics_list/likes_screen.dart';
import 'package:phonk_music/ui/musics_list/musics_list_page.dart';
import 'package:phonk_music/ui/musics_list/musicstatemanager.dart';
import 'package:phonk_music/ui/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final MusicStateManager musicStateManager = MusicStateManager();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MusicsListPage(musicStateManager: musicStateManager),
      LikesScreen(musicStateManager: musicStateManager),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Станции',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Любимые',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'музыка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Библиотека',
          ),
        ],
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
