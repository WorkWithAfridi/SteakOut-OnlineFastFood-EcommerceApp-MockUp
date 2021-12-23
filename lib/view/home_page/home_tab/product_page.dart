import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meat_one/model/product/data_model_for_cart.dart';
import 'package:meat_one/model/product/data_model_for_promotions.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product_page';
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int productCount = 1;
  int price = 0;
  bool isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    var routeArs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Product product = routeArs['product'];
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .5,
          color: Colors.pink,
          child: ClipRRect(
            child: Hero(
                tag: product.name.toString(),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height: 55,
                                  // color: Colors.pink,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Location',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(.3),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Row(
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
                                            '${product.price} TK.',
                                            style: const TextStyle(
                                                decoration: TextDecoration
                                                    .lineThrough,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
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
                                            '${int.parse(product.price) - (int.parse(product.discountPercentage))} TK.',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.red,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        productCount++;
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: Text(
                                      productCount.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (productCount > 1) {
                                        setState(() {
                                          productCount--;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '-',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${int.parse(product.price) - (int.parse(product.discountPercentage))} TK.',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'after applying discount.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black.withOpacity(.3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(${productCount} items)',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${((int.parse(product.price) - (int.parse(product.discountPercentage))) * productCount).toString()}Tk',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'after applying discount.',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .2,
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (productCount > 0) {
                                  if (isAddedToCart) {
                                    var snackBar = SnackBar(
                                        content: Text('Cart Updated.'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  setState(() {
                                    isAddedToCart = true;
                                    cart.add(product);
                                  });
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * .65,
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                child: Center(
                                  child: Text(
                                    isAddedToCart
                                        ? 'Added to Cart'
                                        : 'Add to Cart',
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
                          ],
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 70,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
