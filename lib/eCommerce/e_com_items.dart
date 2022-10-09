import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellar_e_commerce/eCommerce/e_com_drawer.dart';
import 'package:sellar_e_commerce/eCommerce/e_com_item_description.dart';
import 'package:sellar_e_commerce/eCommerce/services/service.dart';
import 'package:sellar_e_commerce/models/product_item.dart';

import '../k_padding.dart';
import '../responsive.dart';
import 'items/categories.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'items/e_commerce_item.dart';

List<ProductItem> products = [
//   ProductItem(
//     uid: 1,
//     title: "PS5 Controller",
//     amount: 75,
//     image: "images/ps5.png",
//   ),
//   ProductItem(
//     uid: 2,
//     title: "Drone",
//     amount: 155,
//     image: "images/drone.png",
//   ),
//   ProductItem(
//     uid: 3,
//     title: "Beats Studio",
//     amount: 230,
//     image: "images/beats.png",
//   ),
//   ProductItem(
//     uid: 4,
//     title: "Alexa",
//     amount: 45,
//     image: "images/alexa.png",
//   ),
//   ProductItem(
//     uid: 5,
//     title: "Nintendo Switch",
//     amount: 298,
//     image: "images/switch.png",
//   ),
//   ProductItem(
//     uid: 6,
//     title: "Apple Watch",
//     amount: 165,
//     image: "images/watch.png",
//   ),
//   ProductItem(
//     uid: 7,
//     title: "Macbook",
//     amount: 1950,
//     image: "images/mac.png",
//   ),
//   ProductItem(
//     uid: 8,
//     title: "Iphone",
//     amount: 1200,
//     image: "images/iphone.png",
//   ),
];

List displayList = [];
String newValue = '';

class ECommerceItems extends StatefulWidget {
  const ECommerceItems({
    Key key,
  }) : super(key: key);

  @override
  _ECommerceItemsState createState() => _ECommerceItemsState();
}

class _ECommerceItemsState extends State<ECommerceItems> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItem>>(
        future: Provider.of<BEServices>(context, listen: false).getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final productList = snapshot.data;
            return Scaffold(
              key: _scaffoldKey,
              endDrawer: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: ECommerceDrawer(),
              ),
              body: Container(
                padding: EdgeInsets.only(top: kIsWeb ? kPadding : 0),
                color: Theme.of(context).accentColor,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: kPadding,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {},
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: kPadding, vertical: 4),
                              child: TextField(
                                onChanged: (value) {
                                  newValue = value;
                                  if (value.isNotEmpty) {
                                    final newList =
                                        productList.where((element) {
                                      return element.name
                                              .substring(0, 1)
                                              .toLowerCase() ==
                                          value.substring(0, 1);
                                    }).toList();

                                    setState(() {
                                      displayList = newList;
                                    });
                                  } else {
                                    setState(() {});
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  fillColor: Colors.white.withOpacity(0.5),
                                  filled: true,
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.all(kPadding * 0.70),
                                    child: Icon(Icons.search),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*  if (!ResponsiveLayout.isMacbook(context))
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState.openEndDrawer();
                          },
                        ), */
                          SizedBox(width: kPadding / 2)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding),
                        child: Text(
                          "Modali",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Categories(),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: kPadding),
                          child: GridView.builder(
                              padding:
                                  EdgeInsets.symmetric(horizontal: kPadding),
                              itemCount: newValue.isEmpty
                                  ? productList.length
                                  : displayList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: kPadding,
                                crossAxisSpacing: kPadding,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) {
                                return ECommerceItem(
                                  /*  selected: ResponsiveLayout.isIphone(context)
                              ? false
                              : index == 0, */
                                  item: newValue.isEmpty
                                      ? productList[index]
                                      : displayList[index],
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ECommerceItemDescription(),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }

  void _searchedItem(String value) {}
}
