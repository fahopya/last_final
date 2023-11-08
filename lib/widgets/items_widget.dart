import 'package:final_project/screens/single_item_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemsWidget extends StatelessWidget {
  List img = [
    "BIRTHDAY CAKE",
    "CHOCOLATE CHIP COOKIE",
    "COOKIE MONSTER",
    "DARK MATTER BROWNIE BATTER",
    "PEANUT BUTTER SMORES",
    "THAI TEA",
    "SALTY OREO",
    "FRENCE TOAST CHURRO",
    "MADAGASCAR VANILLA",
    "MILK AND CEREAL",

  ];

  ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              //border: Border all(color: const Color.fromARGB(255, 27, 27, 27)),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 68, 68, 68).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleItemScreen(img[i])));
                  },
                  child: Image.asset(
                    "assets/${img[i]}.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          img[i],//the name of ice-cream
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 27, 27, 27)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Best Ice-Cream",
                          style: TextStyle(fontSize: 12, color: Color.fromARGB(153, 27, 27, 27)),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$5.99",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
