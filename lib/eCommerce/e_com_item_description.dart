import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sellar_e_commerce/models/product_item.dart';

import '../k_padding.dart';
import 'app_provider.dart';
import 'item_description/top_bar_description.dart';

class ECommerceItemDescription extends StatefulWidget {
  final ProductItem productItem;
  const ECommerceItemDescription({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  State<ECommerceItemDescription> createState() =>
      _ECommerceItemDescriptionState();
}

class _ECommerceItemDescriptionState extends State<ECommerceItemDescription> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);

    return appProvider.item.name != null
        ? Scaffold(
            body: Container(
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    TopBarDescription(),
                    Divider(thickness: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(kPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: kPadding),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                text: "Sellar  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                                children: [
                                                  TextSpan(
                                                      text: "Platinum Member",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .copyWith(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5))),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${appProvider.item.name}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: kPadding / 2),
                                      Text(appProvider.item.price.toString(),
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                  SizedBox(height: kPadding),
                                  LayoutBuilder(
                                    builder: (context, constraints) => SizedBox(
                                      width: constraints.maxWidth > 840
                                          ? 800
                                          : constraints.maxWidth,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: List.generate(
                                                  3,
                                                  (index) => Container(
                                                    height: 100,
                                                    width: 100,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image(
                                                        image: NetworkImage(
                                                            appProvider
                                                                .item.image),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: kPadding * 3,
                                              ),
                                              if (constraints.maxWidth > 300)
                                                Container(
                                                  width: constraints.maxWidth >
                                                          840
                                                      ? 600
                                                      : constraints.maxWidth -
                                                          200,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          appProvider
                                                              .item.image),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Divider(thickness: 1),
                                          SizedBox(height: kPadding / 2),
                                          Text(
                                            appProvider.item.description,
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                            ),
                                          ),
                                          SizedBox(height: kPadding),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container(
            color: Colors.white,
            child: Center(
                child: Text(
              'Escoja un producto',
              style: GoogleFonts.inter()
                  .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
            )),
          );
  }
}
