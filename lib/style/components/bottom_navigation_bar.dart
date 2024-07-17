import 'package:flutter/material.dart';
import 'package:here_for_u/screens/account/account.dart';
import 'package:here_for_u/screens/safePlaces/safe_places.dart';
import 'package:here_for_u/screens/home/home.dart';
import 'package:here_for_u/screens/sos/sos_animation.dart';
import '../all_style.dart';
//import '../../style/components/all_components.dart';
import '../../screens/contact/contact.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);
  @override
  State createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State {
  int _selectedIndex = 0;
  List<Widget> pageList = [
    const HomeScreen(),
    const SafePlacesScreen(),
    const SosAnimationScreen(),
    const ContactPage(),
    const AccountScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: AppColor.backgroundWhite,
          border: Border(
            top: BorderSide(width: 0.5, color: AppColor.stroke),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColor.backgroundWhite,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/Home.png'),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/HomeActive.png'),
              ),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/SafePlaces.png'),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/SafePlacesActive.png'),
              ),
              label: "SafePlaces",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.add, color: Colors.transparent, size: 40),
                    Text(
                      "SOS",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColor.secondary3,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              ),
              label: "", // Set empty label to hide the default label
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/Contact.png'),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/ContactActive.png'),
              ),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/Account.png'),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('images/bottomBarNav/AccountActive.png'),
              ),
              label: "Compte",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColor.primary5,
          unselectedItemColor: AppColor.black,
          iconSize: 24,
          onTap: _onItemTapped,
          elevation: 0,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedLabelStyle: const TextStyle(letterSpacing: 1),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/redirect');
            },
            backgroundColor: AppColor.secondary3,
            elevation: 1,
            child: const ImageIcon(
              AssetImage('images/bottomBarNav/Phone.png'),
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
