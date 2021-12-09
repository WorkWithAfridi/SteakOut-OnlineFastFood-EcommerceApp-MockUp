import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meat_one/model/categories/data_model_for_categories.dart';
import 'package:meat_one/model/promotions/data_model_for_promotions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedFilter = 0;
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = new PageController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          elevation: 0,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 50,
            // color: Colors.red,
            child:
            Text(
              'StakeOut',
              textAlign: TextAlign.start,
              style: GoogleFonts.getFont('Permanent Marker', fontSize: 40),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                          borderRadius: BorderRadius.circular(10)),
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Today's HOT Picks:",
                      style: GoogleFonts.getFont(
                        'Permanent Marker',
                        height: .6,
                        fontSize: 20,
                        textStyle: TextStyle(height: 0.4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        _Home_tab_promoton_page(0, context),
                        _Home_tab_promoton_page(1, context),
                        _Home_tab_promoton_page(2, context),
                        _Home_tab_promoton_page(3, context),
                        _Home_tab_promoton_page(4, context),
                      ],
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 5,
                        effect: ScrollingDotsEffect(
                          radius: 7,
                          dotHeight: 7,
                          dotWidth: 7,
                          spacing: 5,
                          dotColor: Colors.grey,
                          activeDotColor: Theme.of(context).colorScheme.primary,
                        ),
                        onDotClicked: (index) {
                          setState(() {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceOut);
                          });
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: steakCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          Color selectedBackgroundColor =
                              Colors.black.withOpacity(.1);
                          Color selectedTextColor = Colors.black;
                          if (index == _selectedFilter) {
                            selectedBackgroundColor =
                                Theme.of(context).colorScheme.primary;
                            selectedTextColor = Colors.white;
                          }
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 6.0, right: 6.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedFilter = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: selectedBackgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  steakCategories[index].title.toString(),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    // height: .6,
                                    fontSize: 15,
                                    textStyle: TextStyle(
                                        color: selectedTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: promotions.length,
                    itemBuilder: (BuildContext context, int index) {
                      promotions.shuffle();
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 5.0, bottom: 8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      promotions[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: Center(
                                                  child: Text(
                                                    '${promotions[index].discountPercentage} Tk. Off',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${promotions[index].price} TK.',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${int.parse(promotions[index].price) - (int.parse(promotions[index].discountPercentage))} TK.',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.yellow,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  // color: Colors.pink,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        promotions[index].name,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        promotions[index]
                                                            .description,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  // color: Colors.blue,
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: Container(
                                                          padding: EdgeInsets.all(10),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            color: Color(0xff00FE00),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Add to Cart',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
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
    );
  }

  Widget _Home_tab_promoton_page(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            child: Image.asset(
              promotions[index].imageUrl,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

// Container(
// height: MediaQuery.of(context).size.height * .3,
// // color: Colors.red,
// alignment: Alignment.topCenter,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: promotions.length,
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
// promotions[index].imageUrl,
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
