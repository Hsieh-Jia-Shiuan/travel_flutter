import 'package:go_router/go_router.dart';
import 'package:travel_flutter/features/flight/presentation/pages/flight_schedule_page.dart';

GoRouter routers() {
  return GoRouter(
    routes: [
      GoRoute(
        name: 'flight_schedule',
        path: '/',
        builder: (context, state) => const FlightSchedulePage(),
      ),
    ],
  );
}
