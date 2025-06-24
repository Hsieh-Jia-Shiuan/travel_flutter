import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel_flutter/features/flight/presentation/pages/flight_schedule_page.dart';
import 'package:travel_flutter/shared/domain/models/flight_schedule_response.dart';
import 'package:travel_flutter/shared/theme/colors.dart';
import 'package:travel_flutter/shared/theme/styles.dart';

class FlightScheduleListItem extends StatelessWidget {
  final FlightScheduleResponse flight;
  final AirFlyIO airFlyIO;

  const FlightScheduleListItem({
    super.key,
    required this.flight,
    required this.airFlyIO,
  });

  Color getStatusColor(String status) {
    if (status.contains('延遲') || status.contains('Delayed')) {
      return Colors.orange; // 你可以換成自定義色
    } else if (status.contains('取消') || status.contains('Cancelled')) {
      return Colors.red;
    } else if (status.contains('離站') || status.contains('Departed')) {
      return Colors.blue;
    } else if (status.contains('抵達') || status.contains('Arrived')) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final otherAirportCode = airFlyIO == AirFlyIO.departure
        ? flight.goalAirportCode
        : flight.upAirportCode;
    final otherAirportName = airFlyIO == AirFlyIO.departure
        ? flight.goalAirportName
        : flight.upAirportName;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 左側
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 預計/實際時間
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr('flight.item.estimated_time'),
                            style: body16TextStyle.copyWith(
                              color: neutral900Color,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            flight.expectTime,
                            style: body16TextStyle.copyWith(
                              color: neutral900Color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr('flight.item.actual_time'),
                            style: body16TextStyle.copyWith(
                              color: neutral900Color,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            flight.realTime,
                            style: body16TextStyle.copyWith(
                              color: neutral900Color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 航班號
                  Text(
                    tr(
                      'flight.item.flight_number',
                      namedArgs: {'num': flight.airLineNum},
                    ),
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 登機門
                  Text(
                    tr(
                      'flight.item.terminal_gate',
                      namedArgs: {'num': flight.airBoardingGate},
                    ),
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 狀態
                  Text(
                    flight.airFlyStatus,
                    style: body16TextStyle.copyWith(
                      color: getStatusColor(flight.airFlyStatus),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // 延遲原因
                  if (flight.airFlyDelayCause.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        tr(
                          'flight.item.delay_reason',
                          namedArgs: {'reason': flight.airFlyDelayCause},
                        ),
                        style: body16TextStyle.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // 右側
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    otherAirportCode,
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    otherAirportName,
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '|',
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr('flight.current_airport_code'),
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tr('flight.current_airport_name'),
                    style: body16TextStyle.copyWith(
                      color: neutral900Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
