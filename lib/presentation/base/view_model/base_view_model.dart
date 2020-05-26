import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum EventResult { Success, Failure }

abstract class Event extends Equatable {
  final EventResult result;
  const Event(this.result);
  @override
  List<Object> get props => [result];
  @override
  bool get stringify => true;
}

class SuccessEvent<T> extends Event {
  final T data;
  const SuccessEvent(this.data) : super(EventResult.Success);

  @override
  List<Object> get props => [data,...super.props];
}

class FailureEvent extends Event {
  final String error;
  const FailureEvent(this.error) : super(EventResult.Failure);
  @override
  List<Object> get props => [error,...super.props];
}

enum ViewState { None, Waiting, Done }

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.None;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}