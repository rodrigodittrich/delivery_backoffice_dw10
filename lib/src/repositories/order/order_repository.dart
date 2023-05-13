import '../../models/orders/order_model.dart';
import '../../models/orders/orders_tatus.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> findAllOrders(DateTime date, OrderStatus? status);
  Future<OrderModel> getById(int id);
  Future<void> changeStatus(int id, OrderStatus status);
  //Future<void> save(OrderModel orderModel);
  //Future<void> deleteOrder(int id);
}