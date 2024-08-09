import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TEXT

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hi Dereck",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "6 Aug 2024",
                            style: TextStyle(color: Colors.blue[200]),
                          )
                        ],
                      ),

                      // NOTIFICATION
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
  }
}