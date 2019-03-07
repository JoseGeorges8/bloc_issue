import 'package:bloc_issue/blocs/blocs.dart';
import 'package:bloc_issue/dummyDataProvider.dart';
import 'package:bloc_issue/dummyRepository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_issue/tabs/tab1.dart';
import 'package:bloc_issue/tabs/tab2.dart';
import 'package:bloc_issue/tabs/tab3.dart';
import 'package:http/http.dart' as http;

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print(error);
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainTabView(),
    );
  }
}

class MainTabView extends StatefulWidget {
  MainTabView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController tabController;

  Tab1 tab1;
  Tab2 tab2;
  Tab3 tab3;

  DummyBloc1 dummyBloc1;
  DummyBloc2 dummyBloc2;
  DummyBloc3 dummyBloc3;

  final DummyRepository dummyRepository = DummyRepository(
      dummyProvider: DummyDataProvider(httpClient: http.Client()));

  @override
  void initState() {
    super.initState();
    dummyBloc1 = DummyBloc1(dummyRepository: dummyRepository);
    dummyBloc2 = DummyBloc2(dummyRepository: dummyRepository);
    dummyBloc3 = DummyBloc3(dummyRepository: dummyRepository);

    tab1 = Tab1(dummyRepository: dummyRepository, dummyBloc: dummyBloc1);
    tab2 = Tab2(dummyRepository: dummyRepository, dummyBloc: dummyBloc2);
    tab3 = Tab3(dummyRepository: dummyRepository, dummyBloc: dummyBloc3);
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    dummyBloc1.dispose();
    dummyBloc2.dispose();
    dummyBloc3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: SafeArea(
          child: getTabBar(),
        ),
      ),
      body: getTabBarPages(),
    );
  }

  /// Create the tab bar
  Widget getTabBar() {
    return TabBar(
      controller: tabController,
      tabs: [
        Tab(text: "Meals"),
        Tab(text: "Workouts"),
        Tab(text: "Supplements"),
      ],
    );
  }

  /// Content page for each slide
  Widget getTabBarPages() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        tab1,
        tab2,
        tab3,
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
