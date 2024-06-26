import 'package:flutter/material.dart';
import 'package:friday/models/request_model.dart';
import 'package:friday/requests/request_manager.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

import '../constants/GenAIConfig.dart';
import '../constants/strings.dart';
import '../main.dart';
import '../models/message.dart';
import '../util/dark_theme_provider.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/recieved_message_widget.dart';
import '../widgets/sent_message_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.isDarkChecked}) : super(key: key);

  final Function(bool) isDarkChecked;

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
      Manager().initChat();
    });
  }

  void sendRequest(RequestModel requestModel) async {
    // Message message = await Manager().chat(requestModel);
    Message message = await Manager().geminiChat(requestModel.prompt!);
    setState(() {
      list.removeLast();
      list.add(message);
    });
    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(children: [Image.asset("assets/foxy.png", height: 30, width: 30,), const SizedBox(width: 10,), const Text("Foxy")],),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              list.clear();
              list.add(Message("How can I help you?", 1));
            });
          }, icon: Image.asset("assets/reload.png", height: 20, width: 20, color: Colors.white,)),


          /*Switch(
            value: isDarkMode,
            onChanged: (value) {
              // widget.isDarkChecked.call(value);
              themeChange.darkTheme = value;
            },
          )*/
        ],
      ),
      drawer: const DrawerWidget(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        // color: Colors.black,
        child: Column(
          children: [
            Expanded(child: ListView.builder(
                controller: scrollController,
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
                sendRequest(RequestModel(text));
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
