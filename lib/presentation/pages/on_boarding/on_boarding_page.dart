import 'package:feliz_sabado/presentation/pages/on_boarding/on_boarding_content.dart';
import 'package:feliz_sabado/presentation/pages/on_boarding/on_boarding_page_item.dart';
import 'package:feliz_sabado/presentation/theme.dart';
import 'package:flutter/material.dart';

const kHeaderPercentOfScreen = 0.35;
const _kCirclePageIndicatorSize = 8.0;

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
    final screenSize = MediaQuery.of(context).size;
    final headerHeight = screenSize.height * kHeaderPercentOfScreen;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
          body: Column(
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
              ),
              Expanded(child: Container()),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: onBoardingContent
                      .asMap()
                      .entries
                      .map(
                          (e) => _CirclePageItem(isActive: e.key == _pageIndex))
                      .toList(growable: false),
                ),
              )
            ],
          ),
        ),
        PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: onBoardingContent.map((e) {
            return OnBoardingPageItem(
              pageController: _controller,
              currentIndex: _pageIndex,
              lastIndex: onBoardingContent.length - 1,
              imagePath: e['imagePath']!,
              title: e['title']!,
              description: e['description']!,
            );
          }).toList(growable: false),
        ),
      ],
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
          border: Border.all(color: kBrownColor, width: 2.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
