import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meat_one/view/home_page/home_tab/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

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
            title: Text(
              'StakeOut',
              textAlign: TextAlign.start,
              style: GoogleFonts.getFont('Permanent Marker',
                  fontSize: 40, color: Colors.black),
            ),
            elevation: 0,
          )
        ],
        body: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   width: double.infinity,
            //   height: 50,
            //   // color: Colors.red,
            //   // child:
            // ),
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
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      ),
                      const Text(
                        'Dhaka, Bangladesh',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.menu),
                      SizedBox(
                        width: 5,
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
                            Text('Home')
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
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
                            Text('Cart')
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
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
                            Text('Favorite')
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
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
                            Text('Wallet')
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
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
                            Text('Profile')
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
    if (_selectedTab == 0) return HomeTab();
    return HomePage();
  }
}

// Container(
// height: MediaQuery.of(context).size.height * .3,
// // color: Colors.red,
// alignment: Alignment.topCenter,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: product.length,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.all(10.0),
// child: Card(
// elevation: 5,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15)),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15)),
// child: ClipRRect(
// child: Image.asset(
// product[index].imageUrl,
// fit: BoxFit.contain,
// ),
// borderRadius: BorderRadius.circular(15),
// ),
// ),
// ),
// );
// },
// ),
// )
