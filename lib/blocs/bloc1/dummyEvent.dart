import 'package:equatable/equatable.dart';

abstract class DummyEvent1 extends Equatable {
  DummyEvent1([List props = const []]) : super(props);
}

class FetchDummyInfo1 extends DummyEvent1 {
  FetchDummyInfo1();

  @override
  String toString() => 'FetchDummyInfo1';
}
