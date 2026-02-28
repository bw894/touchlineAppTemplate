import 'package:test/test.dart';
import 'package:api_client/api_client.dart';

void main() {
  // ---------------------------------------------------------------------------
  // UserStruct
  // ---------------------------------------------------------------------------
  group('UserStruct', () {
    test('toMap / fromMap round-trip', () {
      final original = UserStruct(
        email: 'fan@club.com',
        name: 'Test Fan',
        ownerId: 'owner-123',
        objectId: 'obj-456',
        created: 1700000000,
        userToken: 'tok-abc',
        category: 'adult',
        age: '30',
        company: 'ACME',
        gender: 'M',
        location: 'London',
        marketing: true,
        obsNumber: 7,
        publicName: false,
        mobile: '+44123456789',
      );

      final map = original.toMap();
      final restored = UserStruct.fromMap(map);
      expect(restored, equals(original));
    });

    test('toSerializableMap / fromSerializableMap round-trip', () {
      final original = UserStruct(
        email: 'fan@club.com',
        name: 'Test Fan',
        ownerId: 'owner-123',
        objectId: 'obj-456',
        created: 1700000000,
        userToken: 'tok-abc',
        marketing: false,
        publicName: true,
        obsNumber: 3,
      );

      final map = original.toSerializableMap();
      final restored = UserStruct.fromSerializableMap(map);
      expect(restored, equals(original));
    });

    test('null fields serialise as absent keys', () {
      final s = UserStruct(email: 'a@b.com');
      final map = s.toMap();
      expect(map.containsKey('name'), isFalse);
      expect(map['email'], equals('a@b.com'));
    });
  });

  // ---------------------------------------------------------------------------
  // PlayerStruct
  // ---------------------------------------------------------------------------
  group('PlayerStruct', () {
    test('toMap / fromMap round-trip (scalar fields)', () {
      final original = PlayerStruct(
        playerName: 'John Doe',
        position: 'GK',
        posAbr: 'GK',
        number: 1,
        goals: 0,
        assists: 0,
        apps: 30,
        reds: 0,
        yellows: 2,
        objectId: 'player-001',
        ownerId: 'team-abc',
        created: 1700000000,
        updated: 1710000000,
        dateOfBirth: '1990-05-15',
        showInGame: true,
        showInSquadHub: true,
        biography: 'Solid keeper.',
        email: 'jdoe@club.com',
      );

      final map = original.toMap();
      final restored = PlayerStruct.fromMap(map);
      expect(restored, equals(original));
    });

    test('toSerializableMap / fromSerializableMap round-trip', () {
      final original = PlayerStruct(
        playerName: 'Jane Smith',
        position: 'FW',
        number: 9,
        goals: 15,
        apps: 25,
      );

      final map = original.toSerializableMap();
      final restored = PlayerStruct.fromSerializableMap(map);
      expect(restored, equals(original));
    });
  });

  // ---------------------------------------------------------------------------
  // CartLinesStruct
  // ---------------------------------------------------------------------------
  group('CartLinesStruct', () {
    test('toMap / fromMap round-trip', () {
      final original = CartLinesStruct(
        qty: 2,
        title: 'Club Shirt',
        type: 'physical',
        productId: 'prod-99',
        itemTotal: 49.99,
        lineTotal: 99.98,
        lineTax: 16.66,
        itemTax: 8.33,
        productImage: 'https://cdn.example.com/shirt.png',
        onSale: false,
        regularItemPrice: 55.00,
        sizeObjectId: 'size-L',
        sizeTitle: 'Large',
      );

      final map = original.toMap();
      final restored = CartLinesStruct.fromMap(map);
      expect(restored, equals(original));
    });

    test('toSerializableMap / fromSerializableMap round-trip', () {
      final original = CartLinesStruct(
        qty: 1,
        title: 'Season Ticket',
        itemTotal: 250.00,
        lineTotal: 250.00,
      );

      final map = original.toSerializableMap();
      final restored = CartLinesStruct.fromSerializableMap(map);
      expect(restored, equals(original));
    });
  });

  // ---------------------------------------------------------------------------
  // SmFixtureStruct
  // ---------------------------------------------------------------------------
  group('SmFixtureStruct', () {
    test('toMap / fromMap round-trip (scalar fields)', () {
      final original = SmFixtureStruct(
        id: 42,
        leg: 'final',
        name: 'Home vs Away',
        details: 'Premier League',
        groupId: 'grp-1',
        hasOdds: true,
        roundId: 5,
        sportId: 1,
        stageId: 10,
        stateId: 3,
        venueId: 7,
        leagueId: 2,
        seasonId: 2025,
        placeholder: false,
        resultInfo: '2-1',
        startingAt: '2025-08-10 15:00:00',
        hasPremiumOdds: false,
        startingAtTimestamp: 1754913600,
      );

      final map = original.toMap();
      final restored = SmFixtureStruct.fromMap(map);
      expect(restored, equals(original));
    });

    test('empty struct round-trip', () {
      final original = SmFixtureStruct();
      final map = original.toMap();
      final restored = SmFixtureStruct.fromMap(map);
      expect(restored, equals(original));
    });
  });

  // ---------------------------------------------------------------------------
  // LeagueTableItemStruct
  // ---------------------------------------------------------------------------
  group('LeagueTableItemStruct', () {
    test('toMap / fromMap round-trip', () {
      final original = LeagueTableItemStruct(
        rank: 1,
        name: 'Top Club FC',
        goalDiff: 20,
        imageURL: 'https://cdn.example.com/badge.png',
        played: 10,
        points: 28,
        trend: 'up',
        homeMatchesPlayed: 5,
        homePoints: 15,
        homeWins: 5,
        homeDraws: 0,
        homeLost: 0,
        homeGoalsScored: 12,
        homeGoalsConceded: 2,
        awayMatchesPlayed: 5,
        awayPoints: 13,
        awayWins: 4,
        awayDraws: 1,
        awayLost: 0,
        awayGoalsScored: 10,
        awayGoalsConceded: 3,
        overallMatchesPlayed: 10,
        overallWins: 9,
      );

      final map = original.toMap();
      final restored = LeagueTableItemStruct.fromMap(map);
      expect(restored, equals(original));
    });

    test('toSerializableMap / fromSerializableMap round-trip', () {
      final original = LeagueTableItemStruct(
        rank: 3,
        name: 'Mid Table CF',
        points: 15,
        played: 10,
      );

      final map = original.toSerializableMap();
      final restored = LeagueTableItemStruct.fromSerializableMap(map);
      expect(restored, equals(original));
    });
  });

  // ---------------------------------------------------------------------------
  // PredictorTableItemStruct
  // ---------------------------------------------------------------------------
  group('PredictorTableItemStruct', () {
    test('toMap / fromMap round-trip', () {
      final original = PredictorTableItemStruct(
        positional: '1st',
        rank: 1,
        gamesPlayed: 20,
        totalPoints: 42,
        email: 'predictor@club.com',
        name: 'Top Predictor',
        uid: 'uid-555',
      );

      final map = original.toMap();
      final restored = PredictorTableItemStruct.fromMap(map);
      expect(restored, equals(original));
    });

    test('toSerializableMap / fromSerializableMap round-trip', () {
      final original = PredictorTableItemStruct(
        rank: 5,
        totalPoints: 18,
        name: 'Mid Predictor',
      );

      final map = original.toSerializableMap();
      final restored = PredictorTableItemStruct.fromSerializableMap(map);
      expect(restored, equals(original));
    });

    test('default values are correct', () {
      final s = PredictorTableItemStruct();
      expect(s.positional, equals(''));
      expect(s.rank, equals(0));
      expect(s.gamesPlayed, equals(0));
      expect(s.totalPoints, equals(0));
      expect(s.email, equals(''));
      expect(s.name, equals(''));
      expect(s.uid, equals(''));
    });
  });
}
