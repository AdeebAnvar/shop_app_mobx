import 'package:flutter/material.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart' as spm;
import 'package:shopp_app_mobx/widgets/centre_buttons.dart';
import 'package:shopp_app_mobx/widgets/custom_button.dart';
import 'package:shopp_app_mobx/widgets/rate.dart';

class RelatedProductsWidget extends StatelessWidget {
  const RelatedProductsWidget(
      {super.key, required this.item, required this.index});
  final spm.Item item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        // height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: SizedBox(
                          width: 100,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            children: [
                              Icon(Icons.favorite_border_outlined),
                            ],
                          ))),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Row(
                          children: [
                            Image.network(
                                fit: BoxFit.contain,
                                item.relatedProducts![index].image!.url
                                    .toString())
                          ],
                        ),
                      ))
                ],
              ),
            ]),
            SizedBox(height: 10),
            Text(
              item.relatedProducts![index].name.toString(),
              style: TextStyle(
                  color: Colors.grey.shade500, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Rate(
                  item: item,
                ),
              ],
            ),
            CenterButtons(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
