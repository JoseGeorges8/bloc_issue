import 'package:bloc/bloc.dart';
import 'package:bloc_issue/blocs/bloc1/bloc1.dart';
import 'package:bloc_issue/dummyRepository.dart';
import 'package:bloc_issue/dummyModel.dart';
import 'package:meta/meta.dart';

class DummyBloc1 extends Bloc<DummyEvent1, DummyState1> {
  final DummyRepository dummyRepository;

  DummyBloc1({@required this.dummyRepository})
      : assert(dummyRepository != null);

  @override
  DummyState1 get initialState => DummyLoading1();

  @override
  Stream<DummyState1> mapEventToState(
      DummyState1 currentState, DummyEvent1 event) async* {
    if (event is FetchDummyInfo1) {
      yield DummyLoading1();
      try {
        final DummyData dummyData = await dummyRepository.getDummyInfo();
        yield DummyLoaded1(dummyData);
      } catch (_) {
        yield DummyError1();
      }
    }
  }
}
