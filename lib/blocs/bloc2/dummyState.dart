import 'package:bloc_issue/dummyModel.dart';
import 'package:equatable/equatable.dart';

abstract class DummyState2 extends Equatable {
  DummyState2([List props = const []]) : super(props);
}

class DummyLoading2 extends DummyState2 {
  @override
  String toString() => 'DummyLoading2';
}

///Meal Plans Page and Workout Plans Page
class DummyLoaded2 extends DummyState2 {
  final DummyData dummyData;

  DummyLoaded2(this.dummyData) : super([dummyData]);

  @override
  String toString() => 'DummyLoaded2 { dummyData: $dummyData }';
}

class DummyError2 extends DummyState2 {
  @override
  String toString() => 'DummyError2';
}
