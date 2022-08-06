import 'package:feliz_sabado/presentation/pages/on_boarding/on_boarding_content.dart';
import 'package:feliz_sabado/presentation/router.dart';
import 'package:feliz_sabado/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

const _kHeaderPercentOfScreen = 0.4;
const _kNextFloatingActionButtonRadius = 72.0;
const _kCirclePageIndicatorSize = 8.0;
const _kPageTransitionDuration = Duration(milliseconds: 300);

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _pageIndex = 0;

  @override
  void initState() {
    _controller.addListener(_onPageChanged);
    super.initState();
  }

  void _onPageChanged() {
    setState(() {
      _pageIndex = _controller.page?.ceil() ?? 0;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: onBoardingContent.map((e) {
                return _OnBoardingPage(
                  pageController: _controller,
                  currentIndex: _pageIndex,
                  lastIndex: onBoardingContent.length - 1,
                  imagePath: e['imagePath']!,
                  title: e['title']!,
                  description: e['description']!,
                );
              }).toList(growable: false),
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: onBoardingContent
                  .asMap()
                  .entries
                  .map((e) => _CirclePageItem(isActive: e.key == _pageIndex))
                  .toList(growable: false),
            ),
          )
        ],
      ),
    );
  }
}

class _CirclePageItem extends StatelessWidget {
  final bool isActive;

  const _CirclePageItem({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppTheme.paddingPx / 2),
      child: Container(
        width: _kCirclePageIndicatorSize,
        height: _kCirclePageIndicatorSize,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: kBrowColor, width: 2.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _OnBoardingPage extends StatelessWidget {
  final PageController pageController;
  final String imagePath;
  final String title;
  final String description;
  final int currentIndex;
  final int lastIndex;

  const _OnBoardingPage({
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
    final headerHeight = screenSize.height * _kHeaderPercentOfScreen;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: currentIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () => pageController.previousPage(
                  duration: _kPageTransitionDuration,
                  curve: Curves.easeInOut,
                ),
              ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: headerHeight,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: AppTheme.borderRadius(),
                bottomRight: AppTheme.borderRadius(),
              ),
            ),
            child: Center(child: Image.asset(imagePath)),
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
                        curve: Curves.easeInOut);
                  },
                  child: const Icon(Iconsax.arrow_right_1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
