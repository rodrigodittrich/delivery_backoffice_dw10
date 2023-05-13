// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/ui/styles/text_styles.dart';

class OrderBottonBar extends StatelessWidget {

  const OrderBottonBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        OrderBottonBarButton(          
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          buttonColor: Colors.blue,
          image: 'assets/images/icons/finish_order_white_ico.png',
          buttonLabel: 'Finalizar',
        ),
        OrderBottonBarButton(
          borderRadius: BorderRadius.zero,
          buttonColor: Colors.green,
          image: 'assets/images/icons/confirm_order_white_icon.png',
          buttonLabel: 'Confirmar',
        ),
        OrderBottonBarButton(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          buttonColor: Colors.red,
          image: 'assets/images/icons/cancel_order_white_icon.png',
          buttonLabel: 'Cancelar',
        ),
      ],
    ); 
  }
}

class OrderBottonBarButton extends StatelessWidget {
  final BorderRadius borderRadius;
  final Color buttonColor;
  final String image;
  final String buttonLabel;

  const OrderBottonBarButton({
    Key? key,
    required this.borderRadius,
    required this.buttonColor,
    required this.image,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,            
            ),
            side: BorderSide(
              color: buttonColor,
            ),
            backgroundColor: buttonColor,
          ),
          onPressed: () {}, 
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image),
              const SizedBox(
                 width: 5,
              ),
              Text(
                buttonLabel,
                style: context.textStyles.textBold.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}