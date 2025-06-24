import 'package:go_router/go_router.dart';
import 'package:travel_flutter/features/currency/presentation/pages/currency_page.dart';
import 'package:travel_flutter/features/flight/presentation/pages/flight_schedule_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'flight',
      path: '/',
      builder: (context, state) => const FlightSchedulePage(),
    ),
    GoRoute(
      name: 'currency',
      path: '/currency',
      builder: (context, state) => const CurrencyPage(),
    ),
  ],
);
