import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../k_padding.dart';
import '../../responsive.dart';
import '../app_provider.dart';
import '../services/shared_preferences.dart';

class TopBarDescription extends StatefulWidget {
  //The Top Bar over the description page
  const TopBarDescription({
    Key key,
  }) : super(key: key);

  @override
  State<TopBarDescription> createState() => _TopBarDescriptionState();
}

class _TopBarDescriptionState extends State<TopBarDescription> {
  @override
  Widget build(BuildContext context) {
    List<String> listOfIndexcart = [];

    final appProvider = Provider.of<AppProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Row(
        children: [
          /*  if (ResponsiveLayout.isIphone(context)) BackButton(),
          if (ResponsiveLayout.isMacbook(context))
            IconButton(
              icon: Icon(
                Icons.print_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {},
            ), */
          Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: 100,
            ),
            child: ElevatedButton(
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
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).accentColor)),
              child: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
              onPressed: () async {
                List listOfIndexCartFromShareP =
                    await UserPreferences.readCartCount();

                listOfIndexcart = List.from([listOfIndexCartFromShareP]);
                listOfIndexcart.add(appProvider.item.id);
                await UserPreferences.setCartCount(
                    <String>[...listOfIndexcart]);
              },
            ),
          ),
          SizedBox(width: kPadding),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: 100,
            ),
            child: ElevatedButton(
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
                      Theme.of(context).primaryColor)),
              child: Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
