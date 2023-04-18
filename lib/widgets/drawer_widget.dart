import 'package:flutter/material.dart';
import 'package:friday/styles/app_colors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          DrawerHeader(
              // decoration: const BoxDecoration(
              //   color: AppColors.mainColor,
              // ),
              child: SizedBox(
                width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/foxy.png",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 10,),
                const Text("Foxy - AI Assistant", style: TextStyle(color: Colors.white, fontSize: 14),),
                const SizedBox(height: 10,),
                const Text("Powered by OpenAI", style: TextStyle(color: Colors.white54, fontSize: 12),),
              ],
            ),
          )),
          Expanded(child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(8,4,8,0),
                decoration: BoxDecoration(
                  color: selectedIndex==0 ? AppColors.mainColor : AppColors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Image.asset("assets/foxy.png"),
                  ),
                  title: const Text(
                    'Text Chat',
                    style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.normal, color: Colors.white ,fontFamily: "Roboto"),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.of(context).pop(true);
                    // widget.onTapped(DrawerMenu(1, "Courses"));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8,4,8,0),
                decoration: BoxDecoration(
                  color: selectedIndex==1 ? AppColors.mainColor : AppColors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Image.asset("assets/foxy.png"),
                  ),
                  title: const Text(
                    'Voice Chat',
                    style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.normal, color: Colors.white ,fontFamily: "Roboto"),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.of(context).pop(true);
                    // widget.onTapped(DrawerMenu(1, "Courses"));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8,4,8,0),
                decoration: BoxDecoration(
                  color: selectedIndex==2 ? AppColors.mainColor : AppColors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Image.asset("assets/foxy.png"),
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.normal, color: Colors.white ,fontFamily: "Roboto"),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.of(context).pop(true);
                    // widget.onTapped(DrawerMenu(1, "Courses"));
                  },
                ),
              ),
            ],
          )),
          Padding(padding: EdgeInsets.all(8),
            child: Text("Version 0.1", style: TextStyle(color: Colors.white54),),)
        ],
      ),
    );
  }
}
