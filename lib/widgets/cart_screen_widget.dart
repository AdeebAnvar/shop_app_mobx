import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopp_app_mobx/logic/cart_screen/cart_screen_store.dart';
import 'package:shopp_app_mobx/widgets/custom_button.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({super.key, this.store});
  final CartScreenStore? store;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: store!.cartModel!.cart!.items!
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 20),
                  child: Column(
                    children: [
                      Image.network(
                        height: 150,
                        item.product!.image!.url.toString(),
                      ),
                      Text(
                        item.product!.image!.label.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$ ${item.prices!.price?.value}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(child: SizedBox()),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: item.quantity.toString(),
                              decoration: InputDecoration(
                                suffixIcon: Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          // store.quantity = int.parse(controller.text);
                                          // controller.text =
                                          //     store.increaseQuantity().toString();
                                        },
                                        child: const Icon(
                                            Icons.arrow_drop_up_sharp)),
                                    InkWell(
                                        onTap: () {
                                          // store.quantity = int.parse(controller.text);
                                          // controller.text =
                                          //     store.increaseQuantity().toString();
                                          // store.decreaseQuantity();
                                        },
                                        child: const Icon(
                                            Icons.arrow_drop_down_sharp)),
                                  ],
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Subtotal ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            '\$ ${item.prices!.rowTotal?.value}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.teal.shade500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_square, color: Colors.teal.shade500),
                          const SizedBox(width: 20),
                          const Icon(Icons.close, color: Colors.redAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 22),
            child: Text('Update now', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected Delivery By: 7 days',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.teal.shade500),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Summary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Subtotal      \$${store!.cartModel!.cart!.prices!.subtotalWithDiscountExcludingTax!.value.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Discount      -\$0.00',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Enter your code',
                        border: const OutlineInputBorder(),
                        suffixIcon: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: Colors.teal.shade600,
                                foregroundColor: Colors.white),
                            onPressed: () {},
                            child: const Text('Apply discount'))),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Order Total       \$${store!.cartModel!.cart!.prices!.grandTotal!.value.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade600,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 50),
                            child: Text(
                              'Go to Checkout',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
