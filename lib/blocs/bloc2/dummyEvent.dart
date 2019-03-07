import 'package:equatable/equatable.dart';

abstract class DummyEvent2 extends Equatable {
  DummyEvent2([List props = const []]) : super(props);
}

class FetchDummyInfo2 extends DummyEvent2 {
  FetchDummyInfo2();

  @override
  String toString() => 'FetchDummyInfo2';
}
