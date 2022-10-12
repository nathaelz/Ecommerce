import 'package:flutter/material.dart';
import 'package:sellar_e_commerce/eCommerce/auth/login_screen.dart';
import 'package:sellar_e_commerce/eCommerce/services/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../k_padding.dart';
import '../responsive.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'drawer/drawer_items.dart';

class ECommerceDrawer extends StatefulWidget {
  const ECommerceDrawer({
    Key key,
  }) : super(key: key);

  @override
  State<ECommerceDrawer> createState() => _ECommerceDrawerState();
}

class _ECommerceDrawerState extends State<ECommerceDrawer> {
  dynamic token;
  dynamic cartCount;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (Duration duration) async => print(),
  //   );
  //   super.initState();
  // }

  loadData() async {
    cartCount = await UserPreferences.readCartCount();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserPreferences.readToken(),
        builder: (context, snapshot) {
          final hasData = snapshot.hasData;

          if (hasData) {
            return Container(
              height: double.infinity,
              padding: EdgeInsets.only(top: kIsWeb ? kPadding : 0),
              color: Theme.of(context).accentColor,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/png/logo.png",
                            width: 150,
                          ),
                        ],
                      ),
                      SizedBox(height: kPadding),
                      ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: 300,
                          ),
                          child: hasData == false
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                          vertical: kPadding,
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white.withOpacity(0.8))),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                )
                              : Container()),
                      SizedBox(height: kPadding),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: 300,
                        ),
                        child: hasData == false
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                        vertical: kPadding,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white.withOpacity(0.8))),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              )
                            : Container(),
                      ),
                      SizedBox(height: token != null ? 0 : kPadding * 2),
                      hasData
                          ? DrawerItems(
                              onPressed: () {
                                Navigator.pushNamed(context, '/account');
                              },
                              title: "Your Account",
                              icon: Icons.person_outline_outlined,
                            )
                          : Container(),
                      DrawerItems(
                        onPressed: () {},
                        title: "Your Orders",
                        icon: Icons.cloud_circle_outlined,
                      ),
                      DrawerItems(
                        onPressed: () {},
                        title: "Shop",
                        icon: Icons.shopping_bag_outlined,
                        selected: true,
                      ),
                      DrawerItems(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        title: "Cart",
                        icon: cartCount == null
                            ? Icons.shopping_cart_outlined
                            : Icons.circle,
                      ),
                      hasData
                          ? DrawerItems(
                              onPressed: () {
                                UserPreferences.deleteUid();
                                UserPreferences.removeToken();
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message:
                                        "Has salido de la cuenta con exito",
                                  ),
                                );
                                setState(() {});
                              },
                              title: "Log Out",
                              icon: Icons.logout,
                            )
                          : Container(),
                      SizedBox(height: kPadding * 2),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              height: double.infinity,
              padding: EdgeInsets.only(top: kIsWeb ? kPadding : 0),
              color: Theme.of(context).accentColor,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/png/logo.png",
                            width: 150,
                          ),
                        ],
                      ),
                      SizedBox(height: kPadding),
                      ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: 300,
                          ),
                          child: hasData == false
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                          vertical: kPadding,
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white.withOpacity(0.8))),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                )
                              : Container()),
                      SizedBox(height: kPadding),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: 300,
                        ),
                        child: hasData == false
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                        vertical: kPadding,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white.withOpacity(0.8))),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              )
                            : Container(),
                      ),
                      SizedBox(height: token != null ? 0 : kPadding * 2),
                      hasData
                          ? DrawerItems(
                              onPressed: () {
                                Navigator.pushNamed(context, '/account');
                              },
                              title: "Your Account",
                              icon: Icons.person_outline_outlined,
                            )
                          : Container(),
                      DrawerItems(
                        onPressed: () {},
                        title: "Your Orders",
                        icon: Icons.cloud_circle_outlined,
                      ),
                      DrawerItems(
                        onPressed: () {},
                        title: "Shop",
                        icon: Icons.shopping_bag_outlined,
                        selected: true,
                      ),
                      DrawerItems(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        title: "Cart",
                        icon: cartCount == null
                            ? Icons.shopping_cart_outlined
                            : Icons.circle,
                      ),
                      hasData
                          ? DrawerItems(
                              onPressed: () {
                                UserPreferences.deleteUid();
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message:
                                        "Has salido de la cuenta con exito",
                                  ),
                                );
                                setState(() {});
                              },
                              title: "Log Out",
                              icon: Icons.logout,
                            )
                          : Container(),
                      SizedBox(height: kPadding * 2),
                    ],
                  ),
                ),
              ),
            );
            ;
          }
        });
  }
}
