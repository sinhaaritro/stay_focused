import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/local_bloc/local_db_bloc.dart';
import '../../bloc/timer_bloc/timer_bloc.dart';
import '../../infrastructure/local_db/moor_database.dart';
import '../../infrastructure/timer_repository/timer_repository.dart';
import '../report_screen/report_screen.dart';
import '../timer_screen/timer_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localDatabase = BlocProvider.of<LocalDatabaseBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Focused Timer"),
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.watch_later_outlined),
                child: Text("Timer"),
              ),
              Tab(
                icon: Icon(Icons.receipt_rounded),
                child: Text("Reports"),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: [
            BlocProvider<TimerBloc>(
                create: (BuildContext context) => TimerBloc(TimerRepository(
                    TimerDao(localDatabase.state.localDatabase))),
                child: TimerScreen()),
            ReportsScreen(),
          ],
        ),
      ),
    );
  }
}
