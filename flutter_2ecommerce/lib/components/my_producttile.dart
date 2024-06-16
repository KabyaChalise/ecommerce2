import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/models/product.dart';
import 'package:flutter_2ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProducttile extends StatelessWidget {
  final Product product;
  const MyProducttile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Add this item to your cart?"),
      actions: [
        MaterialButton(onPressed: () => Navigator.pop(context),child: Text("Cancel"),),
        MaterialButton(onPressed: () => {Navigator.pop(context),context.read<Shop>().addToCart(product)},child: Text("Yes"),),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(9)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Icon(Icons.favorite)),
              ),
              const SizedBox(height: 25),

              // name
              Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),

              // description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),

          // price + add
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(7)),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => addToCart(context),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
