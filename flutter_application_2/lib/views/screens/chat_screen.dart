import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/message.dart';
import 'package:flutter_application_2/views/providers/chat_provider.dart';
import 'package:flutter_application_2/views/widgets/chat/my_message_bubble.dart';
import 'package:flutter_application_2/views/widgets/chat/her_message_buble.dart';
import 'package:flutter_application_2/views/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: chatProvider.messageList[index],)
                      : MyMessageBubble(message: chatProvider.messageList[index],);
                },
              ),
            ),
            //inicio de la caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
