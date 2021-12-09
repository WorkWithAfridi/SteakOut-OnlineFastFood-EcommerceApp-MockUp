import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meat_one/view/signin_page/signin_page.dart';
import 'package:meat_one/view/signup_page/signup_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/landing-page';
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                _page('1', context),
                _page('2', context),
                _page('3', context),
              ],
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Stake\nOut',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.getFont('Permanent Marker',
                            height: .6, fontSize: 40),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: ScrollingDotsEffect(
                            radius: 7,
                            dotHeight:7,
                            dotWidth: 7,
                            spacing: 5,
                            dotColor: Colors.grey,
                            activeDotColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onDotClicked: (index) {
                            setState(() {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.bounceOut);
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(SignInPage.routeName);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .9,
                          height: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(SignUpPage.routeName);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .9,
                          height: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Shop as guest');
                        },
                        child: Text(
                          'Shop as guest.',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _page(String pageNo, BuildContext context) {
    String title = '';
    String subTitle = '';
    String imageLink = '';
    if (pageNo == '1') {
      imageLink = 'lib/assets/burger.png';
      title = 'Premium & Finest Cuts';
      subTitle =
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. '
          'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.';
    } else if (pageNo == '2') {
      imageLink = 'lib/assets/chef.png';
      title = 'High Quality Assurance';
      subTitle =
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. '
          'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.';
    } else if (pageNo == '3') {
      imageLink = 'lib/assets/meat.png';
      title = 'Quick & Express Delivery';
      subTitle =
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. '
          'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.';
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .5,
            width: double.infinity,
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: double.infinity,
                      child: Image.asset(
                        imageLink,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(title,
                            style: GoogleFonts.getFont('Roboto',
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          subTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: TextStyle(
                                  color: Colors.black.withOpacity(.5))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
