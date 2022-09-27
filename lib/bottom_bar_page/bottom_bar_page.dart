import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/bottom_bar_page/bottom_ber_controller.dart';
import 'package:karaoke_app/calendar_page/calendar_page.dart';
import 'package:karaoke_app/record_page/record_page.dart';

class BottomBarPage extends ConsumerWidget {
  BottomBarPage({super.key});

  final pages = [
    const RecordPage(),
    const CalendarPage(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomBarControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: Color.fromARGB(150, 6, 105, 186)),
        child: NavigationBar(
          backgroundColor: const Color(0xff192028),
          selectedIndex: currentIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.insights_outlined,
                color: Colors.yellowAccent,
              ),
              icon: Icon(Icons.insights_outlined),
              label: 'RECORD',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.calendar_month_outlined,
                color: Colors.yellowAccent,
              ),
              icon: Icon(Icons.calendar_month_outlined),
              label: 'CALENDAR',
            ),
          ],
          onDestinationSelected: (i) {
            ref.watch(bottomBarControllerProvider.notifier).changeIndex(i);
          },
        ),
      ),
    );
  }
}
