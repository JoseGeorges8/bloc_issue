import 'package:bloc_issue/dummyModel.dart';
import 'package:equatable/equatable.dart';

abstract class DummyState3 extends Equatable {
  DummyState3([List props = const []]) : super(props);
}

class DummyLoading3 extends DummyState3 {
  @override
  String toString() => 'DummyLoading3';
}

///Meal Plans Page and Workout Plans Page
class DummyLoaded3 extends DummyState3 {
  final DummyData dummyData;

  DummyLoaded3(this.dummyData) : super([dummyData]);

  @override
  String toString() => 'DummyLoaded3 { dummyData: $dummyData }';
}

class DummyError3 extends DummyState3 {
  @override
  String toString() => 'DummyError3';
}
