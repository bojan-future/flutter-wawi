import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

import '../database/database.dart';
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
          if (kDebugMode)
            ListTile(
              leading: Icon(Mdi.buffer),
              title: Text('Database Viewer'),
              onTap: () {
                var db = DatabaseFactory.getDatabaseInstance();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MoorDbViewer(db)));
              },
            ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Abmelden'),
            onTap: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => LoginView(null),
              ));
            },
          ),
        ],
      ),
    );
  }
}
