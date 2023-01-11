import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/design.dart';
import 'package:intel_demo/Widgets/dictionary.dart';
import 'package:intel_demo/Widgets/info.dart';
import 'package:intel_demo/Widgets/response.dart';
import 'package:intel_demo/Widgets/styles.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/kogei.png'),
                    radius: 50,
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text("Vincent Kogei"),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text('Info', style: ThemeStyling.drawerTitle,),
              leading: const Icon(
                      Icons.person_outline_outlined,
                      color: Colors.white,
                    ),
              visualDensity: const VisualDensity(vertical: -4),
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const InfoScreen()));
              },
            ),
             const Divider(),
            ListTile(
              title: const Text('Design', style: ThemeStyling.drawerTitle,),
              leading: const Icon(
                      Icons.design_services_outlined,
                      color: Colors.white,
                    ),
              visualDensity: const VisualDensity(vertical: -4),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DesignScreen()));
              },
            ),
             const Divider(),
            ListTile(
              title: const Text('Response', style: ThemeStyling.drawerTitle,),
              leading:const  Icon(
                      Icons.emergency_outlined,
                      color: Colors.white,
                    ),
              visualDensity: const VisualDensity(vertical: -4),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ResponseScreen()));
              },
            ),
             const Divider(),
            ListTile(
              title: const Text('Dictionary', style: ThemeStyling.drawerTitle,),
              leading:const Icon(
                      Icons.book_outlined,
                      color: Colors.white,
                    ),
              visualDensity: const VisualDensity(vertical: -4),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DictionaryScreen()));
              }, 
            ),
            const Divider(),
           
          ],
        ),
      );
  }
}