import 'package:flutter/material.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';
import 'package:shopp_app_mobx/widgets/related_products_widget.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({
    super.key,
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.relatedProducts!.length,
        itemBuilder: (context, index) {
          return RelatedProductsWidget(
            item: item,
            index: index,
          );
        });
  }
}
