import 'package:flutter/material.dart';
import '../screens/main_drawer.dart';

import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _glutenFree = false;
  bool? _lactoseFree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget filterTile(bool currentValue, Function updateValue, String title,
      String subtitle, Color? buttonColor) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue as void Function(bool)?,
      title: Text(title),
      subtitle: Text(subtitle),
      activeColor: buttonColor,
      inactiveThumbColor: Colors.white70,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter your meal selection.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                filterTile(
                  _glutenFree!,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  'Gluten Free',
                  'Only display Gluten Free options.',
                  Colors.brown[200],
                ),
                filterTile(
                  _lactoseFree!,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  'Lactose Free',
                  'Only display Lactose Free options.',
                  Colors.blue[500],
                ),
                filterTile(
                  _vegetarian!,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  'Vegetarian',
                  'Only display Vegetarian options.',
                  Colors.green[800],
                ),
                filterTile(
                  _vegan!,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  'Vegan',
                  'Only display Vegan options.',
                  Colors.brown,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
