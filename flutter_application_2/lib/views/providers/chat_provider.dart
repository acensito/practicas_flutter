import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/helpers/get_yes_no_answers.dart';
import 'package:flutter_application_2/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswers yesNoAnswers = GetYesNoAnswers();

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresastes de trabajar?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollBottom();
  }

  Future<void> herReply() async {
    final herMessage = await yesNoAnswers.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
