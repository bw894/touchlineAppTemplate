// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class BLESSfixtureStruct extends BaseStruct {
  BLESSfixtureStruct({
    String? summary,
    String? comp,
    String? awayBadge,
    int? start,
    String? homeAbr,
    String? awayTeamName,
    String? homeTeamName,
    String? highlights,
    String? homeBadge,
    String? awayAbr,
    String? report,
    int? end,
    String? location,
    String? interview,
    String? objectId,
    int? homeGoals,
    int? awayGoals,
    List<LiveEventFeedItemStruct>? eventTimeline,
    int? awayTeamId,
    int? homeTeamId,
    String? programmeImageURL,
    String? programmeFileURL,
    String? status,
    List<PlayerJSONStruct>? homeLineupJSON,
    List<PlayerJSONStruct>? awayLineupJSON,
    int? halfStartTimestamp,
    bool? isPostponed,
    bool? manualOverride,
    String? postponedText,
    String? outputStatus,
    List<SmFixtureStruct>? otherGames,
    String? stadiumName,
    BLTeamStruct? team,
    String? matchBackground,
    String? leagueBadgeUrl,
    bool? predictor,
    bool? tickets,
    int? awayPenalties,
    int? homePenalties,
    String? awayPenaltyBreakdown,
    String? homePenaltyBreakdown,
    String? penaltiesText,
    bool? penaltyShootout,
    double? programmePrice,
    String? programmePromoText,
    List<SponsorshipDealsStruct>? sponsorship,
    bool? lineupsBuilderOnOff,
    bool? lineupsOnOff,
    int? overallAttendance,
    int? awayAttendance,
    bool? scoreOnlyFT,
  })  : _summary = summary,
        _comp = comp,
        _awayBadge = awayBadge,
        _start = start,
        _homeAbr = homeAbr,
        _awayTeamName = awayTeamName,
        _homeTeamName = homeTeamName,
        _highlights = highlights,
        _homeBadge = homeBadge,
        _awayAbr = awayAbr,
        _report = report,
        _end = end,
        _location = location,
        _interview = interview,
        _objectId = objectId,
        _homeGoals = homeGoals,
        _awayGoals = awayGoals,
        _eventTimeline = eventTimeline,
        _awayTeamId = awayTeamId,
        _homeTeamId = homeTeamId,
        _programmeImageURL = programmeImageURL,
        _programmeFileURL = programmeFileURL,
        _status = status,
        _homeLineupJSON = homeLineupJSON,
        _awayLineupJSON = awayLineupJSON,
        _halfStartTimestamp = halfStartTimestamp,
        _isPostponed = isPostponed,
        _manualOverride = manualOverride,
        _postponedText = postponedText,
        _outputStatus = outputStatus,
        _otherGames = otherGames,
        _stadiumName = stadiumName,
        _team = team,
        _matchBackground = matchBackground,
        _leagueBadgeUrl = leagueBadgeUrl,
        _predictor = predictor,
        _tickets = tickets,
        _awayPenalties = awayPenalties,
        _homePenalties = homePenalties,
        _awayPenaltyBreakdown = awayPenaltyBreakdown,
        _homePenaltyBreakdown = homePenaltyBreakdown,
        _penaltiesText = penaltiesText,
        _penaltyShootout = penaltyShootout,
        _programmePrice = programmePrice,
        _programmePromoText = programmePromoText,
        _sponsorship = sponsorship,
        _lineupsBuilderOnOff = lineupsBuilderOnOff,
        _lineupsOnOff = lineupsOnOff,
        _overallAttendance = overallAttendance,
        _awayAttendance = awayAttendance,
        _scoreOnlyFT = scoreOnlyFT;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? 'summary';
  set summary(String? val) => _summary = val;

  bool hasSummary() => _summary != null;

  // "comp" field.
  String? _comp;
  String get comp => _comp ?? 'comp';
  set comp(String? val) => _comp = val;

  bool hasComp() => _comp != null;

  // "AwayBadge" field.
  String? _awayBadge;
  String get awayBadge => _awayBadge ?? '';
  set awayBadge(String? val) => _awayBadge = val;

  bool hasAwayBadge() => _awayBadge != null;

  // "start" field.
  int? _start;
  int get start => _start ?? 0;
  set start(int? val) => _start = val;

  void incrementStart(int amount) => start = start + amount;

  bool hasStart() => _start != null;

  // "HomeAbr" field.
  String? _homeAbr;
  String get homeAbr => _homeAbr ?? 'HOM';
  set homeAbr(String? val) => _homeAbr = val;

  bool hasHomeAbr() => _homeAbr != null;

  // "AwayTeamName" field.
  String? _awayTeamName;
  String get awayTeamName => _awayTeamName ?? 'Away';
  set awayTeamName(String? val) => _awayTeamName = val;

  bool hasAwayTeamName() => _awayTeamName != null;

  // "HomeTeamName" field.
  String? _homeTeamName;
  String get homeTeamName => _homeTeamName ?? 'Home';
  set homeTeamName(String? val) => _homeTeamName = val;

  bool hasHomeTeamName() => _homeTeamName != null;

  // "highlights" field.
  String? _highlights;
  String get highlights => _highlights ?? '';
  set highlights(String? val) => _highlights = val;

  bool hasHighlights() => _highlights != null;

  // "HomeBadge" field.
  String? _homeBadge;
  String get homeBadge => _homeBadge ?? '';
  set homeBadge(String? val) => _homeBadge = val;

  bool hasHomeBadge() => _homeBadge != null;

  // "AwayAbr" field.
  String? _awayAbr;
  String get awayAbr => _awayAbr ?? 'AWA';
  set awayAbr(String? val) => _awayAbr = val;

  bool hasAwayAbr() => _awayAbr != null;

  // "report" field.
  String? _report;
  String get report => _report ?? '';
  set report(String? val) => _report = val;

  bool hasReport() => _report != null;

  // "end" field.
  int? _end;
  int get end => _end ?? 0;
  set end(int? val) => _end = val;

  void incrementEnd(int amount) => end = end + amount;

  bool hasEnd() => _end != null;

  // "location" field.
  String? _location;
  String get location => _location ?? 'Venue Name';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "interview" field.
  String? _interview;
  String get interview => _interview ?? '';
  set interview(String? val) => _interview = val;

  bool hasInterview() => _interview != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "homeGoals" field.
  int? _homeGoals;
  int get homeGoals => _homeGoals ?? 0;
  set homeGoals(int? val) => _homeGoals = val;

  void incrementHomeGoals(int amount) => homeGoals = homeGoals + amount;

  bool hasHomeGoals() => _homeGoals != null;

  // "awayGoals" field.
  int? _awayGoals;
  int get awayGoals => _awayGoals ?? 0;
  set awayGoals(int? val) => _awayGoals = val;

  void incrementAwayGoals(int amount) => awayGoals = awayGoals + amount;

  bool hasAwayGoals() => _awayGoals != null;

  // "eventTimeline" field.
  List<LiveEventFeedItemStruct>? _eventTimeline;
  List<LiveEventFeedItemStruct> get eventTimeline => _eventTimeline ?? const [];
  set eventTimeline(List<LiveEventFeedItemStruct>? val) => _eventTimeline = val;

  void updateEventTimeline(Function(List<LiveEventFeedItemStruct>) updateFn) {
    updateFn(_eventTimeline ??= []);
  }

  bool hasEventTimeline() => _eventTimeline != null;

  // "awayTeamId" field.
  int? _awayTeamId;
  int get awayTeamId => _awayTeamId ?? 0;
  set awayTeamId(int? val) => _awayTeamId = val;

  void incrementAwayTeamId(int amount) => awayTeamId = awayTeamId + amount;

  bool hasAwayTeamId() => _awayTeamId != null;

  // "homeTeamId" field.
  int? _homeTeamId;
  int get homeTeamId => _homeTeamId ?? 0;
  set homeTeamId(int? val) => _homeTeamId = val;

  void incrementHomeTeamId(int amount) => homeTeamId = homeTeamId + amount;

  bool hasHomeTeamId() => _homeTeamId != null;

  // "programmeImageURL" field.
  String? _programmeImageURL;
  String get programmeImageURL => _programmeImageURL ?? '';
  set programmeImageURL(String? val) => _programmeImageURL = val;

  bool hasProgrammeImageURL() => _programmeImageURL != null;

  // "programmeFileURL" field.
  String? _programmeFileURL;
  String get programmeFileURL => _programmeFileURL ?? '';
  set programmeFileURL(String? val) => _programmeFileURL = val;

  bool hasProgrammeFileURL() => _programmeFileURL != null;

  // "status" field.
  String? _status;
  String get status => _status ?? 'Not Started';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "homeLineupJSON" field.
  List<PlayerJSONStruct>? _homeLineupJSON;
  List<PlayerJSONStruct> get homeLineupJSON => _homeLineupJSON ?? const [];
  set homeLineupJSON(List<PlayerJSONStruct>? val) => _homeLineupJSON = val;

  void updateHomeLineupJSON(Function(List<PlayerJSONStruct>) updateFn) {
    updateFn(_homeLineupJSON ??= []);
  }

  bool hasHomeLineupJSON() => _homeLineupJSON != null;

  // "awayLineupJSON" field.
  List<PlayerJSONStruct>? _awayLineupJSON;
  List<PlayerJSONStruct> get awayLineupJSON => _awayLineupJSON ?? const [];
  set awayLineupJSON(List<PlayerJSONStruct>? val) => _awayLineupJSON = val;

  void updateAwayLineupJSON(Function(List<PlayerJSONStruct>) updateFn) {
    updateFn(_awayLineupJSON ??= []);
  }

  bool hasAwayLineupJSON() => _awayLineupJSON != null;

  // "halfStartTimestamp" field.
  int? _halfStartTimestamp;
  int get halfStartTimestamp => _halfStartTimestamp ?? 0;
  set halfStartTimestamp(int? val) => _halfStartTimestamp = val;

  void incrementHalfStartTimestamp(int amount) =>
      halfStartTimestamp = halfStartTimestamp + amount;

  bool hasHalfStartTimestamp() => _halfStartTimestamp != null;

  // "isPostponed" field.
  bool? _isPostponed;
  bool get isPostponed => _isPostponed ?? false;
  set isPostponed(bool? val) => _isPostponed = val;

  bool hasIsPostponed() => _isPostponed != null;

  // "manualOverride" field.
  bool? _manualOverride;
  bool get manualOverride => _manualOverride ?? false;
  set manualOverride(bool? val) => _manualOverride = val;

  bool hasManualOverride() => _manualOverride != null;

  // "postponedText" field.
  String? _postponedText;
  String get postponedText => _postponedText ?? 'Postponed';
  set postponedText(String? val) => _postponedText = val;

  bool hasPostponedText() => _postponedText != null;

  // "outputStatus" field.
  String? _outputStatus;
  String get outputStatus => _outputStatus ?? 'Not Started';
  set outputStatus(String? val) => _outputStatus = val;

  bool hasOutputStatus() => _outputStatus != null;

  // "otherGames" field.
  List<SmFixtureStruct>? _otherGames;
  List<SmFixtureStruct> get otherGames => _otherGames ?? const [];
  set otherGames(List<SmFixtureStruct>? val) => _otherGames = val;

  void updateOtherGames(Function(List<SmFixtureStruct>) updateFn) {
    updateFn(_otherGames ??= []);
  }

  bool hasOtherGames() => _otherGames != null;

  // "stadiumName" field.
  String? _stadiumName;
  String get stadiumName => _stadiumName ?? '';
  set stadiumName(String? val) => _stadiumName = val;

  bool hasStadiumName() => _stadiumName != null;

  // "team" field.
  BLTeamStruct? _team;
  BLTeamStruct get team => _team ?? BLTeamStruct();
  set team(BLTeamStruct? val) => _team = val;

  void updateTeam(Function(BLTeamStruct) updateFn) {
    updateFn(_team ??= BLTeamStruct());
  }

  bool hasTeam() => _team != null;

  // "matchBackground" field.
  String? _matchBackground;
  String get matchBackground => _matchBackground ?? '';
  set matchBackground(String? val) => _matchBackground = val;

  bool hasMatchBackground() => _matchBackground != null;

  // "leagueBadgeUrl" field.
  String? _leagueBadgeUrl;
  String get leagueBadgeUrl => _leagueBadgeUrl ?? '';
  set leagueBadgeUrl(String? val) => _leagueBadgeUrl = val;

  bool hasLeagueBadgeUrl() => _leagueBadgeUrl != null;

  // "predictor" field.
  bool? _predictor;
  bool get predictor => _predictor ?? true;
  set predictor(bool? val) => _predictor = val;

  bool hasPredictor() => _predictor != null;

  // "tickets" field.
  bool? _tickets;
  bool get tickets => _tickets ?? true;
  set tickets(bool? val) => _tickets = val;

  bool hasTickets() => _tickets != null;

  // "awayPenalties" field.
  int? _awayPenalties;
  int get awayPenalties => _awayPenalties ?? 0;
  set awayPenalties(int? val) => _awayPenalties = val;

  void incrementAwayPenalties(int amount) =>
      awayPenalties = awayPenalties + amount;

  bool hasAwayPenalties() => _awayPenalties != null;

  // "homePenalties" field.
  int? _homePenalties;
  int get homePenalties => _homePenalties ?? 0;
  set homePenalties(int? val) => _homePenalties = val;

  void incrementHomePenalties(int amount) =>
      homePenalties = homePenalties + amount;

  bool hasHomePenalties() => _homePenalties != null;

  // "awayPenaltyBreakdown" field.
  String? _awayPenaltyBreakdown;
  String get awayPenaltyBreakdown => _awayPenaltyBreakdown ?? 'MMMMM';
  set awayPenaltyBreakdown(String? val) => _awayPenaltyBreakdown = val;

  bool hasAwayPenaltyBreakdown() => _awayPenaltyBreakdown != null;

  // "homePenaltyBreakdown" field.
  String? _homePenaltyBreakdown;
  String get homePenaltyBreakdown => _homePenaltyBreakdown ?? 'MMMMM';
  set homePenaltyBreakdown(String? val) => _homePenaltyBreakdown = val;

  bool hasHomePenaltyBreakdown() => _homePenaltyBreakdown != null;

  // "penaltiesText" field.
  String? _penaltiesText;
  String get penaltiesText => _penaltiesText ?? '';
  set penaltiesText(String? val) => _penaltiesText = val;

  bool hasPenaltiesText() => _penaltiesText != null;

  // "penaltyShootout" field.
  bool? _penaltyShootout;
  bool get penaltyShootout => _penaltyShootout ?? false;
  set penaltyShootout(bool? val) => _penaltyShootout = val;

  bool hasPenaltyShootout() => _penaltyShootout != null;

  // "programmePrice" field.
  double? _programmePrice;
  double get programmePrice => _programmePrice ?? 0.0;
  set programmePrice(double? val) => _programmePrice = val;

  void incrementProgrammePrice(double amount) =>
      programmePrice = programmePrice + amount;

  bool hasProgrammePrice() => _programmePrice != null;

  // "programmePromoText" field.
  String? _programmePromoText;
  String get programmePromoText => _programmePromoText ?? '';
  set programmePromoText(String? val) => _programmePromoText = val;

  bool hasProgrammePromoText() => _programmePromoText != null;

  // "sponsorship" field.
  List<SponsorshipDealsStruct>? _sponsorship;
  List<SponsorshipDealsStruct> get sponsorship => _sponsorship ?? const [];
  set sponsorship(List<SponsorshipDealsStruct>? val) => _sponsorship = val;

  void updateSponsorship(Function(List<SponsorshipDealsStruct>) updateFn) {
    updateFn(_sponsorship ??= []);
  }

  bool hasSponsorship() => _sponsorship != null;

  // "lineupsBuilderOnOff" field.
  bool? _lineupsBuilderOnOff;
  bool get lineupsBuilderOnOff => _lineupsBuilderOnOff ?? true;
  set lineupsBuilderOnOff(bool? val) => _lineupsBuilderOnOff = val;

  bool hasLineupsBuilderOnOff() => _lineupsBuilderOnOff != null;

  // "lineupsOnOff" field.
  bool? _lineupsOnOff;
  bool get lineupsOnOff => _lineupsOnOff ?? true;
  set lineupsOnOff(bool? val) => _lineupsOnOff = val;

  bool hasLineupsOnOff() => _lineupsOnOff != null;

  // "overallAttendance" field.
  int? _overallAttendance;
  int get overallAttendance => _overallAttendance ?? 0;
  set overallAttendance(int? val) => _overallAttendance = val;

  void incrementOverallAttendance(int amount) =>
      overallAttendance = overallAttendance + amount;

  bool hasOverallAttendance() => _overallAttendance != null;

  // "awayAttendance" field.
  int? _awayAttendance;
  int get awayAttendance => _awayAttendance ?? 0;
  set awayAttendance(int? val) => _awayAttendance = val;

  void incrementAwayAttendance(int amount) =>
      awayAttendance = awayAttendance + amount;

  bool hasAwayAttendance() => _awayAttendance != null;

  // "scoreOnlyFT" field.
  bool? _scoreOnlyFT;
  bool get scoreOnlyFT => _scoreOnlyFT ?? false;
  set scoreOnlyFT(bool? val) => _scoreOnlyFT = val;

  bool hasScoreOnlyFT() => _scoreOnlyFT != null;

  static BLESSfixtureStruct fromMap(Map<String, dynamic> data) =>
      BLESSfixtureStruct(
        summary: data['summary'] as String?,
        comp: data['comp'] as String?,
        awayBadge: data['AwayBadge'] as String?,
        start: castToType<int>(data['start']),
        homeAbr: data['HomeAbr'] as String?,
        awayTeamName: data['AwayTeamName'] as String?,
        homeTeamName: data['HomeTeamName'] as String?,
        highlights: data['highlights'] as String?,
        homeBadge: data['HomeBadge'] as String?,
        awayAbr: data['AwayAbr'] as String?,
        report: data['report'] as String?,
        end: castToType<int>(data['end']),
        location: data['location'] as String?,
        interview: data['interview'] as String?,
        objectId: data['objectId'] as String?,
        homeGoals: castToType<int>(data['homeGoals']),
        awayGoals: castToType<int>(data['awayGoals']),
        eventTimeline: getStructList(
          data['eventTimeline'],
          LiveEventFeedItemStruct.fromMap,
        ),
        awayTeamId: castToType<int>(data['awayTeamId']),
        homeTeamId: castToType<int>(data['homeTeamId']),
        programmeImageURL: data['programmeImageURL'] as String?,
        programmeFileURL: data['programmeFileURL'] as String?,
        status: data['status'] as String?,
        homeLineupJSON: getStructList(
          data['homeLineupJSON'],
          PlayerJSONStruct.fromMap,
        ),
        awayLineupJSON: getStructList(
          data['awayLineupJSON'],
          PlayerJSONStruct.fromMap,
        ),
        halfStartTimestamp: castToType<int>(data['halfStartTimestamp']),
        isPostponed: data['isPostponed'] as bool?,
        manualOverride: data['manualOverride'] as bool?,
        postponedText: data['postponedText'] as String?,
        outputStatus: data['outputStatus'] as String?,
        otherGames: getStructList(
          data['otherGames'],
          SmFixtureStruct.fromMap,
        ),
        stadiumName: data['stadiumName'] as String?,
        team: data['team'] is BLTeamStruct
            ? data['team']
            : BLTeamStruct.maybeFromMap(data['team']),
        matchBackground: data['matchBackground'] as String?,
        leagueBadgeUrl: data['leagueBadgeUrl'] as String?,
        predictor: data['predictor'] as bool?,
        tickets: data['tickets'] as bool?,
        awayPenalties: castToType<int>(data['awayPenalties']),
        homePenalties: castToType<int>(data['homePenalties']),
        awayPenaltyBreakdown: data['awayPenaltyBreakdown'] as String?,
        homePenaltyBreakdown: data['homePenaltyBreakdown'] as String?,
        penaltiesText: data['penaltiesText'] as String?,
        penaltyShootout: data['penaltyShootout'] as bool?,
        programmePrice: castToType<double>(data['programmePrice']),
        programmePromoText: data['programmePromoText'] as String?,
        sponsorship: getStructList(
          data['sponsorship'],
          SponsorshipDealsStruct.fromMap,
        ),
        lineupsBuilderOnOff: data['lineupsBuilderOnOff'] as bool?,
        lineupsOnOff: data['lineupsOnOff'] as bool?,
        overallAttendance: castToType<int>(data['overallAttendance']),
        awayAttendance: castToType<int>(data['awayAttendance']),
        scoreOnlyFT: data['scoreOnlyFT'] as bool?,
      );

  static BLESSfixtureStruct? maybeFromMap(dynamic data) => data is Map
      ? BLESSfixtureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'summary': _summary,
        'comp': _comp,
        'AwayBadge': _awayBadge,
        'start': _start,
        'HomeAbr': _homeAbr,
        'AwayTeamName': _awayTeamName,
        'HomeTeamName': _homeTeamName,
        'highlights': _highlights,
        'HomeBadge': _homeBadge,
        'AwayAbr': _awayAbr,
        'report': _report,
        'end': _end,
        'location': _location,
        'interview': _interview,
        'objectId': _objectId,
        'homeGoals': _homeGoals,
        'awayGoals': _awayGoals,
        'eventTimeline': _eventTimeline?.map((e) => e.toMap()).toList(),
        'awayTeamId': _awayTeamId,
        'homeTeamId': _homeTeamId,
        'programmeImageURL': _programmeImageURL,
        'programmeFileURL': _programmeFileURL,
        'status': _status,
        'homeLineupJSON': _homeLineupJSON?.map((e) => e.toMap()).toList(),
        'awayLineupJSON': _awayLineupJSON?.map((e) => e.toMap()).toList(),
        'halfStartTimestamp': _halfStartTimestamp,
        'isPostponed': _isPostponed,
        'manualOverride': _manualOverride,
        'postponedText': _postponedText,
        'outputStatus': _outputStatus,
        'otherGames': _otherGames?.map((e) => e.toMap()).toList(),
        'stadiumName': _stadiumName,
        'team': _team?.toMap(),
        'matchBackground': _matchBackground,
        'leagueBadgeUrl': _leagueBadgeUrl,
        'predictor': _predictor,
        'tickets': _tickets,
        'awayPenalties': _awayPenalties,
        'homePenalties': _homePenalties,
        'awayPenaltyBreakdown': _awayPenaltyBreakdown,
        'homePenaltyBreakdown': _homePenaltyBreakdown,
        'penaltiesText': _penaltiesText,
        'penaltyShootout': _penaltyShootout,
        'programmePrice': _programmePrice,
        'programmePromoText': _programmePromoText,
        'sponsorship': _sponsorship?.map((e) => e.toMap()).toList(),
        'lineupsBuilderOnOff': _lineupsBuilderOnOff,
        'lineupsOnOff': _lineupsOnOff,
        'overallAttendance': _overallAttendance,
        'awayAttendance': _awayAttendance,
        'scoreOnlyFT': _scoreOnlyFT,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'comp': serializeParam(
          _comp,
          ParamType.String,
        ),
        'AwayBadge': serializeParam(
          _awayBadge,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.int,
        ),
        'HomeAbr': serializeParam(
          _homeAbr,
          ParamType.String,
        ),
        'AwayTeamName': serializeParam(
          _awayTeamName,
          ParamType.String,
        ),
        'HomeTeamName': serializeParam(
          _homeTeamName,
          ParamType.String,
        ),
        'highlights': serializeParam(
          _highlights,
          ParamType.String,
        ),
        'HomeBadge': serializeParam(
          _homeBadge,
          ParamType.String,
        ),
        'AwayAbr': serializeParam(
          _awayAbr,
          ParamType.String,
        ),
        'report': serializeParam(
          _report,
          ParamType.String,
        ),
        'end': serializeParam(
          _end,
          ParamType.int,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'interview': serializeParam(
          _interview,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'homeGoals': serializeParam(
          _homeGoals,
          ParamType.int,
        ),
        'awayGoals': serializeParam(
          _awayGoals,
          ParamType.int,
        ),
        'eventTimeline': serializeParam(
          _eventTimeline,
          ParamType.DataStruct,
          isList: true,
        ),
        'awayTeamId': serializeParam(
          _awayTeamId,
          ParamType.int,
        ),
        'homeTeamId': serializeParam(
          _homeTeamId,
          ParamType.int,
        ),
        'programmeImageURL': serializeParam(
          _programmeImageURL,
          ParamType.String,
        ),
        'programmeFileURL': serializeParam(
          _programmeFileURL,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'homeLineupJSON': serializeParam(
          _homeLineupJSON,
          ParamType.DataStruct,
          isList: true,
        ),
        'awayLineupJSON': serializeParam(
          _awayLineupJSON,
          ParamType.DataStruct,
          isList: true,
        ),
        'halfStartTimestamp': serializeParam(
          _halfStartTimestamp,
          ParamType.int,
        ),
        'isPostponed': serializeParam(
          _isPostponed,
          ParamType.bool,
        ),
        'manualOverride': serializeParam(
          _manualOverride,
          ParamType.bool,
        ),
        'postponedText': serializeParam(
          _postponedText,
          ParamType.String,
        ),
        'outputStatus': serializeParam(
          _outputStatus,
          ParamType.String,
        ),
        'otherGames': serializeParam(
          _otherGames,
          ParamType.DataStruct,
          isList: true,
        ),
        'stadiumName': serializeParam(
          _stadiumName,
          ParamType.String,
        ),
        'team': serializeParam(
          _team,
          ParamType.DataStruct,
        ),
        'matchBackground': serializeParam(
          _matchBackground,
          ParamType.String,
        ),
        'leagueBadgeUrl': serializeParam(
          _leagueBadgeUrl,
          ParamType.String,
        ),
        'predictor': serializeParam(
          _predictor,
          ParamType.bool,
        ),
        'tickets': serializeParam(
          _tickets,
          ParamType.bool,
        ),
        'awayPenalties': serializeParam(
          _awayPenalties,
          ParamType.int,
        ),
        'homePenalties': serializeParam(
          _homePenalties,
          ParamType.int,
        ),
        'awayPenaltyBreakdown': serializeParam(
          _awayPenaltyBreakdown,
          ParamType.String,
        ),
        'homePenaltyBreakdown': serializeParam(
          _homePenaltyBreakdown,
          ParamType.String,
        ),
        'penaltiesText': serializeParam(
          _penaltiesText,
          ParamType.String,
        ),
        'penaltyShootout': serializeParam(
          _penaltyShootout,
          ParamType.bool,
        ),
        'programmePrice': serializeParam(
          _programmePrice,
          ParamType.double,
        ),
        'programmePromoText': serializeParam(
          _programmePromoText,
          ParamType.String,
        ),
        'sponsorship': serializeParam(
          _sponsorship,
          ParamType.DataStruct,
          isList: true,
        ),
        'lineupsBuilderOnOff': serializeParam(
          _lineupsBuilderOnOff,
          ParamType.bool,
        ),
        'lineupsOnOff': serializeParam(
          _lineupsOnOff,
          ParamType.bool,
        ),
        'overallAttendance': serializeParam(
          _overallAttendance,
          ParamType.int,
        ),
        'awayAttendance': serializeParam(
          _awayAttendance,
          ParamType.int,
        ),
        'scoreOnlyFT': serializeParam(
          _scoreOnlyFT,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BLESSfixtureStruct fromSerializableMap(Map<String, dynamic> data) =>
      BLESSfixtureStruct(
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        comp: deserializeParam(
          data['comp'],
          ParamType.String,
          false,
        ),
        awayBadge: deserializeParam(
          data['AwayBadge'],
          ParamType.String,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.int,
          false,
        ),
        homeAbr: deserializeParam(
          data['HomeAbr'],
          ParamType.String,
          false,
        ),
        awayTeamName: deserializeParam(
          data['AwayTeamName'],
          ParamType.String,
          false,
        ),
        homeTeamName: deserializeParam(
          data['HomeTeamName'],
          ParamType.String,
          false,
        ),
        highlights: deserializeParam(
          data['highlights'],
          ParamType.String,
          false,
        ),
        homeBadge: deserializeParam(
          data['HomeBadge'],
          ParamType.String,
          false,
        ),
        awayAbr: deserializeParam(
          data['AwayAbr'],
          ParamType.String,
          false,
        ),
        report: deserializeParam(
          data['report'],
          ParamType.String,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.int,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        interview: deserializeParam(
          data['interview'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        homeGoals: deserializeParam(
          data['homeGoals'],
          ParamType.int,
          false,
        ),
        awayGoals: deserializeParam(
          data['awayGoals'],
          ParamType.int,
          false,
        ),
        eventTimeline: deserializeStructParam<LiveEventFeedItemStruct>(
          data['eventTimeline'],
          ParamType.DataStruct,
          true,
          structBuilder: LiveEventFeedItemStruct.fromSerializableMap,
        ),
        awayTeamId: deserializeParam(
          data['awayTeamId'],
          ParamType.int,
          false,
        ),
        homeTeamId: deserializeParam(
          data['homeTeamId'],
          ParamType.int,
          false,
        ),
        programmeImageURL: deserializeParam(
          data['programmeImageURL'],
          ParamType.String,
          false,
        ),
        programmeFileURL: deserializeParam(
          data['programmeFileURL'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        homeLineupJSON: deserializeStructParam<PlayerJSONStruct>(
          data['homeLineupJSON'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerJSONStruct.fromSerializableMap,
        ),
        awayLineupJSON: deserializeStructParam<PlayerJSONStruct>(
          data['awayLineupJSON'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerJSONStruct.fromSerializableMap,
        ),
        halfStartTimestamp: deserializeParam(
          data['halfStartTimestamp'],
          ParamType.int,
          false,
        ),
        isPostponed: deserializeParam(
          data['isPostponed'],
          ParamType.bool,
          false,
        ),
        manualOverride: deserializeParam(
          data['manualOverride'],
          ParamType.bool,
          false,
        ),
        postponedText: deserializeParam(
          data['postponedText'],
          ParamType.String,
          false,
        ),
        outputStatus: deserializeParam(
          data['outputStatus'],
          ParamType.String,
          false,
        ),
        otherGames: deserializeStructParam<SmFixtureStruct>(
          data['otherGames'],
          ParamType.DataStruct,
          true,
          structBuilder: SmFixtureStruct.fromSerializableMap,
        ),
        stadiumName: deserializeParam(
          data['stadiumName'],
          ParamType.String,
          false,
        ),
        team: deserializeStructParam(
          data['team'],
          ParamType.DataStruct,
          false,
          structBuilder: BLTeamStruct.fromSerializableMap,
        ),
        matchBackground: deserializeParam(
          data['matchBackground'],
          ParamType.String,
          false,
        ),
        leagueBadgeUrl: deserializeParam(
          data['leagueBadgeUrl'],
          ParamType.String,
          false,
        ),
        predictor: deserializeParam(
          data['predictor'],
          ParamType.bool,
          false,
        ),
        tickets: deserializeParam(
          data['tickets'],
          ParamType.bool,
          false,
        ),
        awayPenalties: deserializeParam(
          data['awayPenalties'],
          ParamType.int,
          false,
        ),
        homePenalties: deserializeParam(
          data['homePenalties'],
          ParamType.int,
          false,
        ),
        awayPenaltyBreakdown: deserializeParam(
          data['awayPenaltyBreakdown'],
          ParamType.String,
          false,
        ),
        homePenaltyBreakdown: deserializeParam(
          data['homePenaltyBreakdown'],
          ParamType.String,
          false,
        ),
        penaltiesText: deserializeParam(
          data['penaltiesText'],
          ParamType.String,
          false,
        ),
        penaltyShootout: deserializeParam(
          data['penaltyShootout'],
          ParamType.bool,
          false,
        ),
        programmePrice: deserializeParam(
          data['programmePrice'],
          ParamType.double,
          false,
        ),
        programmePromoText: deserializeParam(
          data['programmePromoText'],
          ParamType.String,
          false,
        ),
        sponsorship: deserializeStructParam<SponsorshipDealsStruct>(
          data['sponsorship'],
          ParamType.DataStruct,
          true,
          structBuilder: SponsorshipDealsStruct.fromSerializableMap,
        ),
        lineupsBuilderOnOff: deserializeParam(
          data['lineupsBuilderOnOff'],
          ParamType.bool,
          false,
        ),
        lineupsOnOff: deserializeParam(
          data['lineupsOnOff'],
          ParamType.bool,
          false,
        ),
        overallAttendance: deserializeParam(
          data['overallAttendance'],
          ParamType.int,
          false,
        ),
        awayAttendance: deserializeParam(
          data['awayAttendance'],
          ParamType.int,
          false,
        ),
        scoreOnlyFT: deserializeParam(
          data['scoreOnlyFT'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BLESSfixtureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BLESSfixtureStruct &&
        summary == other.summary &&
        comp == other.comp &&
        awayBadge == other.awayBadge &&
        start == other.start &&
        homeAbr == other.homeAbr &&
        awayTeamName == other.awayTeamName &&
        homeTeamName == other.homeTeamName &&
        highlights == other.highlights &&
        homeBadge == other.homeBadge &&
        awayAbr == other.awayAbr &&
        report == other.report &&
        end == other.end &&
        location == other.location &&
        interview == other.interview &&
        objectId == other.objectId &&
        homeGoals == other.homeGoals &&
        awayGoals == other.awayGoals &&
        listEquality.equals(eventTimeline, other.eventTimeline) &&
        awayTeamId == other.awayTeamId &&
        homeTeamId == other.homeTeamId &&
        programmeImageURL == other.programmeImageURL &&
        programmeFileURL == other.programmeFileURL &&
        status == other.status &&
        listEquality.equals(homeLineupJSON, other.homeLineupJSON) &&
        listEquality.equals(awayLineupJSON, other.awayLineupJSON) &&
        halfStartTimestamp == other.halfStartTimestamp &&
        isPostponed == other.isPostponed &&
        manualOverride == other.manualOverride &&
        postponedText == other.postponedText &&
        outputStatus == other.outputStatus &&
        listEquality.equals(otherGames, other.otherGames) &&
        stadiumName == other.stadiumName &&
        team == other.team &&
        matchBackground == other.matchBackground &&
        leagueBadgeUrl == other.leagueBadgeUrl &&
        predictor == other.predictor &&
        tickets == other.tickets &&
        awayPenalties == other.awayPenalties &&
        homePenalties == other.homePenalties &&
        awayPenaltyBreakdown == other.awayPenaltyBreakdown &&
        homePenaltyBreakdown == other.homePenaltyBreakdown &&
        penaltiesText == other.penaltiesText &&
        penaltyShootout == other.penaltyShootout &&
        programmePrice == other.programmePrice &&
        programmePromoText == other.programmePromoText &&
        listEquality.equals(sponsorship, other.sponsorship) &&
        lineupsBuilderOnOff == other.lineupsBuilderOnOff &&
        lineupsOnOff == other.lineupsOnOff &&
        overallAttendance == other.overallAttendance &&
        awayAttendance == other.awayAttendance &&
        scoreOnlyFT == other.scoreOnlyFT;
  }

  @override
  int get hashCode => const ListEquality().hash([
        summary,
        comp,
        awayBadge,
        start,
        homeAbr,
        awayTeamName,
        homeTeamName,
        highlights,
        homeBadge,
        awayAbr,
        report,
        end,
        location,
        interview,
        objectId,
        homeGoals,
        awayGoals,
        eventTimeline,
        awayTeamId,
        homeTeamId,
        programmeImageURL,
        programmeFileURL,
        status,
        homeLineupJSON,
        awayLineupJSON,
        halfStartTimestamp,
        isPostponed,
        manualOverride,
        postponedText,
        outputStatus,
        otherGames,
        stadiumName,
        team,
        matchBackground,
        leagueBadgeUrl,
        predictor,
        tickets,
        awayPenalties,
        homePenalties,
        awayPenaltyBreakdown,
        homePenaltyBreakdown,
        penaltiesText,
        penaltyShootout,
        programmePrice,
        programmePromoText,
        sponsorship,
        lineupsBuilderOnOff,
        lineupsOnOff,
        overallAttendance,
        awayAttendance,
        scoreOnlyFT
      ]);
}

BLESSfixtureStruct createBLESSfixtureStruct({
  String? summary,
  String? comp,
  String? awayBadge,
  int? start,
  String? homeAbr,
  String? awayTeamName,
  String? homeTeamName,
  String? highlights,
  String? homeBadge,
  String? awayAbr,
  String? report,
  int? end,
  String? location,
  String? interview,
  String? objectId,
  int? homeGoals,
  int? awayGoals,
  int? awayTeamId,
  int? homeTeamId,
  String? programmeImageURL,
  String? programmeFileURL,
  String? status,
  int? halfStartTimestamp,
  bool? isPostponed,
  bool? manualOverride,
  String? postponedText,
  String? outputStatus,
  String? stadiumName,
  BLTeamStruct? team,
  String? matchBackground,
  String? leagueBadgeUrl,
  bool? predictor,
  bool? tickets,
  int? awayPenalties,
  int? homePenalties,
  String? awayPenaltyBreakdown,
  String? homePenaltyBreakdown,
  String? penaltiesText,
  bool? penaltyShootout,
  double? programmePrice,
  String? programmePromoText,
  bool? lineupsBuilderOnOff,
  bool? lineupsOnOff,
  int? overallAttendance,
  int? awayAttendance,
  bool? scoreOnlyFT,
}) =>
    BLESSfixtureStruct(
      summary: summary,
      comp: comp,
      awayBadge: awayBadge,
      start: start,
      homeAbr: homeAbr,
      awayTeamName: awayTeamName,
      homeTeamName: homeTeamName,
      highlights: highlights,
      homeBadge: homeBadge,
      awayAbr: awayAbr,
      report: report,
      end: end,
      location: location,
      interview: interview,
      objectId: objectId,
      homeGoals: homeGoals,
      awayGoals: awayGoals,
      awayTeamId: awayTeamId,
      homeTeamId: homeTeamId,
      programmeImageURL: programmeImageURL,
      programmeFileURL: programmeFileURL,
      status: status,
      halfStartTimestamp: halfStartTimestamp,
      isPostponed: isPostponed,
      manualOverride: manualOverride,
      postponedText: postponedText,
      outputStatus: outputStatus,
      stadiumName: stadiumName,
      team: team ?? BLTeamStruct(),
      matchBackground: matchBackground,
      leagueBadgeUrl: leagueBadgeUrl,
      predictor: predictor,
      tickets: tickets,
      awayPenalties: awayPenalties,
      homePenalties: homePenalties,
      awayPenaltyBreakdown: awayPenaltyBreakdown,
      homePenaltyBreakdown: homePenaltyBreakdown,
      penaltiesText: penaltiesText,
      penaltyShootout: penaltyShootout,
      programmePrice: programmePrice,
      programmePromoText: programmePromoText,
      lineupsBuilderOnOff: lineupsBuilderOnOff,
      lineupsOnOff: lineupsOnOff,
      overallAttendance: overallAttendance,
      awayAttendance: awayAttendance,
      scoreOnlyFT: scoreOnlyFT,
    );
