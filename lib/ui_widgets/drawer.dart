import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../views/inventory_view.dart';
import '../views/login_view.dart';

//ignore_for_file: public_member_api_docs

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Kuda Lager',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Mdi.buffer),
            title: Text('Inventur'),
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => InventoryView()));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Historie'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Mitarbeiter'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Einstellungen'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Abmelden'),
            onTap: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => LoginView(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
