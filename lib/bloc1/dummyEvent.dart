import 'package:equatable/equatable.dart';

abstract class DummyEvent extends Equatable{
  DummyEvent([List props = const []]) : super(props);
}

class FetchDummyInfo extends DummyEvent {

  FetchDummyInfo();

}