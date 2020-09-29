import 'package:ocio/src/model/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';
part 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) {
    print('hola mundo');
  }
}
