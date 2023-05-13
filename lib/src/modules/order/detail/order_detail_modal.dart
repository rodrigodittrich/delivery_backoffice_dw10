import 'package:flutter/material.dart';

import '../../../core/extensions/formater_extensions.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/text_styles.dart';
import 'widgets/order_botton_bar.dart';
import 'widgets/order_info_tile.dart';
import 'widgets/order_product_item.dart';

class OrderDetailModal extends StatefulWidget {

  const OrderDetailModal({ Key? key }) : super(key: key);

  @override
  State<OrderDetailModal> createState() => _OrderDetailModalState();
}

class _OrderDetailModalState extends State<OrderDetailModal> {
  void _closeModal() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidget;
    return Material(
      color: Colors.black26,
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          elevation: 10,
          child: Container(
            width: screenWidth * (screenWidth > 1200 ? .5 : .7),
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Detalhe do Pedido',
                          style: context.textStyles.textTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        child: IconButton(
                          alignment: Alignment.topRight,
                          onPressed: _closeModal, 
                          icon: const Icon(Icons.close),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                     height: 20,
                  ),
                  Row(
                    children: [
                      Text('Nome do cliente: ', style: context.textStyles.textBold,),
                      const SizedBox(
                         height: 20,
                      ),
                      Text('Rodrigo Dittrich', style: context.textStyles.textRegular),
                    ],
                  ),
                  const Divider(),
                  ...List.generate(3, (index) => index).map((e) => const OrderProductItem()).toList(),  
                  const SizedBox(
                     height: 10,
                  ),                
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total do Pedido',
                          style: context.textStyles.textExtraBold.copyWith(fontSize: 18),
                        ),
                        Text(
                          200.0.currencyPTBR,
                          style: context.textStyles.textExtraBold.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const OrderInfoTile(label: 'Endereço de entrega', info: 'Av 7 de Setembro, 123'),
                  const Divider(),
                  const OrderInfoTile(label: 'Forma de pagamento', info: 'Cartão de crédito'),
                  const SizedBox(
                     height: 10,
                  ),
                  const OrderBottonBar()
                ],
              ),
            ),

          ),
        ),
      );
  }
}