import 'package:flutter/material.dart';
import '../report_screen/report_screen.dart';
import '../timer_screen/timer_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: [
            TimerScreen(),
            ReportsScreen(),
          ],
        ),
      ),
    );
  }
}
