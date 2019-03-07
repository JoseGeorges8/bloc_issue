import 'package:bloc/bloc.dart';
import 'package:bloc_issue/blocs/bloc3/bloc3.dart';
import 'package:bloc_issue/dummyRepository.dart';
import 'package:bloc_issue/dummyModel.dart';
import 'package:meta/meta.dart';

class DummyBloc3 extends Bloc<DummyEvent3, DummyState3> {
  final DummyRepository dummyRepository;

  DummyBloc3({@required this.dummyRepository})
      : assert(dummyRepository != null);

  @override
  DummyState3 get initialState => DummyLoading3();

  @override
  Stream<DummyState3> mapEventToState(
      DummyState3 currentState, DummyEvent3 event) async* {
    if (event is FetchDummyInfo3) {
      yield DummyLoading3();
      try {
        final DummyData dummyData = await dummyRepository.getDummyInfo();
        yield DummyLoaded3(dummyData);
      } catch (_) {
        yield DummyError3();
      }
    }
  }
}
