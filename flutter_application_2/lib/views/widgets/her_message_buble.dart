import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola guapo', style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 5),
        _ImageBubble(),
        SizedBox(height: 5),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: Image.network(
        'https://yesno.wtf/assets/no/17-829284e9dd894ce9fb65fbe86d2e382c.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
