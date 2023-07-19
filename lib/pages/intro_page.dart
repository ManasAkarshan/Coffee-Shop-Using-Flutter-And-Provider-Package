import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.asset('assets/images/intro.png', width: 130,),
              const SizedBox(height: 60,),
            
              //  Welcome text
              const Text('Welcome User,', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
              const SizedBox(height: 4,),
              const Text("we make the best coffee", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
              const SizedBox(height: 60,),
            
              // button
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return const HomePage();
                    }
                  ));
                },
                child: Container(
                  width: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: const Center(child: Text('Get Started' ,style: TextStyle(color: Colors.white, fontSize: 17),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}