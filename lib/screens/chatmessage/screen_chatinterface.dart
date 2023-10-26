import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/chatmessage/chatbuuble.dart';
import 'package:dream_sports_user/services/chat_service.dart';
import 'package:dream_sports_user/services/firestore_service.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class ChatInterface extends StatefulWidget {
  final String userphone;
  final String reciverid;
  final String username;
  const ChatInterface(
      {super.key,
      required this.username,
      required this.userphone,
      required this.reciverid});

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  final messagecontroller = TextEditingController();
  final ChatService _chatService = ChatService();

  void sendmessages() async {
    if (messagecontroller.text.isNotEmpty) {
      await _chatService.sendmessage(
          reciverid: widget.reciverid, message: messagecontroller.text);
      messagecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: blackback,
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: whiteback,
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(radius: 25),
              const SizedBox(width: 30),
              headingtext(heading: widget.username),
            ],
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: buildmessagelist(),
              ),
              buildmessageinput(),
            ],
          ),
        )));
  }

  Widget buildmessagelist() {
    return StreamBuilder(
      stream: _chatService.getmessages(
          userid: widget.reciverid, otheruserid: auth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error....!${snapshot.error}'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Loading....!'));
        }
        return ListView(
            children: snapshot.data!.docs
                .map((document) => buildmessageitem(document))
                .toList());
      },
    );
  }

  Widget buildmessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderid'] == auth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: chatbubble(
        message: data['message'],
        senderid: data['senderid'],
        color: data['senderid'] == auth.currentUser!.uid
            ? homecolor
            : Color.fromARGB(255, 122, 255, 126),
      ),
    );
  }

  buildmessageinput() {
    return Row(
      children: [
        Expanded(
          child: textfield1(controller: messagecontroller, hint: 'Message'),
        ),
        ElevatedButton(
          onPressed: sendmessages,
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.send,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
