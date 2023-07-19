import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage ({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child){
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text(
                'You Cart',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
              const SizedBox(height: 15,),


              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context , index){
                    // Get each item of cart
                    Coffee eachItemOfCart = value.userCart[index];
              
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListTile(
                          leading: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(eachItemOfCart.imagePath)
                          ),
                          title: Text(eachItemOfCart.name),
                          subtitle: Text(eachItemOfCart.price),
                          trailing: IconButton(
                            onPressed: (){
                              Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(eachItemOfCart);
                            }, 
                            icon: const Icon(Icons.delete)
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.brown
                  ),
                  child: const Center(child: Text('Pay Now' ,style: TextStyle(color: Colors.white, fontSize: 17),)),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        );
      }
    );
  }
}