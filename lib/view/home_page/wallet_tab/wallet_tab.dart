import 'package:flutter/material.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  _WalletTabState createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      // color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: const Text(
                'My Wallet',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        // height: 70, width: 70,
                        // color: Colors.pink,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Active Total Balance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            SizedBox(height: 2,),
                            const Text(
                              'TK. 942843284',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // height: 70,
                      padding: EdgeInsets.all(10),
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text('Top up', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize:15,), textAlign: TextAlign.center,),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Payment Methods',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '+88001741499768',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Recent Orders',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
