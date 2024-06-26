import 'package:adkosh/screens/about_app.dart';
import 'package:adkosh/screens/drawer.dart';
import 'package:adkosh/screens/favorites.dart';
import 'package:adkosh/screens/index.dart';
import 'package:adkosh/screens/random.dart';
import 'package:adkosh/screens/search.dart';
import 'package:adkosh/screens/searchRhyme.dart';
import 'package:adkosh/theme/themeManager.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final ThemeManager tManager;
  const Dashboard({super.key, required this.tManager});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  int _drawerIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Search(),
    SearchRhyme(),
    RandomScreen(),
    Favourites(),
    IndexScreen(),
    AboutScreen(),
    Favourites(),
    IndexScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _drawerIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // drawer: ADDrawer(
      //     selectedItem: _drawerIndex,
      //     onTapCallback: (val) {
      //       setState(() {
      //         _drawerIndex = val;
      //         _selectedIndex = -1;
      //       });
      //     }),
      appBar: AppBar(
        title: const Text('शब्द सागर'),
        elevation: 0,
        actions: [
          // Row(
          //   children: [
          //     Text(
          //       widget.tManager.themeMode == ThemeMode.dark
          //           ? 'Dark Mode'
          //           : 'Light Mode',
          //       style: TextStyle(fontSize: 16),
          //     ),
          //     Switch(
          //       value: widget.tManager.themeMode == ThemeMode.dark,
          //       onChanged: (value) {
          //         widget.tManager.toggleTheme(value);
          //       },
          //     ),
          //   ],
          // )

          // Row(
          //   children: [
          //     IconButton(onPressed: () {}, icon: Icon(Icons.info)),
          //     Switch(
          //       value: widget.tManager.themeMode == ThemeMode.dark,
          //       onChanged: (value) {
          //         widget.tManager.toggleTheme(value);
          //       },
          //     ),
          //   ],
          // ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    widget.tManager.toggleTheme(
                        widget.tManager.themeMode == ThemeMode.dark
                            ? false
                            : true);
                  },
                  icon: Icon(
                    widget.tManager.themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                  icon: Icon(Icons.info_outline))
            ],
          )
        ],
      ),
      body: Center(
        child: _widgetOptions
            .elementAt(_drawerIndex > 0 ? _drawerIndex : _selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 1,
        // showSelectedLabels: true
        // ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'खोज',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_in),
            label: 'खोज+',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shuffle),
            label: 'विविध',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'फेभरेट',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'सङ्केतसूची',
          ),
        ],
        currentIndex: _selectedIndex < 0 ? 0 : _selectedIndex,

        selectedItemColor: _selectedIndex < 0
            ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
            : Colors.amber[800],
        selectedFontSize: _selectedIndex < 0 ? 12 : 14,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
