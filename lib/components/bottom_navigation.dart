// Create a Layout Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationLayout extends StatefulWidget {
  final List<Widget> pages;

  const BottomNavigationLayout({Key? key, required this.pages})
      : super(key: key);

  @override
  _BottomNavigationLayoutState createState() => _BottomNavigationLayoutState();
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[_selectedIndex],
      // backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        // margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: Offset(0, 0),
              blurRadius: 30,
            )
          ],
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              // icon: NavIcon(
              //   path: "crowd_funding",
              // ),
              icon: Icon(Icons.home),

              label: 'Homepage',
            ),
            BottomNavigationBarItem(
              // icon: NavIcon(
              //   path: "Location",
              // ),
              icon: Icon(Icons.monitor_heart  ),

              label: "Goals",
            ),
            BottomNavigationBarItem(
              // icon: NavIcon(
              //   path: "Buy",
              // ),
              icon: Icon(Icons.add),
              label: 'Bored', // Custom label
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(size: 24, color: Colors.black),
          unselectedIconTheme: IconThemeData(size: 18, color: Colors.grey),
          backgroundColor: Colors.white,
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(AssetImage("assets/images/$path.png"));
  }
}
