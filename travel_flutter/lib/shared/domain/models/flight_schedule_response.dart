class FlightScheduleResponse {
  final String expectTime;
  final String realTime;
  final String airLineName;
  final String airLineCode;
  final String airLineLogo;
  final String airLineUrl;
  final String airLineNum;
  final String upAirportCode;
  final String upAirportName;
  final String goalAirportCode;
  final String goalAirportName;
  final String airPlaneType;
  final String airBoardingGate;
  final String airFlyStatus;
  final String airFlyDelayCause;

  const FlightScheduleResponse({
    required this.expectTime,
    required this.realTime,
    required this.airLineName,
    required this.airLineCode,
    required this.airLineLogo,
    required this.airLineUrl,
    required this.airLineNum,
    required this.upAirportCode,
    required this.upAirportName,
    required this.goalAirportCode,
    required this.goalAirportName,
    required this.airPlaneType,
    required this.airBoardingGate,
    required this.airFlyStatus,
    required this.airFlyDelayCause,
  });

  factory FlightScheduleResponse.fromJson(Map<String, dynamic> json) {
    return FlightScheduleResponse(
      expectTime: json['expectTime'] ?? '',
      realTime: json['realTime'] ?? '',
      airLineName: json['airLineName'] ?? '',
      airLineCode: json['airLineCode'] ?? '',
      airLineLogo: json['airLineLogo'] ?? '',
      airLineUrl: json['airLineUrl'] ?? '',
      airLineNum: json['airLineNum'] ?? '',
      upAirportCode: json['upAirportCode'] ?? '',
      upAirportName: json['upAirportName'] ?? '',
      goalAirportCode: json['goalAirportCode'] ?? '',
      goalAirportName: json['goalAirportName'] ?? '',
      airPlaneType: json['airPlaneType'] ?? '',
      airBoardingGate: json['airBoardingGate'] ?? '',
      airFlyStatus: json['airFlyStatus'] ?? '',
      airFlyDelayCause: json['airFlyDelayCause'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expectTime': expectTime,
      'realTime': realTime,
      'airLineName': airLineName,
      'airLineCode': airLineCode,
      'airLineLogo': airLineLogo,
      'airLineUrl': airLineUrl,
      'airLineNum': airLineNum,
      'upAirportCode': upAirportCode,
      'upAirportName': upAirportName,
      'goalAirportCode': goalAirportCode,
      'goalAirportName': goalAirportName,
      'airPlaneType': airPlaneType,
      'airBoardingGate': airBoardingGate,
      'airFlyStatus': airFlyStatus,
      'airFlyDelayCause': airFlyDelayCause,
    };
  }
}
