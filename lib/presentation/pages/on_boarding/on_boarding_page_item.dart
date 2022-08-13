import 'package:feliz_sabado/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:feliz_sabado/presentation/router.dart';
import 'package:feliz_sabado/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

const _kNextFloatingActionButtonRadius = 72.0;
const _kPageTransitionDuration = Duration(milliseconds: 300);

class OnBoardingPageItem extends StatelessWidget {
  final PageController pageController;
  final String imagePath;
  final String title;
  final String description;
  final int currentIndex;
  final int lastIndex;

  const OnBoardingPageItem({
    Key? key,
    required this.pageController,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentIndex,
    required this.lastIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final headerHeight = screenSize.height * kHeaderPercentOfScreen;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: currentIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Iconsax.arrow_left, color: kBrowColor),
                onPressed: () => pageController.previousPage(
                  duration: _kPageTransitionDuration,
                  curve: Curves.easeInOut,
                ),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: headerHeight,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: AppTheme.borderRadius(),
                  bottomRight: AppTheme.borderRadius(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(child: Image.asset(imagePath)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppTheme.paddingPxX4),
              child: Column(
                children: [
                  AppTheme.separatorVX4(),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                  AppTheme.separatorVX2(),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SafeArea(
              child: SizedBox(
                width: _kNextFloatingActionButtonRadius,
                height: _kNextFloatingActionButtonRadius,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      if (currentIndex == lastIndex) {
                        Navigator.of(context)
                            .pushReplacementNamed(kRouteHomePage);
                        // TODO: Save OnBoarding viewed in Shared Preferences.
                        return;
                      }
                      pageController.nextPage(
                        duration: _kPageTransitionDuration,
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Icon(Iconsax.arrow_right_1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
