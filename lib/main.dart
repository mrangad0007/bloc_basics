import 'package:blocwrk/main-bloc.dart';

Future<void> main() async {
  final bloc = CounterBloc();

  final stream = bloc.stream;

  final streamSubscription = stream.listen((data) {
    print(data);
  }); //! this subscribes to the cubit state stream and prints the state values emitted by it

  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);

  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);

  await Future.delayed(Duration
      .zero); //! we use this to not cancel the subscription immediately down here

  await streamSubscription.cancel();
  await bloc.close();
}
