import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app_mobx/constants/enums.dart';
import 'package:shopp_app_mobx/logic/cart_screen/cart_screen_store.dart';
import 'package:shopp_app_mobx/widgets/cart_screen_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartScreenStore? cartScreenStore;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    cartScreenStore ??= Provider.of<CartScreenStore>(context);
    await cartScreenStore?.getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.menu),
            SizedBox(width: 20, height: 20),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 13,
                      )),
                  SizedBox(width: 20),
                  Text(
                    'Shopping Cart',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            paths('Address'),
            SizedBox(height: 10),
            paths('Payment'),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(18),
            ),
            Observer(builder: (_) {
              final cartItem = cartScreenStore?.cartModel;
              switch (cartScreenStore?.state) {
                case StoreState.initial:
                  return const Text('No Data');
                case StoreState.loading:
                  return const Center(child: CircularProgressIndicator());
                case StoreState.loaded:
                  return CartScreenWidget(store: cartScreenStore);
                default:
                  return const Text('k');
              }
            })
          ],
        ));
  }

  Padding paths(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 13,
              )),
          SizedBox(width: 20),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}
