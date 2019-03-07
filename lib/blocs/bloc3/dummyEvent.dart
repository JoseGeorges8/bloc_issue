import 'package:equatable/equatable.dart';

abstract class DummyEvent3 extends Equatable {
  DummyEvent3([List props = const []]) : super(props);
}

class FetchDummyInfo3 extends DummyEvent3 {
  FetchDummyInfo3();

  @override
  String toString() => 'FetchDummyInfo3';
}
