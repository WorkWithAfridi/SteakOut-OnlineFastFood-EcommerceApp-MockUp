import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meat_one/view/home_page/home_page.dart';
import 'package:meat_one/view/signup_page/signup_page.dart';

class SigninWithPhoneNumber extends StatefulWidget {
  static const routeName = '/signin_with_phone_number';
  const SigninWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<SigninWithPhoneNumber> createState() => _SigninWithPhoneNumberState();
}

class _SigninWithPhoneNumberState extends State<SigninWithPhoneNumber> {
  bool isVisible = false;
  late String _phone;
  late String _countryCode;
  late String _country;
  bool _verifyNumber = false;
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.arrow_back_ios)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            'Stake\nOut',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.getFont('Permanent Marker',
                                height: .6, fontSize: 40),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Please enter your phone number below.',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            textStyle: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              height: .9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _verifyNumber
                            ? Container(
                                height: MediaQuery.of(context).size.height * .4,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Enter code:'),
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: TextFormField(),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: TextFormField(),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: TextFormField(),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: TextFormField(),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: TextFormField(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height * .4,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Country Code:'),
                                              TextFormField()
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Country:'),
                                              TextFormField()
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('Phone Number:'),
                                    TextFormField(),
                                  ],
                                ),
                              )
                      ],
                    ),
                    Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if(_verifyNumber){
                                Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
                                return;
                              }
                              setState(() {
                                _verifyNumber = !_verifyNumber;
                              });
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .9,
                              height: MediaQuery.of(context).size.height * .08,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Center(
                                child: Text(
                                  _verifyNumber ? 'Confirm' : 'Continue',
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
                              Navigator.of(context)
                                  .pushNamed(SignUpPage.routeName);
                            },
                            child: Text(
                              "After pressing continue, we'll send send a OTP code.",
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
