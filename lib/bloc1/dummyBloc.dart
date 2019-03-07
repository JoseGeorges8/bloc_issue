import 'package:bloc/bloc.dart';
import 'package:bloc_issue/bloc1/dummyEvent.dart';
import 'package:bloc_issue/bloc1/dummyRepository.dart';
import 'package:bloc_issue/bloc1/dummyState.dart';
import 'package:bloc_issue/dummyModel.dart';
import 'package:meta/meta.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {

  final DummyRepository dummyRepository;

  DummyBloc({@required this.dummyRepository})
      : assert(dummyRepository != null);

  @override
  DummyState get initialState => DummyLoading();

  @override
  Stream<DummyState> mapEventToState(DummyState currentState, DummyEvent event) async* {
    if (event is FetchDummyInfo) {
      yield DummyLoading();
      try {
        final DummyData dummyData = await dummyRepository.getDummyInfo();
        yield DummyLoaded(dummyData);
      } catch (_) {
        yield DummyError();
      }
    } else if (event is FetchDummyInfoSecondly) {
      yield DummyLoading();
      try {
        final DummyData dummyData = await dummyRepository.getDummyInfo();
        yield DummyLoadedSecondly(dummyData);
      } catch (_) {
        yield DummyError();
      }
    }
  }
}