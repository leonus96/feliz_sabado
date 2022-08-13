import 'package:feliz_sabado/presentation/pages/music/music_page.dart';
import 'package:feliz_sabado/presentation/pages/preferences/preferences_page.dart';
import 'package:feliz_sabado/presentation/pages/the_wait/the_wait_page.dart';
import 'package:feliz_sabado/presentation/pages/thought/thought_page.dart';
import 'package:feliz_sabado/presentation/router.dart';
import 'package:feliz_sabado/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = [
    const MusicPage(),
    const TheWaitPage(),
    const ThoughtPage(),
    const PreferencesPage(),
  ];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _currentIndex == 1 ? kPrimaryColor : Theme.of(context).canvasColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: AppTheme.paddingPxX2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: AppTheme.borderRadius(),
              topRight: AppTheme.borderRadius(),
            ),
            border: _currentIndex == 1
                ? null
                : Border.all(color: Colors.black12, width: 0.5)),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            if (i == _pages.length) {
              Navigator.of(context).pushReplacementNamed(kRouteOnBoarding);
              return;
            }

            setState(() => _currentIndex = i);
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.music),
              title: const Text("Cánticos"),
              selectedColor: Colors.red,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.timer),
              title: const Text("La espera"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.book),
              title: const Text("Meditación"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.setting),
              title: const Text("Opciones"),
              selectedColor: kBrownColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.note),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
