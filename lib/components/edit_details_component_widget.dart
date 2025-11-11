import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_details_component_model.dart';
export 'edit_details_component_model.dart';

class EditDetailsComponentWidget extends StatefulWidget {
  const EditDetailsComponentWidget({super.key});

  @override
  State<EditDetailsComponentWidget> createState() =>
      _EditDetailsComponentWidgetState();
}

class _EditDetailsComponentWidgetState
    extends State<EditDetailsComponentWidget> {
  late EditDetailsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditDetailsComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..name = _model.textController1.text,
            ),
        );
        safeSetState(() {});
      },
    );
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..phone = _model.textController2.text,
            ),
        );
      },
    );
    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode3!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..email = _model.textController3.text,
            ),
        );
      },
    );
    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    _model.textFieldFocusNode4!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..address1 = _model.textController4.text,
            ),
        );
      },
    );
    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
    _model.textFieldFocusNode5!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..address2 = _model.textController5.text,
            ),
        );
      },
    );
    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();
    _model.textFieldFocusNode6!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..city = _model.textController6.text,
            ),
        );
      },
    );
    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();
    _model.textFieldFocusNode7!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..postcode = _model.textController7.text,
            ),
        );
      },
    );
    _model.textController8 ??= TextEditingController(text: 'United Kingdom');
    _model.textFieldFocusNode8 ??= FocusNode();
    _model.textFieldFocusNode8!.addListener(
      () async {
        FFAppState().updateCheckoutStruct(
          (e) => e
            ..updateBillingDetails(
              (e) => e..country = _model.textController8.text,
            ),
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 17.0, 20.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.west_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EDIT DETAILS',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Opacity(
                            opacity: 0.0,
                            child: Icon(
                              Icons.west_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 13.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            'Full Name',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            onFieldSubmitted: (_) async {
                              FFAppState().updateCheckoutStruct(
                                (e) => e
                                  ..updateBillingDetails(
                                    (e) =>
                                        e..name = _model.textController1.text,
                                  ),
                              );
                              safeSetState(() {});
                            },
                            autofocus: true,
                            autofillHints: [AutofillHints.name],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'John Doe',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            'Phone Number',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            onFieldSubmitted: (_) async {
                              FFAppState().updateCheckoutStruct(
                                (e) => e
                                  ..updateBillingDetails(
                                    (e) =>
                                        e..phone = _model.textController2.text,
                                  ),
                              );
                            },
                            autofocus: true,
                            autofillHints: [AutofillHints.telephoneNumber],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: '01234 567890',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            keyboardType: TextInputType.phone,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController2Validator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            'Email Address',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode3,
                            onFieldSubmitted: (_) async {
                              FFAppState().updateCheckoutStruct(
                                (e) => e
                                  ..updateBillingDetails(
                                    (e) =>
                                        e..email = _model.textController3.text,
                                  ),
                              );
                            },
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'john.doe@gmail.com',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            'Billing Address',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.textController4,
                              focusNode: _model.textFieldFocusNode4,
                              onFieldSubmitted: (_) async {
                                FFAppState().updateCheckoutStruct(
                                  (e) => e
                                    ..updateBillingDetails(
                                      (e) => e
                                        ..address1 =
                                            _model.textController4.text,
                                    ),
                                );
                              },
                              autofocus: true,
                              autofillHints: [AutofillHints.streetAddressLine1],
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Address Line 1',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              keyboardType: TextInputType.streetAddress,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController4Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.textController5,
                            focusNode: _model.textFieldFocusNode5,
                            onFieldSubmitted: (_) async {
                              FFAppState().updateCheckoutStruct(
                                (e) => e
                                  ..updateBillingDetails(
                                    (e) => e
                                      ..address2 = _model.textController5.text,
                                  ),
                              );
                            },
                            autofocus: true,
                            autofillHints: [AutofillHints.streetAddressLine2],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText:
                                  'Building, Apartment, Floor Number (Optional)',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            keyboardType: TextInputType.streetAddress,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController5Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 6.0),
                                child: Text(
                                  'Town/City',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: TextFormField(
                                  controller: _model.textController6,
                                  focusNode: _model.textFieldFocusNode6,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().updateCheckoutStruct(
                                      (e) => e
                                        ..updateBillingDetails(
                                          (e) => e
                                            ..city =
                                                _model.textController6.text,
                                        ),
                                    );
                                  },
                                  autofocus: true,
                                  autofillHints: [AutofillHints.addressCity],
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'London',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  keyboardType: TextInputType.streetAddress,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController6Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 6.0),
                                child: Text(
                                  'Postcode',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: TextFormField(
                                  controller: _model.textController7,
                                  focusNode: _model.textFieldFocusNode7,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().updateCheckoutStruct(
                                      (e) => e
                                        ..updateBillingDetails(
                                          (e) => e
                                            ..postcode =
                                                _model.textController7.text,
                                        ),
                                    );
                                  },
                                  autofocus: true,
                                  autofillHints: [AutofillHints.postalCode],
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'SW1 0AA',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  keyboardType: TextInputType.streetAddress,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController7Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Country',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: TextFormField(
                          controller: _model.textController8,
                          focusNode: _model.textFieldFocusNode8,
                          onFieldSubmitted: (_) async {
                            FFAppState().updateCheckoutStruct(
                              (e) => e
                                ..updateBillingDetails(
                                  (e) =>
                                      e..country = _model.textController8.text,
                                ),
                            );
                          },
                          autofocus: true,
                          autofillHints: [AutofillHints.telephoneNumber],
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'United Kingdom',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          keyboardType: TextInputType.phone,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController8Validator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.safePop();
                      },
                      text: 'Done',
                      icon: Icon(
                        Icons.check_sharp,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconAlignment: IconAlignment.start,
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
