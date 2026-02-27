import '/backend/api_requests/api_calls.dart';
import '/components/view_lineups_builder_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'view_lineups_builder_widget.dart' show ViewLineupsBuilderWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewLineupsBuilderModel
    extends FlutterFlowModel<ViewLineupsBuilderWidget> {
  ///  Local state fields for this component.

  List<int> playerMap = [1, 4, 0, 4, 0, 2];
  void addToPlayerMap(int item) => playerMap.add(item);
  void removeFromPlayerMap(int item) => playerMap.remove(item);
  void removeAtIndexFromPlayerMap(int index) => playerMap.removeAt(index);
  void insertAtIndexInPlayerMap(int index, int item) =>
      playerMap.insert(index, item);
  void updatePlayerMapAtIndex(int index, Function(int) updateFn) =>
      playerMap[index] = updateFn(playerMap[index]);

  List<int> cumulativePlayerMap = [1, 5, 5, 9, 9, 11];
  void addToCumulativePlayerMap(int item) => cumulativePlayerMap.add(item);
  void removeFromCumulativePlayerMap(int item) =>
      cumulativePlayerMap.remove(item);
  void removeAtIndexFromCumulativePlayerMap(int index) =>
      cumulativePlayerMap.removeAt(index);
  void insertAtIndexInCumulativePlayerMap(int index, int item) =>
      cumulativePlayerMap.insert(index, item);
  void updateCumulativePlayerMapAtIndex(int index, Function(int) updateFn) =>
      cumulativePlayerMap[index] = updateFn(cumulativePlayerMap[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Lineups Builder Entry by ID)] action in viewLineupsBuilder widget.
  ApiCallResponse? apiResultarm;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel1;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel2;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel3;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel4;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel5;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel6;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel7;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel8;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel9;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel10;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel11;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel12;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel13;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel14;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel15;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel16;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel17;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel18;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel19;
  // Model for viewLineupsBuilderPlayer component.
  late ViewLineupsBuilderPlayerModel viewLineupsBuilderPlayerModel20;

  @override
  void initState(BuildContext context) {
    viewLineupsBuilderPlayerModel1 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel2 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel3 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel4 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel5 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel6 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel7 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel8 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel9 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel10 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel11 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel12 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel13 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel14 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel15 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel16 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel17 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel18 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel19 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
    viewLineupsBuilderPlayerModel20 =
        createModel(context, () => ViewLineupsBuilderPlayerModel());
  }

  @override
  void dispose() {
    viewLineupsBuilderPlayerModel1.dispose();
    viewLineupsBuilderPlayerModel2.dispose();
    viewLineupsBuilderPlayerModel3.dispose();
    viewLineupsBuilderPlayerModel4.dispose();
    viewLineupsBuilderPlayerModel5.dispose();
    viewLineupsBuilderPlayerModel6.dispose();
    viewLineupsBuilderPlayerModel7.dispose();
    viewLineupsBuilderPlayerModel8.dispose();
    viewLineupsBuilderPlayerModel9.dispose();
    viewLineupsBuilderPlayerModel10.dispose();
    viewLineupsBuilderPlayerModel11.dispose();
    viewLineupsBuilderPlayerModel12.dispose();
    viewLineupsBuilderPlayerModel13.dispose();
    viewLineupsBuilderPlayerModel14.dispose();
    viewLineupsBuilderPlayerModel15.dispose();
    viewLineupsBuilderPlayerModel16.dispose();
    viewLineupsBuilderPlayerModel17.dispose();
    viewLineupsBuilderPlayerModel18.dispose();
    viewLineupsBuilderPlayerModel19.dispose();
    viewLineupsBuilderPlayerModel20.dispose();
  }
}
