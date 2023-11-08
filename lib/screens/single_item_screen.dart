import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemScreen extends StatefulWidget {
  String img;
  SingleItemScreen(this.img, {super.key});

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  Future<void> sendDataToFirestore(String name, double price) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference itemsCollection = firestore.collection('items');

      await itemsCollection.add({
        'product': name,
        'price': price,
      });

      print('Data sent to Firestore successfully');
    } catch (e) {
      print('Error sending data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/${widget.img}.png",
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEST ICE-CREAM",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.6),
                            letterSpacing: 3),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.img,
                        style: const TextStyle(
                          fontSize: 25,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Color.fromARGB(255, 27, 27, 27),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 27, 27, 27),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Color.fromARGB(255, 27, 27, 27),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "\$5.9",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 27, 27, 27)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Afters has made its mark in pop culture history as the pioneer in the emerging food trend scene, drawing unprecedented crowds searching for its unique, premium product and experience.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // const Row(
                      //   children: [
                      //     Text(
                      //       "Stock:",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 16,
                      //         color: Color.fromARGB(255, 27, 27, 27),
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Text(
                      //       "5 piece",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 16,
                      //         color: Color.fromARGB(255, 27, 27, 27),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 60),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await sendDataToFirestore(widget.img, 100.99);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 30,
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(15),
                            //   decoration: BoxDecoration(
                            //     color: const Color.fromARGB(255, 250, 75, 224),
                            //     borderRadius: BorderRadius.circular(18),
                            //   ),
                              // child: const Icon(
                              //   Icons.favorite_outline,
                              //   color: Colors.white,
                              // ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}