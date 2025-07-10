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

class AppTutorial extends StatelessWidget {
  static const routeName = 'apptutorial_screen';

  const AppTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
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
          )
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
