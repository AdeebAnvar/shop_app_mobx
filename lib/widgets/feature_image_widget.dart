import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart' as spm;
import 'package:shopp_app_mobx/logic/single_product/single_product_store.dart';

class FeatureImageWidget extends StatelessWidget {
  const FeatureImageWidget({
    super.key,
    this.data,
    this.singleProductStore,
  });
  final List<spm.Item>? data;
  final SingleProductStore? singleProductStore;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        margin: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height / 2,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        singleProductStore?.onTapSideImage(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        margin: const EdgeInsets.all(10),
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color:
                                    singleProductStore?.selectedIndex == index
                                        ? Colors.teal
                                        : Colors.grey.shade200)),
                        child: Center(
                          child: Image.network(
                              height: 50,
                              data![0].mediaGallery![index].url.toString()),
                        ),
                      ),
                    );
                  },
                  itemCount: data![0].mediaGallery!.length),
            ),
            Expanded(
              flex: 3,
              child: Image.network(
                data![0]
                    .mediaGallery![singleProductStore!.selectedIndex]
                    .url
                    .toString(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
