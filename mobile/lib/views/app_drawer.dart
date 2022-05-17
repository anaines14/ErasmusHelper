import 'package:erasmus_helper/views/account_page.dart';
import 'package:erasmus_helper/views/help_page.dart';
import 'package:erasmus_helper/views/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// App generic drawer, to show the application settings
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Text("Erasmus Helper"),
          ),
          ListTile(
            title: const Text("Account"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: const Text("Help"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));
            },
          )
        ],
      ),
    );
  }
}
