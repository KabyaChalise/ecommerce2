import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/components/my_listtile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header: logo
              DrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(
                height: 25,
              ),

              // shop tile
              MyListtile(
                  data: "Shop",
                  icon: Icons.home,
                  onTap: () =>{ 
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/shoppage')
                  }),


              // cart tile
              MyListtile(
                  data: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () => {
                        Navigator.pop(context),
                        Navigator.pushNamed(context, '/cartpage')
                      }),
            ],
          ),
          // exit
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: MyListtile(
              data: "Exit",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/intropage',
                (route) => false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
