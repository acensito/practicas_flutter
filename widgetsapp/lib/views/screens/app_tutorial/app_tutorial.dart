import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Encuentra los mejores restaurantes',
    image: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption: 'Descubre platos de diferentes culturas',
    image: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'Invita a tus amigos a disfrutar juntos',
    image: 'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String image;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.image,
  });
}

class AppTutorial extends StatefulWidget {
  static const routeName = 'apptutorial_screen';

  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final PageController _pageViewController = PageController();
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      final page = _pageViewController.page ?? 0;

      if (!_isLastPage && page >= slides.length - 1.5) {
        setState(() {
          _isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            children: slides.map((slide) {
              return _Slide(
                title: slide.title,
                caption: slide.caption,
                imageUrl: slide.image,
              );
            }).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          _isLastPage
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Salir'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
