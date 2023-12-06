import 'package:flutter/material.dart';

class CenterButtons extends StatelessWidget {
  const CenterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade500),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white),
                    ),
                    Transform.rotate(
                        angle: 5.7,
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: Colors.white30,
                        ))
                  ],
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'BUY NOW',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.bolt_rounded,
                      size: 30,
                      color: Colors.white30,
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
