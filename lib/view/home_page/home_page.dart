import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meat_one/view/home_page/home_tab/home_tab.dart';
import 'package:meat_one/view/home_page/profile_tab/profile.dart';
import 'package:meat_one/view/home_page/wallet_tab/wallet_tab.dart';
import 'package:meat_one/view/landing_page/landing_page.dart';

import 'cart_tab/cart_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  Icon searchOrSettingsIcon=Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          elevation: 0,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrollable) => [
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            actions: [
              PopupMenuButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text('About us'),
                    value: "Option 1",
                  ),
                  const PopupMenuItem(
                    child: Text('Report a bug'),
                    value: "Option 2",
                  ),
                  const PopupMenuItem(
                    child: Text('Settings'),
                    value: "Settings",
                  ),
                  const PopupMenuItem(
                    child: Text('Logout'),
                    value: "Logout",
                  ),
                ],
                onSelected: (String value) {
                  if (value == "Logout") {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LandingPage.routeName, (route) => false);
                  }
                },
              ),
            ],
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Steak Out',
                textAlign: TextAlign.end,
                style: GoogleFonts.getFont('Anton',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: .9, fontSize: 40),
              ),
            ),
            elevation: 0,
          )
        ],
        body: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Location:',
                        style: GoogleFonts.getFont('Ubuntu',
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ),
                      Text(
                        'Dhaka, Bangladesh',
                        style: GoogleFonts.getFont('Ubuntu',
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: () {}, icon: searchOrSettingsIcon),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            getTab(),
            Container(
              // height: 70,
              // color: Colors.red,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          searchOrSettingsIcon=Icon(Icons.search);
                          setState(() {
                            _selectedTab = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.home,
                              size: 30,
                              color:
                                  _selectedTab == 0 ? Colors.red : Colors.black,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          searchOrSettingsIcon=Icon(Icons.search);
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 30,
                              color:
                                  _selectedTab == 1 ? Colors.red : Colors.black,
                            ),
                            Text(
                              'Cart',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          searchOrSettingsIcon=Icon(Icons.search);
                          setState(() {
                            _selectedTab = 2;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 30,
                              color:
                                  _selectedTab == 2 ? Colors.red : Colors.black,
                            ),
                            Text(
                              'Favorite',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          searchOrSettingsIcon=Icon(Icons.settings);
                          setState(() {
                            _selectedTab = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 30,
                              color:
                                  _selectedTab == 3 ? Colors.red : Colors.black,
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          searchOrSettingsIcon=Icon(Icons.settings);
                          setState(() {
                            _selectedTab = 4;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person_outline_outlined,
                              size: 30,
                              color:
                                  _selectedTab == 4 ? Colors.red : Colors.black,
                            ),
                            const Text(
                              'Profile',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTab() {
    if (_selectedTab == 0) {
      return HomeTab();
    }
    if (_selectedTab == 1) {
      return CartTab();
    }
    if (_selectedTab == 3) {
      return WalletTab();
    }
    if (_selectedTab == 4) {
      return ProfileTab();
    }
    return HomePage();
  }
}
