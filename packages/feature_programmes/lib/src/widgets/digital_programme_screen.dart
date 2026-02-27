import 'dart:ui';

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Digital programme product page.
///
/// Shows the match programme image hero, price, a quantity counter, a customer
/// details form (name + email), an optional physical copy delivery request
/// (phone + address), and a purchase button.
///
/// Ported from [DigitalProgrammeProductPageWidget] in
/// `lib/programmes/digital_programme_product_page/`.
class DigitalProgrammeScreen extends ConsumerStatefulWidget {
  const DigitalProgrammeScreen({
    super.key,
    required this.matchObjectId,
    required this.matchSummary,
    required this.projectId,
    required this.restApiKey,
    required this.userToken,
  });

  final String matchObjectId;
  final String matchSummary;
  final String projectId;
  final String restApiKey;
  final String userToken;

  @override
  ConsumerState<DigitalProgrammeScreen> createState() =>
      _DigitalProgrammeScreenState();
}

class _DigitalProgrammeScreenState
    extends ConsumerState<DigitalProgrammeScreen> {
  int _qty = 1;
  bool _physicalCopy = false;

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postcode = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phone.dispose();
    _address.dispose();
    _city.dispose();
    _postcode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cfg = ref.watch(appConfigProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: FutureBuilder<ApiCallResponse>(
          future: BackendlessDatabaseGroup.getSpecificFixtureCall.call(
            objectId: widget.matchObjectId,
            bLProjectId: widget.projectId,
            bLRestAPIKey: widget.restApiKey,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SpinKitWanderingCubes(
                  color: theme.colorScheme.primary,
                  size: 50.0,
                ),
              );
            }
            final fixture = BLESSfixtureStruct.maybeFromMap(
                snapshot.data!.jsonBody);

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------------------------------------------------------
                  // Hero header — 325px with blurred caption strip
                  // -------------------------------------------------------
                  SizedBox(
                    height: 325.0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          fixture?.programmeImageURL ?? '',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: theme.colorScheme.surfaceContainerHighest,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Back button row
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.85, -0.4),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 50.0, 0.0, 0.0),
                                      child: GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).maybePop(),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0x7F0F1113),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.chevron_left_rounded,
                                            color: Colors.white,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Blurred caption strip
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 7.0, sigmaY: 6.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Color(0x31000000),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24.0, 20.0, 24.0, 0.0),
                                          child: Text(
                                            widget.matchSummary,
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24.0, 0.0, 24.0, 0.0),
                                          child: Text(
                                            'Digital Programme',
                                            textAlign: TextAlign.start,
                                            style: theme.textTheme.titleSmall
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // -------------------------------------------------------
                  // Price row + qty counter
                  // -------------------------------------------------------
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 16.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '£4.00',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 156.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: const Color(0x00E0E3E7),
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: _qty > 1
                                    ? () => setState(() => _qty--)
                                    : null,
                                icon: FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: _qty > 1
                                      ? theme.colorScheme.primary
                                      : const Color(0xFFE0E3E7),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                '$_qty',
                                style: theme.textTheme.headlineMedium,
                              ),
                              IconButton(
                                onPressed: () => setState(() => _qty++),
                                icon: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: theme.colorScheme.primary,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // -------------------------------------------------------
                  // Form fields
                  // -------------------------------------------------------
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 0.0, 12.0, 25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // First Name + Last Name row
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 0.0),
                                child: _OutlinedField(
                                  controller: _firstName,
                                  label: 'First Name',
                                  autofillHints: const [AutofillHints.givenName],
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 0.0),
                                child: _OutlinedField(
                                  controller: _lastName,
                                  label: 'Last Name',
                                  autofillHints: const [AutofillHints.familyName],
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Email
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 12.0, 8.0, 0.0),
                          child: _OutlinedField(
                            controller: _email,
                            label: 'Email Address',
                            autofillHints: const [AutofillHints.email],
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        // Physical copy checkbox
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Checkbox(
                                value: _physicalCopy,
                                onChanged: (val) =>
                                    setState(() => _physicalCopy = val!),
                                activeColor: Theme.of(context).colorScheme.primary,
                                checkColor: Colors.white,
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFBEC0C2),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              const Text(
                                  'Request Physical Copy Delivered - Free'),
                            ],
                          ),
                        ),
                        // Physical copy delivery fields
                        if (_physicalCopy) ...[
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 12.0, 8.0, 0.0),
                            child: _OutlinedField(
                              controller: _phone,
                              label: 'Phone Number',
                              autofillHints: const [
                                AutofillHints.telephoneNumber
                              ],
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 12.0, 8.0, 0.0),
                            child: _OutlinedField(
                              controller: _address,
                              label: 'Address',
                              autofillHints: const [
                                AutofillHints.fullStreetAddress
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 12.0, 8.0, 0.0),
                                  child: _OutlinedField(
                                    controller: _city,
                                    label: 'City',
                                    autofillHints: const [
                                      AutofillHints.addressCity
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 12.0, 8.0, 0.0),
                                  child: _OutlinedField(
                                    controller: _postcode,
                                    label: 'Postcode',
                                    autofillHints: const [
                                      AutofillHints.postalCode
                                    ],
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        // Purchase button
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 18.0, 0.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.primary,
                                foregroundColor: Colors.white,
                                elevation: 0.0,
                                padding: const EdgeInsets.all(14.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: cfg.cardBorderRadius,
                                ),
                                textStyle: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: Text(
                                'Purchase (£${(_qty * 4).toString()}.00)',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Shared outlined text field used by the form.
class _OutlinedField extends StatelessWidget {
  const _OutlinedField({
    required this.controller,
    required this.label,
    this.autofillHints,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String label;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.outline, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    );
    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    );
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.error, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    );
    return TextField(
      controller: controller,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: theme.textTheme.labelMedium,
        hintStyle: theme.textTheme.labelMedium,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
    );
  }
}
