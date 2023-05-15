// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../dto/order/order_dto.dart';
import '../../models/orders/order_model.dart';
import '../../models/orders/orders_tatus.dart';
import '../../repositories/order/order_repository.dart';
import '../../services/order/get_order_by_id.dart';

part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

enum OrderStateStatus{
  initial,
  loading,
  loaded,
  error,
  showDetailModal,
  statusChanged
}

abstract class OrderControllerBase with Store {
  final OrderRepository _orderRepository;
  final GetOrderById _getOrderById;

  OrderControllerBase(
    this._orderRepository,
    this._getOrderById,
  ) {
    final todayNow = DateTime.now();
    _today = DateTime(todayNow.year, todayNow.month, todayNow.day);
  }

  @readonly
  var _status = OrderStateStatus.initial;

  late final DateTime _today;

  @readonly
  var _orders = <OrderModel>[];

  @readonly
  OrderStatus? _statusFilter;

  @readonly
  String? _errorMessage;

  @readonly
  OrderDto? _orderSelected;

  @action
  void changeStatusFilter(OrderStatus? status) {
    _statusFilter = status;
    findOrders();
  } 

  @action
  Future<void> findOrders() async {
    try {
      _status = OrderStateStatus.loading;
      _orders = await _orderRepository.findAllOrders(_today, _statusFilter);
      _status = OrderStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar pedidos do dia', error: e, stackTrace: s);
      _status = OrderStateStatus.error;
      _errorMessage = 'Erro ao buscar pedidos do dia';
    }
  }

  Future<void> showDetailModal(OrderModel model) async {
    _status = OrderStateStatus.loading;
    await Future.delayed(Duration.zero);
    _orderSelected = await _getOrderById(model);
    _status = OrderStateStatus.showDetailModal;
  }

  @action
  Future<void> changeStatus(OrderStatus status) async {
    _status = OrderStateStatus.loading;
    await _orderRepository.changeStatus(_orderSelected!.id, status);
    _status = OrderStateStatus.statusChanged;
  }

}