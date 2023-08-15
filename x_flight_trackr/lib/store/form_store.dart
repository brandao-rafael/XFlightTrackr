import 'package:mobx/mobx.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String from = '';

  @observable
  String to = '';

  @observable
  int quantity = 1;

  @action
  void setFrom(String value) {
    from = value;
  }

  @action
  void setTo(String value) {
    to = value;
  }

  @action
  void increaseQuantity() {
    if (quantity < 3) {
      quantity++;
    }
  }

  @action
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
