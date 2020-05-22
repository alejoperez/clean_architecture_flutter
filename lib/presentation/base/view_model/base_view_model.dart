import 'package:clean/domain/model/base_result.dart';
import 'package:flutter/foundation.dart';

enum EventResult { Success, Failure }

abstract class Event {
  final EventResult result;
  const Event(this.result);
}

class SuccessEvent<T> extends Event {
  final T data;
  const SuccessEvent(this.data) : super(EventResult.Success);
}

class FailureEvent extends Event {
  final String error;
  const FailureEvent(this.error) : super(EventResult.Failure);
}

enum ViewState { None, Waiting, Done }

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.None;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  Future<Event> executeAsync<T extends BaseResult>(Future<T> futureTask) async {
    setState(ViewState.Waiting);
    final BaseResult response = await futureTask;
    setState(ViewState.Done);

    if (response.error.isEmpty) {
      return SuccessEvent(response);
    } else {
      return FailureEvent(response.error);
    }
  }
}