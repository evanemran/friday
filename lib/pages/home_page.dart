import 'package:flutter/material.dart';
import 'package:friday/models/request_model.dart';
import 'package:friday/requests/request_manager.dart';

import '../constants/strings.dart';
import '../models/message.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/recieved_message_widget.dart';
import '../widgets/sent_message_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>{
  final ScrollController scrollController = ScrollController();

  List<Message> list = [
    Message("How can I help you?", 1),
  ];

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  void sendRequest(RequestModel requestModel) async {
    Message message = await Manager().chat(requestModel);
    setState(() {
      list.removeLast();
      list.add(message);
    });
    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friday"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, position) {
                  var item = list[position];
                  if(item.type==0) {
                    return InkWell(
                      child: SentMessage(message: list[position].message),
                    );
                  }
                  else {
                    return InkWell(
                      child: ReceivedMessage(message: list[position].message),
                    );
                  }
                })),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarWidget(onCLicked: (text) {
                Message ownMessage = Message(text, 0);
                setState(() {
                  list.add(ownMessage);
                  list.add(Message("Getting response...", 3));
                });
                scrollToBottom();
                sendRequest(RequestModel(query: text, key: AppStrings.apiKey, unit: "1674369275094"));
              },),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
