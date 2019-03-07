import 'package:bloc/bloc.dart';
import 'package:bloc_issue/blocs/bloc2/bloc2.dart';
import 'package:bloc_issue/dummyRepository.dart';
import 'package:bloc_issue/dummyModel.dart';
import 'package:meta/meta.dart';

class DummyBloc2 extends Bloc<DummyEvent2, DummyState2> {
  final DummyRepository dummyRepository;

  DummyBloc2({@required this.dummyRepository})
      : assert(dummyRepository != null);

  @override
  DummyState2 get initialState => DummyLoading2();

  @override
  Stream<DummyState2> mapEventToState(
      DummyState2 currentState, DummyEvent2 event) async* {
    if (event is FetchDummyInfo2) {
      yield DummyLoading2();
      try {
        final DummyData dummyData = await dummyRepository.getDummyInfo();
        yield DummyLoaded2(dummyData);
      } catch (_) {
        yield DummyError2();
      }
    }
  }
}
