import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'indiv_penalty_model.dart';
export 'indiv_penalty_model.dart';

class IndivPenaltyWidget extends StatefulWidget {
  const IndivPenaltyWidget({
    super.key,
    String? inputLetter,
  }) : this.inputLetter = inputLetter ?? 'M';

  final String inputLetter;

  @override
  State<IndivPenaltyWidget> createState() => _IndivPenaltyWidgetState();
}

class _IndivPenaltyWidgetState extends State<IndivPenaltyWidget> {
  late IndivPenaltyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndivPenaltyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.inputLetter == 'Y')
              Icon(
                Icons.check_circle,
                color: FlutterFlowTheme.of(context).success,
                size: 18.0,
              ),
            if (widget.inputLetter == 'N')
              Icon(
                Icons.cancel,
                color: FlutterFlowTheme.of(context).error,
                size: 18.0,
              ),
            if (widget.inputLetter == 'M')
              Icon(
                Icons.circle_outlined,
                color: Color(0xFF929292),
                size: 18.0,
              ),
          ],
        ),
      ),
    );
  }
}
