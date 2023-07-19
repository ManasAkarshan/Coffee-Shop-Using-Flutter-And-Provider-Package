import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    // Get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
        
                    // return the tile for this coffee
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: ListTile(
                          leading: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(eachCoffee.imagePath)
                          ),
                          title: Text(eachCoffee.name),
                          subtitle: Text(eachCoffee.price),
                          trailing: IconButton(
                            onPressed: (){
                              Provider.of<CoffeeShop>(context, listen: false).addItemToCart(eachCoffee);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
