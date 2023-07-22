import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/models/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = <ChatMessage>[
    const ChatMessage(1, 'Message #1', 2, 1),
    const ChatMessage(
        2,
        'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
        1,
        2),
    const ChatMessage(3, 'Message #3', 2, 1),
    const ChatMessage(
        4,
        'Contrary to popular belief, Lorem Ipsum is not simply random text.',
        1,
        2),
    const ChatMessage(5, 'Message #5', 1, 2),
    const ChatMessage(
        6,
        'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
        2,
        1),
    const ChatMessage(7, 'Message #7', 1, 2),
    const ChatMessage(1, 'Message #1', 2, 1),
    const ChatMessage(
        2,
        'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
        1,
        2),
    const ChatMessage(3, 'Message #3', 2, 1),
    const ChatMessage(
        4,
        'Contrary to popular belief, Lorem Ipsum is not simply random text.',
        1,
        2),
    const ChatMessage(5, 'Message #5', 1, 2),
    const ChatMessage(
        6,
        'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
        2,
        1),
    const ChatMessage(7, 'Message #7', 1, 2),
  ];

  late ScrollController _scrollController;
  late TextEditingController _messageTextController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _messageTextController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat',
        style: GoogleFonts.aBeeZee(
          color: Colors.black,
        )),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF0DE36),
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: _messages.map((ChatMessage chatMessage) {
                    return Align(
                      alignment: chatMessage.senderId == 1
                          ? AlignmentDirectional.topEnd
                          : AlignmentDirectional.topStart,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsetsDirectional.only(
                            bottom: 15,
                            start: chatMessage.senderId == 1 ? 40 : 0,
                            end: chatMessage.senderId != 1 ? 40 : 0),
                        decoration: BoxDecoration(
                          color: chatMessage.senderId == 1
                              ? Colors.orange.shade200
                              : Colors.teal.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: chatMessage.senderId == 1
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                          children: [
                            Text(
                              chatMessage.message,
                              style: GoogleFonts.nunito(),
                            ),
                            Text(
                              '9:35am',
                              style: GoogleFonts.nunito(
                                  fontSize: 12, color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _messageTextController,
                  maxLines: 3,
                  minLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Enter message here...',
                      enabledBorder: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () => _preformSendMessage(),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _preformSendMessage() {
    if (_checkData()) {
      _sendMessage();
    }
  }

  bool _checkData() {
    return _messageTextController.text.isNotEmpty;
  }

  void _sendMessage() {
    setState(() {
      _messages.add(ChatMessage(1, _messageTextController.text, 1, 2));
    });
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.position.moveTo(
        double.infinity,
        duration: Duration(milliseconds: 100),
      );
    });

    // _scrollController.position.animateTo(300,
    //     duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    // _scrollController.position.jumpTo(300);
    _messageTextController.clear();
  }
}
