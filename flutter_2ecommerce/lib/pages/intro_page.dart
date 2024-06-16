import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 80,
            ),
            const SizedBox(
              height: 25,
            ),

            // title
            Text(
              "Maximux Shop",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),

            // sub title
            Text(
              "Premium Quality Product",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),

            // button
            MyButton(onTap: () => Navigator.pushNamed(context,'/shoppage'), child: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
