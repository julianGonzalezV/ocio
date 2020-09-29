part of 'order_bloc.dart';

class OrderState {
  final existOrder;
  final List<Product> orderList;

  OrderState({List<Product> order})
      : orderList = order ?? null,
        existOrder = (order.length > 0) ? true : false;
}
