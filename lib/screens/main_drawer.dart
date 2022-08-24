import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.orange[900]),
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile('Meals', Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            buildListTile('Filter', Icons.settings, () {
              Navigator.of(context).pushReplacementNamed('/filters');
            }),
          ],
        ),
      ),
    );
  }
}
