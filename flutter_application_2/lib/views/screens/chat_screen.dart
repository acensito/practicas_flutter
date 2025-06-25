import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/widgets/chat/my_message_bubble.dart';
import 'package:flutter_application_2/views/widgets/her_message_buble.dart';
import 'package:flutter_application_2/views/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        titleTextStyle: TextStyle(color: Colors.white),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Sophie_Ellis-Bextor_2015.jpg/640px-Sophie_Ellis-Bextor_2015.jpg',
            ),
          ),
        ),
        title: Text('Mi amor'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? HerMessageBubble()
                      : MyMessageBubble();
                },
              ),
            ),
            //inicio de la caja de texto
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
