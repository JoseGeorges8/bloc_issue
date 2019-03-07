import 'package:bloc_issue/dummyModel.dart';
import 'package:equatable/equatable.dart';

abstract class DummyState extends Equatable {
  DummyState([List props = const []]) : super(props);
}


class DummyLoading extends DummyState {}

///Meal Plans Page and Workout Plans Page
class DummyLoaded extends DummyState {

  final DummyData dummyData;

  DummyLoaded(this.dummyData);


}

///Supplements Plan Page
class DummyLoadedSecondly extends DummyState{
  final DummyData dummyData;

  DummyLoadedSecondly(this.dummyData);

}

class DummyError extends DummyState {}