import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
                    'My Profile',
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
                        SizedBox(width: 10,),
                        Container(
                            padding: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70)),
                            child: ClipRRect(
                              child: Image.asset('lib/assets/avatar/avatar.jpg'),
                              borderRadius: BorderRadius.circular(70),
                            )),
                        Expanded(
                          child: Container(
                            // height: 70, width: 70,
                            // color: Colors.pink,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Khondakar Afridi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'Verified Customer',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          // color: Colors.yellow,
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Phone Number',
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
                  'Email Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'KhondakarAfridi35@gmail.com',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'My Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.home,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'XYC in Xyc, plot xyz. Flat no: xyz\nXYC in Xyc, plot xyz. Flat no: xyz',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black.withOpacity(.2),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.work,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'XYC in Xyc, plot xyz. Flat no: xyz\nXYC in Xyc, plot xyz. Flat no: xyz',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
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
