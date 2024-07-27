import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/models/shop.dart';
import 'package:provider/provider.dart';
import 'food_details_page.dart';
import '../components/button.dart';
import '../components/food_tile.dart';
import '../theme/colors.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  //navigate to food item details page
  void navigateToFoodDetails(int index){
    final shop = context.read<Shop>() ;
    final foodMenu= shop.foodMenu;
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => FoodDetailsPage(
        food: foodMenu[index],
      ),
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu= shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          leading: const Icon(Icons.menu),
        title: const Text('Tokyo'),
        actions: [
          //cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
              icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //banner
          Container(
            decoration: BoxDecoration(color: primaryColor,
                borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //text
                    Text('Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    MyButton(text: "Redeem",
                        onTap: (){

                        },
                    ),
              ],
            ),
                Image.asset('lib/images/sushi (1).png',
                    height:100
                ),
    ],
          ),
          ),

          const SizedBox(height: 25),
          //search bar
          Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Search here...",
            ),
          ),
    ),
          const SizedBox(height: 25),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.grey[800],
                fontSize: 18,
              ),
              ),
          ),
          const SizedBox(height: 10),
          
          Expanded(
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
              itemBuilder: (context,index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
          ),
          ),
        ],
      ),
    );
  }
}
