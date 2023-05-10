import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';

class PaymentTypeHeader extends StatelessWidget {

  const PaymentTypeHeader({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return BaseHeader(
        title: 'Administrar formas de pagamento',
        buttonLabel: 'ADICIONAR',
        buttonPressed: (){},
      );
  }
}