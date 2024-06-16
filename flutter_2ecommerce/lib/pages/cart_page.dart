import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/components/my_button.dart';
import 'package:flutter_2ecommerce/components/my_drawer.dart';
import 'package:flutter_2ecommerce/models/product.dart';
import 'package:flutter_2ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item to your cart?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    context.read<Shop>().removeFromCard(product)
                  },
                  child: Text("Yes"),
                ),
              ],
            ));
  }

  void payButton(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("User wants to pay!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty? Center(child: Text("Your cart is empty")): ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(onTap: () => payButton(context), child: Text("Pay Now")),
          )
        ],
      ),
    );
  }
}
