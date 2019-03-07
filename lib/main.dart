import 'package:bloc_issue/bloc1/dummyBloc.dart';
import 'package:bloc_issue/bloc1/dummyDataProvider.dart';
import 'package:bloc_issue/bloc1/dummyRepository.dart';
import 'package:flutter/material.dart';
import 'package:bloc_issue/tabs/tab1.dart';
import 'package:bloc_issue/tabs/tab2.dart';
import 'package:bloc_issue/tabs/tab3.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainTabView(),
    );
  }
}




class MainTabView extends StatefulWidget {
  MainTabView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {


    return _MainTabViewState();
  }
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin,  AutomaticKeepAliveClientMixin{
  TabController tabController;

  Tab1 tab1;
  Tab2 tab2;
  Tab3 tab3;
  List<Widget> pages;
  Widget currentPage;

  DummyBloc dummyBloc;


  final PageStorageBucket bucket = PageStorageBucket();

  final DummyRepository dummyRepository = DummyRepository(dummyProvider: DummyDataProvider(httpClient: http.Client()));



  @override
  void initState() {
    super.initState();
    dummyBloc = DummyBloc(dummyRepository: dummyRepository);

    tab1 = Tab1(dummyRepository: dummyRepository, dummyBloc: dummyBloc,);
    tab2 = Tab2(dummyRepository: dummyRepository, dummyBloc: dummyBloc);
    tab3 = Tab3(dummyRepository: dummyRepository, dummyBloc: dummyBloc);
    pages = [tab1, tab2, tab3];
    currentPage = tab2;
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    dummyBloc.dispose();
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
        body: getTabBarPages());
  }

  /// Create the tab bar
  Widget getTabBar() {
    return TabBar(
        controller: tabController,
        tabs: [
          Tab(text: "Meals"),
          Tab(text: "Workouts"),
          Tab(text: "Supplements"),
        ]);
  }


  /// Content page for each slide
  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      tab1,
      tab2,
      tab3,
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}