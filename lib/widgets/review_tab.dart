import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';
import 'package:shopp_app_mobx/logic/single_product/single_product_store.dart';
import 'package:shopp_app_mobx/widgets/custom_button.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key, required this.item, required this.store});
  final Item item;
  final SingleProductStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: store.isSelectedDetailsTab ? 4 : 1,
                child: InkWell(
                  onTap: () {
                    store.changeDetailsTab();
                    log(store.isSelectedDetailsTab.toString());
                  },
                  child: Center(
                    child: Text(
                      'Detailed description',
                      style: TextStyle(
                          color: store.isSelectedDetailsTab
                              ? Colors.teal.shade700
                              : Colors.grey,
                          fontSize: store.isSelectedDetailsTab ? 20 : 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: store.isSelectedDetailsTab ? 1 : 4,
                child: InkWell(
                  onTap: () {
                    log(store.isSelectedDetailsTab.toString());
                    store.changeDetailsTab();
                  },
                  child: Center(
                    child: Text(
                      'Review',
                      style: TextStyle(
                        fontWeight: store.isSelectedDetailsTab
                            ? FontWeight.w600
                            : FontWeight.w700,
                        color: store.isSelectedDetailsTab
                            ? Colors.grey
                            : Colors.teal.shade700,
                        fontSize: store.isSelectedDetailsTab ? 15 : 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 40),
          Row(
            children: [
              Text(
                store.isSelectedDetailsTab ? 'Importat Note:' : 'Reviews',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AnimatedCrossFade(
              duration: Duration(milliseconds: 700),
              crossFadeState: store.isSelectedDetailsTab
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              secondChild: Column(
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Add Your Review',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
              firstChild: HtmlWidget(item.description!.html.toString()))
        ],
      );
    });
  }
}
