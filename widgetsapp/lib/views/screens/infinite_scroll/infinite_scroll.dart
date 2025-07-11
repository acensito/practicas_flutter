import 'package:flutter/material.dart';

class InfiniteScroll extends StatefulWidget {

  static const routeName = 'infinite_screen';

  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {

  List<int> imageIds = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: imageIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imageIds[index]}/500/300'),
              );
            },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.of(context).pop(); },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}