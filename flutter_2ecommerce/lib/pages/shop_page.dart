import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/components/my_drawer.dart';
import 'package:flutter_2ecommerce/components/my_producttile.dart';
import 'package:flutter_2ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access product in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context,'/cartpage'), icon: Icon(Icons.shopping_cart_outlined))
        ],
        centerTitle: true,
        title: Text("Shop Page"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25,),
          Center(child: Text("Pick from the selected list of premium products",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)),
          SizedBox(
          height: 550,  
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProducttile(product: product);
              }),
        )
        ]
        
      ),
    );
  }
}
