import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widget/order_header.dart';
import 'widget/order_item.dart';

class OrderPage extends StatelessWidget {

  const OrderPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              const OrderHeader(),
              const SizedBox(
                 height: 50,
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return GridView.builder(
                      itemCount: 10, //controller.products.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 91,
                        maxCrossAxisExtent: 600,
                      ),
                      itemBuilder: (context, index) {
                        return OrderItem();
                        //return OrderItem(product: controller.products[index]);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}