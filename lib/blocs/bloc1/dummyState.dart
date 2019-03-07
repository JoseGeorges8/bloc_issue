import 'package:bloc_issue/dummyModel.dart';
import 'package:equatable/equatable.dart';

abstract class DummyState1 extends Equatable {
  DummyState1([List props = const []]) : super(props);
}

class DummyLoading1 extends DummyState1 {
  @override
  String toString() => 'DummyLoading1';
}

///Meal Plans Page and Workout Plans Page
class DummyLoaded1 extends DummyState1 {
  final DummyData dummyData;

  DummyLoaded1(this.dummyData);

  @override
  String toString() => 'DummyLoaded1 { dummyData: $dummyData }';
}

class DummyError1 extends DummyState1 {
  @override
  String toString() => 'DummyError1';
}
