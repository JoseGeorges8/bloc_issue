import 'package:bloc_issue/bloc1/dummyBloc.dart';
import 'package:bloc_issue/bloc1/dummyEvent.dart';
import 'package:bloc_issue/bloc1/dummyRepository.dart';
import 'package:bloc_issue/bloc1/dummyState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab1 extends StatefulWidget {
  final DummyRepository dummyRepository;
  final DummyBloc dummyBloc;

  Tab1({Key key, @required this.dummyRepository, this.dummyBloc})
      : assert(dummyRepository != null),
        super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  DummyBloc _dummyBloc;

  @override
  void initState() {
    super.initState();
    _dummyBloc = widget.dummyBloc;
    _dummyBloc.dispatch(FetchDummyInfo());
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
              builder: (_, DummyState state) {
                if (state is DummyLoading)
                  return Center(child: CircularProgressIndicator());
                if (state is DummyLoaded) {
                  return Center(
                    child: Text(state.dummyData.title,
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
                if (state is DummyError) {
                  return Center(
                    child: Text(
                      'Something went wrong!',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Center(child:Text('Different state?'));
              },
            ),
          ),
        ),
      ],
    );
  }

}
