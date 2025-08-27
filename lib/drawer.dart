import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String imgurl = 'https://i.pravatar.cc/150?img=3';
    return Drawer(
      backgroundColor: Colors.deepPurpleAccent,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('Musawwir Bhutto'),
              accountEmail: Text('musawwir.human@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imgurl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
