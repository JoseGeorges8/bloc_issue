import 'package:bloc_issue/blocs/blocs.dart';
import 'package:bloc_issue/dummyRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab2 extends StatefulWidget {
  final DummyRepository dummyRepository;
  final DummyBloc2 dummyBloc;

  Tab2({Key key, @required this.dummyRepository, this.dummyBloc})
      : assert(dummyRepository != null),
        super(key: key);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with AutomaticKeepAliveClientMixin<Tab2> {
  DummyBloc2 _dummyBloc;

  @override
  void initState() {
    print('initState tab2');
    super.initState();
    _dummyBloc = widget.dummyBloc;
    _dummyBloc.dispatch(FetchDummyInfo2());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(70, 79, 153, 1),
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2.0,
            child: BlocBuilder(
              bloc: _dummyBloc,
              builder: (_, DummyState2 state) {
                if (state is DummyLoading2) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is DummyLoaded2) {
                  return Center(
                    child: Text(
                      state.dummyData.title,
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
                if (state is DummyError2) {
                  return Center(
                    child: Text(
                      'Something went wrong!',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Center(child: Text('Went through other event?'));
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
