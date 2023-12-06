import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app_mobx/constants/enums.dart';
import 'package:shopp_app_mobx/logic/single_product/single_product_store.dart';
import 'package:shopp_app_mobx/widgets/single_product_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  SingleProductStore? singleProductStore;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    singleProductStore ??= Provider.of<SingleProductStore>(context);
    await singleProductStore?.getSingleProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection scrollDirection = notification.direction;
            if (scrollDirection == ScrollDirection.reverse) {
              log('reverse scrolling');
              singleProductStore!.hideAppBar = false;
            } else if (scrollDirection == ScrollDirection.forward) {
              singleProductStore!.hideAppBar = true;
              log('forward scrolling');
            } else {
              log('Idle ');
            }
            return true;
          },
          child: Scaffold(
            appBar: singleProductStore!.hideAppBar
                ? AppBar(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(border: Border.all()),
                      child: const Center(
                        child: Text(
                          'Logo of the APP',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                    ],
                  )
                : null,
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Observer(
                builder: (_) {
                  final singleProduct = singleProductStore?.singleProductData;
                  switch (singleProductStore?.state) {
                    case StoreState.initial:
                      return const Text('No Data');
                    case StoreState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case StoreState.loaded:
                      return SingleProductWidget(
                        singleProductModel: singleProduct!,
                        singleProductStore: singleProductStore,
                      );
                    default:
                      return const Text('k');
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
