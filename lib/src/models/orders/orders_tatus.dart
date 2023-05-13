import 'package:flutter/material.dart';

enum OrderStatus {
  pendente('Pendente', 'P', Colors.blue),
  confirmado('Confirmado', 'P', Colors.green),
  finalizado('Finalizado', 'P', Colors.black),
  cancelado('Cancelado', 'P', Colors.red);

  final String name;
  final String acronym;
  final Color color;

  const OrderStatus(this.name, this.acronym, this.color);

  static OrderStatus parse(String acronym) {
    return values.firstWhere((s) => s.acronym ==acronym);
  }

}