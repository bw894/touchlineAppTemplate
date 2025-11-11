

class FFLibraryValues {
  static FFLibraryValues _instance = FFLibraryValues._internal();

  factory FFLibraryValues() {
    return _instance;
  }

  FFLibraryValues._internal();

  static void reset() {
    _instance = FFLibraryValues._internal();
  }

  String BLProjectId = 'B3D1DEEB-AEAC-4C93-A4FC-51077D2F670D';
  String BLRestAPIKey = '1FCC6643-16A7-493D-93D2-6D0CC6B4A5A8';
  String? TicketingLink = '';
  String? ClubFullName = '';
  String? ClubShortName = '';
  String? ClubBadge = '';
  String? NicknamePlural = '';
  String? ClubABR = '';
  String? feedURL = '';
  int? PredictorNumber = 1;
  String focusTeamObjectId = '236453B3-6F1F-48C2-8524-2D43A62A9506';
  String? ClubBadgeOnPrimary = '';
  late String settingsId = '';
  int? BRTopLeft = 0;
  int? BRTopRight = 0;
  int? BRBottomLeft = 0;
  int? BRBottomRight = 0;
  String? deepLinkUrl = '';
}
