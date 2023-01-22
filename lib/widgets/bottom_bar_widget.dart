import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key, required this.onCLicked}) : super(key: key);

  final Function(String) onCLicked;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.mainColor),
                borderRadius: const BorderRadius.all(Radius.circular(50))
            ),
            child: Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(child: TextField(
                  controller: textEditingController,
                  onChanged: (text) {

                  },
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration.collapsed(
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 18),
                      hintText: "Message",
                      fillColor: Colors.white70),

                ),),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.attachment, color: Colors.blueGrey,),),
                const SizedBox(width: 10,),
              ],
            ),
          )),
          FloatingActionButton.small(
            backgroundColor: AppColors.mainColor,
            tooltip: '',
            child: const Icon(Icons.send_rounded, color: Colors.white,),
              onPressed: () {
              if(textEditingController.text.trim().isNotEmpty) {
                widget.onCLicked.call(textEditingController.text.toString());
                textEditingController.clear();
              }
              },
          )
        ],
      ),
    );
  }
}
