import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mobx/mobx.dart';
import 'package:shopp_app_mobx/constants/string.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';
import 'package:shopp_app_mobx/logic/single_product/single_product_store.dart';
import 'package:shopp_app_mobx/widgets/centre_buttons.dart';
import 'package:shopp_app_mobx/widgets/feature_image_widget.dart';
import 'package:shopp_app_mobx/widgets/rate.dart';
import 'package:shopp_app_mobx/widgets/related_products.dart';
import 'package:shopp_app_mobx/widgets/review_tab.dart';
import 'package:shopp_app_mobx/widgets/top_bar_widget.dart';

class SingleProductWidget extends StatelessWidget {
  SingleProductWidget(
      {super.key, required this.singleProductModel, this.singleProductStore});
  final SingleProductModel singleProductModel;
  final SingleProductStore? singleProductStore;
  final TextEditingController quantityFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Item>? item = singleProductModel.products?.items;
    return ListView(
      children: [
        const SizedBox(height: 15),
        TopBar(approutes: approutes),
        const SizedBox(height: 20),
        FeatureImageWidget(data: item, singleProductStore: singleProductStore),
        const SizedBox(height: 60),
        Text(item![0].name.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        rateAndReviews(item[0]),
        Rate(item: item[0]),
        const SizedBox(height: 60),
        const Divider(
          endIndent: 10,
          indent: 10,
        ),
        const SizedBox(height: 20),
        buildColorStorageDelivery(
            item: item[0],
            store: singleProductStore!,
            controller: quantityFieldController),
        const SizedBox(height: 20),
        item[0].shortDescription!.html!.isEmpty
            ? const SizedBox()
            : const Divider(
                endIndent: 10,
                indent: 10,
              ),
        const SizedBox(height: 10),
        item[0].shortDescription!.html!.isEmpty
            ? const SizedBox()
            : buildHighLightsTab(),
        const CenterButtons(),

        const SizedBox(height: 20),
        ReviewTab(item: item[0], store: singleProductStore!),
        const SizedBox(height: 40),
        const Divider(),
        const SizedBox(height: 30),
        const Text(
          'Specifications:',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 20),
        const Text('Display Size:6.7-inch',
            style: TextStyle(color: Colors.grey)),
        const Text('Color : Mystic Bronze',
            style: TextStyle(color: Colors.grey)),
        const Text('OS: Android v10.0 operating system',
            style: TextStyle(color: Colors.grey)),
        const Text('Warranty Summary : 1year warranty',
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 30),
        item[0].relatedProducts!.isEmpty
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Related ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Products ',
                            style: TextStyle(
                                color: Colors.teal.shade800,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 49),
        RelatedProducts(
          item: item[0],
        ),
        const Row(
          children: [Text('LOGO')],
        ),
        const SizedBox(height: 40),
        buildData(label: 'ADDRESS:', data: '1234 Street Name, City, England'),
        buildData(label: 'EMAIL:', data: 'mail@example.com'),
        buildData(label: 'PHONE:', data: '(123) 456-7890'),
        buildData(
            label: 'WORKING DAYS/HOURS:', data: 'MON - SUN /9:00 AM - 8:00PM'),
        const SizedBox(height: 30),
        const Row(
          children: [
            Text(
              'Newsletter subscription',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            hintText: 'Email',
            suffixIcon: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade500),
              onPressed: () {},
              child: const Text(
                'Send',
                style: TextStyle(color: Colors.white),
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        const SizedBox(height: 30),
        informationDatas(),
        const SizedBox(height: 20),
        const Text('payment method',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Expanded(flex: 2, child: Image.network(masterCardLogo)),
        //     Expanded(flex: 1, child: Image.network(visaCardLogo)),
        //     Expanded(flex: 2, child: Image.network(paypalLogo)),
        //   ],
        // ),
        const SizedBox(height: 26),
        const Divider(),
        Text(
          '© Copyright 2021 Mockup. All Roghts Reserved',
          style: TextStyle(color: Colors.grey.shade500),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildHighLightsTab() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Highlights',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('64 GB ROM'),
        Text('15.49 cm (6.1 inch) Liquid Retina HD Display'),
        Text('12MP + 12MP | 12MP Front Camera'),
        Text('A13 Bionic Chip Processor'),
        SizedBox(height: 20),
        SizedBox(height: 40),
      ],
    );
  }

  Column informationDatas() {
    return Column(
        children: List.generate(3, (index) {
      List<String> data = [];
      String label = '';
      switch (index) {
        case 0:
          label = 'Information';
          data.addAll(information);
          break;
        case 1:
          label = 'My Account';
          data.addAll(myAccount);
        case 2:
          label = 'Payment & Shipping';
          data.addAll(paymentAndShipping);
        default:
          label = '';
          data.addAll([]);
      }
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const SizedBox(height: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data
                      .map((e) => Text(
                            e,
                            style: TextStyle(color: Colors.grey.shade600),
                          ))
                      .toList()),
              const SizedBox(height: 30)
            ],
          ),
        ],
      );
    }, growable: true));
  }

  Column buildData({required String label, required String data}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              data,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.grey.shade500),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Padding buildColorStorageDelivery(
      {required Item item,
      required SingleProductStore store,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          // Configurable Options
          Column(
            children: item.configurableOptions!.map((e) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    e.label.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Observer(
                        builder: (_) {
                          final label = e.label.toString();
                          final selectedValues =
                              store.selectedValuesByRow[label] ??
                                  ObservableSet<String>();

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: e.values!
                                .map(
                                  (value) => Observer(
                                    builder: (_) {
                                      final isSelected = selectedValues
                                          .contains(value.label.toString());
                                      return e.label == 'Color'
                                          ? InkWell(
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                store.toggleSelectedValue(label,
                                                    value.label.toString());
                                                log('Clicked on $label: ${value.label}');
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                width: 40,
                                                height: 40,
                                                margin: const EdgeInsets.all(7),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 2,
                                                      color: isSelected
                                                          ? Colors.teal.shade700
                                                          : Colors.transparent,
                                                    ),
                                                    color: Color(int.parse(
                                                            value.swatchData!
                                                                .value!
                                                                .substring(
                                                                    1, 7),
                                                            radix: 16) +
                                                        0xFF000000),
                                                    shape: BoxShape.circle),
                                              ),
                                            )
                                          : ActionChip(
                                              onPressed: () {
                                                store.toggleSelectedValue(label,
                                                    value.label.toString());
                                                log('Clicked on $label: ${value.label}');
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                  color: isSelected
                                                      ? Colors.teal.shade700
                                                      : Colors.transparent,
                                                  width: 2,
                                                ),
                                              ),
                                              label: Text(
                                                value.label.toString(),
                                              ),
                                            );
                                    },
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text('Quantity : '),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: quantityFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              store.quantity = int.parse(controller.text);
                              controller.text =
                                  store.increaseQuantity().toString();
                            },
                            child: Icon(Icons.arrow_drop_up_sharp)),
                        InkWell(
                            onTap: () {
                              store.quantity = int.parse(controller.text);
                              controller.text =
                                  store.increaseQuantity().toString();
                              store.decreaseQuantity();
                            },
                            child: Icon(Icons.arrow_drop_down_sharp)),
                      ],
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Text('Delivery'),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    suffixText: 'Check',
                    suffixStyle: TextStyle(color: Colors.red),
                    hintText: 'Enter your pincode',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row rateAndReviews(Item item) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 50,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${item.reviewCount}/${item.ratingSummary}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(item.reviewCount == 0
            ? 'Be the first one to review this product'
            : 'Ratings and Reviews'),
      ],
    );
  }
}
