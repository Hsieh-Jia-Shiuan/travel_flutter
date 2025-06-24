import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/features/flight/presentation/providers/flight_schedule_provider.dart';
import 'package:travel_flutter/features/flight/presentation/widgets/flight_schedule_list_item.dart';
import 'package:travel_flutter/shared/domain/models/flight_schedule_response.dart';
import 'package:travel_flutter/shared/theme/colors.dart';
import 'package:travel_flutter/shared/theme/styles.dart';

enum AirFlyIO { departure, arrival }

enum AirFlyLine { international, domestic }

class FlightSchedulePage extends ConsumerStatefulWidget {
  const FlightSchedulePage({super.key});

  @override
  ConsumerState<FlightSchedulePage> createState() => _FlightPageState();
}

class _FlightPageState extends ConsumerState<FlightSchedulePage> {
  int selectedTabIndex = 0; // 0: 出發, 1: 抵達
  int selectedLineTypeIndex = 0; // 0: 國際, 1: 國內

  AirFlyIO get currentAirFlyIO =>
      selectedTabIndex == 0 ? AirFlyIO.departure : AirFlyIO.arrival;
  AirFlyLine get currentAirFlyLine => selectedLineTypeIndex == 0
      ? AirFlyLine.international
      : AirFlyLine.domestic;

  int get airFlyLine => selectedLineTypeIndex + 1; // 1: 國際, 2: 國內
  int get airFlyIO => selectedTabIndex + 1; // 1: 出發, 2: 抵達

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(
      flightScheduleNotifierProvider(airFlyLine, airFlyIO),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          tr('flight.title'),
          style: title28TextStyle.copyWith(
            color: neutral900Color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          // 國際/國內 SegmentedButton
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text(
                    tr('flight.line_type.international'),
                    style: button12TextStyle.copyWith(
                      color: selectedLineTypeIndex == 0
                          ? primary300Color
                          : secondary300Color.withAlpha(50),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selected: selectedLineTypeIndex == 0,
                  onSelected: (selected) {
                    if (selected) setState(() => selectedLineTypeIndex = 0);
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text(
                    tr('flight.line_type.domestic'),
                    style: button12TextStyle.copyWith(
                      color: selectedLineTypeIndex == 1
                          ? primary300Color
                          : secondary300Color.withAlpha(50),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selected: selectedLineTypeIndex == 1,
                  onSelected: (selected) {
                    if (selected) setState(() => selectedLineTypeIndex = 1);
                  },
                ),
              ],
            ),
          ),
          // 出發/抵達 Tab
          TabBarWidget(
            selectedTabIndex: selectedTabIndex,
            onTabSelected: (index) => setState(() => selectedTabIndex = index),
          ),
          Expanded(
            child: asyncValue.when(
              data: (schedules) => schedules.isEmpty
                  ? Center(
                      child: Text(
                        tr('common.no_data'),
                        style: body16TextStyle.copyWith(
                          color: neutral900Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : FlightList(
                      schedules: schedules,
                      currentAirFlyIO: currentAirFlyIO,
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr('common.error', namedArgs: {'err': e.toString()}),
                      style: body16TextStyle.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        final notifier = ref.read(
                          flightScheduleNotifierProvider(
                            airFlyLine,
                            airFlyIO,
                          ).notifier,
                        );
                        notifier.refresh();
                      },
                      child: Text(
                        tr('common.reload'),
                        style: body16TextStyle.copyWith(
                          color: neutral900Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;

  const TabBarWidget({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTabSelected,
      tabs: [
        Tab(text: tr('flight.io_type.departure')),
        Tab(text: tr('flight.io_type.arrival')),
      ],
      controller: TabController(
        length: 2,
        vsync: Scaffold.of(context),
        initialIndex: selectedTabIndex,
      ),
      indicatorWeight: 2.0,
    );
  }
}

class FlightList extends StatelessWidget {
  final List<FlightScheduleResponse> schedules;
  final AirFlyIO currentAirFlyIO;

  const FlightList({
    super.key,
    required this.schedules,
    required this.currentAirFlyIO,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: schedules.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final flight = schedules[index];
        return FlightScheduleListItem(
          flight: flight,
          airFlyIO: currentAirFlyIO,
        );
      },
    );
  }
}
