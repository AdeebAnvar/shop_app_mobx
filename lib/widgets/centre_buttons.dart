import 'package:flutter/material.dart';

class CenterButtons extends StatelessWidget {
  const CenterButtons({
    super.key,
    required this.onPressedAddToCart,
    required this.onPressedBuyNow,
  });
  final void Function()? onPressedAddToCart;
  final void Function()? onPressedBuyNow;
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
                onPressed: onPressedAddToCart,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Transform.rotate(
                          angle: 5.7,
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            // size: 20,
                            color: Colors.white30,
                          ))
                    ],
                  ),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: onPressedBuyNow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Transform.rotate(
                          angle: 5.7,
                          child: const Icon(
                            Icons.bolt_outlined,
                            // size: 20,
                            color: Colors.white30,
                          ))
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
