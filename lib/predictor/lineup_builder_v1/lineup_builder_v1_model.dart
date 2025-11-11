import '/backend/api_requests/api_calls.dart';
import '/components/lineup_builder_component_widget.dart';
import '/components/view_lineups_builder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'lineup_builder_v1_widget.dart' show LineupBuilderV1Widget;
import 'package:flutter/material.dart';

class LineupBuilderV1Model extends FlutterFlowModel<LineupBuilderV1Widget> {
  ///  Local state fields for this component.

  List<int> positionMap = [1, 4, 0, 4, 0, 2];
  void addToPositionMap(int item) => positionMap.add(item);
  void removeFromPositionMap(int item) => positionMap.remove(item);
  void removeAtIndexFromPositionMap(int index) => positionMap.removeAt(index);
  void insertAtIndexInPositionMap(int index, int item) =>
      positionMap.insert(index, item);
  void updatePositionMapAtIndex(int index, Function(int) updateFn) =>
      positionMap[index] = updateFn(positionMap[index]);

  List<int> cumulativeListMap = [1, 5, 5, 9, 9, 11];
  void addToCumulativeListMap(int item) => cumulativeListMap.add(item);
  void removeFromCumulativeListMap(int item) => cumulativeListMap.remove(item);
  void removeAtIndexFromCumulativeListMap(int index) =>
      cumulativeListMap.removeAt(index);
  void insertAtIndexInCumulativeListMap(int index, int item) =>
      cumulativeListMap.insert(index, item);
  void updateCumulativeListMapAtIndex(int index, Function(int) updateFn) =>
      cumulativeListMap[index] = updateFn(cumulativeListMap[index]);

  int current = 0;

  String? existingObjectId;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel1;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel2;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel3;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel4;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel5;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel6;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel7;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel8;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel9;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel10;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel11;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel12;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel13;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel14;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel15;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel16;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel17;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel18;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel19;
  // Model for lineupBuilderComponent component.
  late LineupBuilderComponentModel lineupBuilderComponentModel20;
  // Model for viewLineupsBuilder component.
  late ViewLineupsBuilderModel viewLineupsBuilderModel;
  // Stores action output result for [Backend Call - API (Add Lineups Builder Entry)] action in Button widget.
  ApiCallResponse? addEntry;
  // Stores action output result for [Backend Call - API (Add Match to Lineups Builder Entry)] action in Button widget.
  ApiCallResponse? apiResulty6t;

  @override
  void initState(BuildContext context) {
    lineupBuilderComponentModel1 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel2 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel3 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel4 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel5 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel6 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel7 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel8 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel9 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel10 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel11 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel12 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel13 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel14 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel15 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel16 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel17 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel18 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel19 =
        createModel(context, () => LineupBuilderComponentModel());
    lineupBuilderComponentModel20 =
        createModel(context, () => LineupBuilderComponentModel());
    viewLineupsBuilderModel =
        createModel(context, () => ViewLineupsBuilderModel());
  }

  @override
  void dispose() {
    lineupBuilderComponentModel1.dispose();
    lineupBuilderComponentModel2.dispose();
    lineupBuilderComponentModel3.dispose();
    lineupBuilderComponentModel4.dispose();
    lineupBuilderComponentModel5.dispose();
    lineupBuilderComponentModel6.dispose();
    lineupBuilderComponentModel7.dispose();
    lineupBuilderComponentModel8.dispose();
    lineupBuilderComponentModel9.dispose();
    lineupBuilderComponentModel10.dispose();
    lineupBuilderComponentModel11.dispose();
    lineupBuilderComponentModel12.dispose();
    lineupBuilderComponentModel13.dispose();
    lineupBuilderComponentModel14.dispose();
    lineupBuilderComponentModel15.dispose();
    lineupBuilderComponentModel16.dispose();
    lineupBuilderComponentModel17.dispose();
    lineupBuilderComponentModel18.dispose();
    lineupBuilderComponentModel19.dispose();
    lineupBuilderComponentModel20.dispose();
    viewLineupsBuilderModel.dispose();
  }
}
