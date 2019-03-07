import 'package:bloc_issue/bloc1/dummyDataProvider.dart';
import 'package:bloc_issue/dummyModel.dart';
import 'package:meta/meta.dart';


class DummyRepository {
  final DummyDataProvider dummyProvider;

  DummyRepository({@required this.dummyProvider})
      : assert(dummyProvider != null);

  Future<DummyData> getDummyInfo() async {
    return  await dummyProvider.getDummyInfo();
  }

}