import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellar_e_commerce/eCommerce/app_provider.dart';
import 'package:sellar_e_commerce/eCommerce/services/service.dart';
import 'package:sellar_e_commerce/eCommerce/services/shared_preferences.dart';
import 'package:sellar_e_commerce/models/product_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  BEServices beProvider;
  AppProvider appProvider;
  dynamic cart;
  List<ProductItem> productList = [];
  int total = 0;
  @override
  void initState() {
    super.initState();

    beProvider = Provider.of<BEServices>(context, listen: false);
    appProvider = Provider.of<AppProvider>(context, listen: false);

    // beProvider.getProductosById(productId)
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItem>>(
        future: beProvider.getProducts(),
        builder: (context, snapshhotDataList) {
          List<String> listOfIndexcart = [];
          return snapshhotDataList.hasData
              ? FutureBuilder(
                  future: UserPreferences.readCartCount(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      for (var element in snapshot.data) {
                        if (element != null) {
                          ProductItem productItem = snapshhotDataList.data
                              .firstWhere((loopdata) => loopdata.id == element);

                          if (productItem.quantity == null) {
                            productItem.quantity = 1;
                          }
                          if ((productList.firstWhere(
                                  (it) => it.id == productItem.id,
                                  orElse: () => null)) !=
                              null) {
                            productItem.quantity += 1;
                            productList.removeWhere((e) {
                              return e.id == productItem.id;
                            });
                          }

                          productList.add(productItem);
                          total += productItem.price;
                        }
                      }

                      return Scaffold(
                          body: Container(
                        padding: EdgeInsets.all(130),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shopping Bag',
                              style: GoogleFonts.inter().copyWith(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Item',
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 220,
                                ),
                                Text('Quantity',
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 100,
                                ),
                                Text('Subtotal',
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ...List.generate(
                                productList.length,
                                (index) => Align(
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Slidable(
                                          startActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            children: [
                                              // A SlidableAction can have an icon and/or a label.
                                              SlidableAction(
                                                onPressed: (BuildContext
                                                    context) async {
                                                  List
                                                      listOfIndexCartFromShareP =
                                                      await UserPreferences
                                                          .readCartCount();

                                                  listOfIndexcart = List.from([
                                                    ...listOfIndexCartFromShareP
                                                  ]);

                                                  listOfIndexcart.removeWhere(
                                                      (emt) =>
                                                          productList[index]
                                                              .id ==
                                                          emt);

                                                  await UserPreferences
                                                      .setCartCount(<String>[
                                                    ...listOfIndexcart
                                                  ]);
                                                },
                                                backgroundColor:
                                                    Color(0xFFFE4A49),
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete,
                                                label: 'Delete',
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image(
                                                  fit: BoxFit.cover,
                                                  height: 50,
                                                  image: NetworkImage(
                                                      productList[index]
                                                          .image)),
                                              SizedBox(width: 10),
                                              Text(productList[index].name),
                                              // SizedBox(width: 220),
                                              Spacer(),
                                              Text(
                                                  "x ${productList[index].quantity.toString()}"),
                                              Spacer(),
                                              SizedBox(width: 100),
                                              Text(
                                                "\$ ${productList[index].price.toString()}",
                                                style: GoogleFonts.inter()
                                                    .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                            SizedBox(height: 10),
                            Container(
                              width: 530,
                              child: Divider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.inter().copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  '\$ ${total.toString()}',
                                  style: GoogleFonts.inter().copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              height: 70,
                              width: 500,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff20506580)
                                            .withOpacity(0.5),
                                        offset: Offset(0, 8),
                                        blurRadius: 16,
                                        spreadRadius: -4)
                                  ],
                                  color: Color(0xff3D27BE),
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        ),
                      ));
                    } else {
                      return Scaffold(
                          body: Container(
                        padding: EdgeInsets.all(70),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shopping Bag',
                              style: GoogleFonts.inter().copyWith(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Text('Item',
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 220,
                                ),
                                Text('Quantity',
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 100,
                                ),
                                Text('Subtotal',
                                    style: GoogleFonts.inter().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ...List.generate(
                                productList.length,
                                (index) => Align(
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Row(
                                          children: [
                                            Image(
                                                fit: BoxFit.cover,
                                                height: 40,
                                                image: NetworkImage(
                                                    productList[index].image)),
                                            SizedBox(width: 10),
                                            Text(productList[index].name),
                                            SizedBox(width: 220),
                                            Text(
                                                "x ${productList[index].quantity.toString()}"),
                                            SizedBox(width: 100),
                                            Text(
                                              "\$ ${productList[index].price.toString()}",
                                              style: GoogleFonts.inter()
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                            SizedBox(height: 10),
                            Container(
                              width: 530,
                              child: Divider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.inter().copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 400,
                                ),
                                Text(
                                  '\$ ${total.toString()}',
                                  style: GoogleFonts.inter().copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              height: 70,
                              width: 500,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff20506580)
                                            .withOpacity(0.5),
                                        offset: Offset(0, 8),
                                        blurRadius: 16,
                                        spreadRadius: -4)
                                  ],
                                  color: Color(0xff3D27BE),
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        ),
                      ));
                    }
                  })
              : Center(child: CircularProgressIndicator());
        });
  }
}
