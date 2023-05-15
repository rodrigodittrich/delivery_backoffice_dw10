// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/extensions/formater_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../dto/order/order_product_dto.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductDto orderProduct;

  const OrderProductItem({
    Key? key,
    required this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              orderProduct.product.name,
              style: context.textStyles.textRegular,
            ),
          ),
          Text(
            '${orderProduct.amount}',
            style: context.textStyles.textRegular,
          ),
          Expanded(
            child: Text(
              orderProduct.product.price.currencyPTBR,
              textAlign: TextAlign.end,
              style: context.textStyles.textRegular,
            ),
          )
        ],
      ),
    );
  }
}
