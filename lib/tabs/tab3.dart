import 'package:bloc_issue/blocs/blocs.dart';
import 'package:bloc_issue/dummyRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab3 extends StatefulWidget {
  final DummyRepository dummyRepository;
  final DummyBloc3 dummyBloc;

  Tab3({Key key, @required this.dummyRepository, this.dummyBloc})
      : assert(dummyRepository != null),
        super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> with AutomaticKeepAliveClientMixin<Tab3> {
  DummyBloc3 _dummyBloc;

  @override
  void initState() {
    print('initState tab3');
    super.initState();
    _dummyBloc = widget.dummyBloc;
    _dummyBloc.dispatch(FetchDummyInfo3());
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
              builder: (_, DummyState3 state) {
                if (state is DummyLoading3) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is DummyLoaded3) {
                  return Center(
                    child: Text(
                      state.dummyData.title,
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
                if (state is DummyError3) {
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
