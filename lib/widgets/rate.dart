import 'package:flutter/material.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';

class Rate extends StatelessWidget {
  const Rate({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('\$ ${item.priceRange!.minimumPrice!.regularPrice!.value}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Text(
            item.priceRange!.maximumPrice!.regularPrice!.currency!.name +
                item.priceRange!.maximumPrice!.regularPrice!.value.toString(),
            style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough)),
        const SizedBox(width: 10),
        const Text('18% off',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ))
      ],
    );
  }
}
