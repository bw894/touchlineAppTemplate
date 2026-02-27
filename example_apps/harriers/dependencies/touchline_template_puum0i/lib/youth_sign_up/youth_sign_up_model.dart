import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/youth_sign_up_payment_plans_widget.dart';
import '/components/youth_sign_up_team_select_team_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'youth_sign_up_widget.dart' show YouthSignUpWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class YouthSignUpModel extends FlutterFlowModel<YouthSignUpWidget> {
  ///  Local state fields for this page.

  int page = 1;

  bool? registeringSelf;

  int subpage = 0;

  String? teamObjectId;

  String? shirtSizeSelected;

  bool noPlayerEmailAddress = false;

  bool noPlayerPhoneNumber = false;

  String? hsPhoto;

  bool monthly = false;

  String? paymentPlanId;

  int? teamIndex;

  int? shirtNumber;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for youthSignUpTeamSelectTeam dynamic component.
  late FlutterFlowDynamicModels<YouthSignUpTeamSelectTeamModel>
      youthSignUpTeamSelectTeamModels;
  // State field(s) for PfirstName widget.
  FocusNode? pfirstNameFocusNode;
  TextEditingController? pfirstNameTextController;
  String? Function(BuildContext, String?)? pfirstNameTextControllerValidator;
  // State field(s) for PlastName widget.
  FocusNode? plastNameFocusNode;
  TextEditingController? plastNameTextController;
  String? Function(BuildContext, String?)? plastNameTextControllerValidator;
  // State field(s) for PemailAddress widget.
  FocusNode? pemailAddressFocusNode;
  TextEditingController? pemailAddressTextController;
  String? Function(BuildContext, String?)? pemailAddressTextControllerValidator;
  // State field(s) for PphoneNumberCC widget.
  FocusNode? pphoneNumberCCFocusNode1;
  TextEditingController? pphoneNumberCCTextController1;
  String? Function(BuildContext, String?)?
      pphoneNumberCCTextController1Validator;
  // State field(s) for PphoneNumber widget.
  FocusNode? pphoneNumberFocusNode;
  TextEditingController? pphoneNumberTextController;
  String? Function(BuildContext, String?)? pphoneNumberTextControllerValidator;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for noEmailAddress widget.
  bool? noEmailAddressValue;
  // State field(s) for PphoneNumberCC widget.
  FocusNode? pphoneNumberCCFocusNode2;
  TextEditingController? pphoneNumberCCTextController2;
  String? Function(BuildContext, String?)?
      pphoneNumberCCTextController2Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for noPhoneNumber widget.
  bool? noPhoneNumberValue;
  // State field(s) for dayDOB widget.
  String? dayDOBValue;
  FormFieldController<String>? dayDOBValueController;
  // State field(s) for monthDob widget.
  String? monthDobValue;
  FormFieldController<String>? monthDobValueController;
  // State field(s) for yearDob widget.
  String? yearDobValue;
  FormFieldController<String>? yearDobValueController;
  // State field(s) for FANumber widget.
  FocusNode? fANumberFocusNode;
  TextEditingController? fANumberTextController;
  String? Function(BuildContext, String?)? fANumberTextControllerValidator;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for Address1 widget.
  FocusNode? address1FocusNode;
  TextEditingController? address1TextController;
  String? Function(BuildContext, String?)? address1TextControllerValidator;
  // State field(s) for Address2 widget.
  FocusNode? address2FocusNode;
  TextEditingController? address2TextController;
  String? Function(BuildContext, String?)? address2TextControllerValidator;
  // State field(s) for Address3 widget.
  FocusNode? address3FocusNode;
  TextEditingController? address3TextController;
  String? Function(BuildContext, String?)? address3TextControllerValidator;
  // State field(s) for Address4 widget.
  FocusNode? address4FocusNode;
  TextEditingController? address4TextController;
  String? Function(BuildContext, String?)? address4TextControllerValidator;
  // State field(s) for TownCity widget.
  FocusNode? townCityFocusNode;
  TextEditingController? townCityTextController;
  String? Function(BuildContext, String?)? townCityTextControllerValidator;
  // State field(s) for postcode widget.
  FocusNode? postcodeFocusNode;
  TextEditingController? postcodeTextController;
  String? Function(BuildContext, String?)? postcodeTextControllerValidator;
  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  bool isDataUploading_headAndShoulders = false;
  FFUploadedFile uploadedLocalFile_headAndShoulders =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for playerCanBePhotographed widget.
  FormFieldController<List<String>>? playerCanBePhotographedValueController;
  String? get playerCanBePhotographedValue =>
      playerCanBePhotographedValueController?.value?.firstOrNull;
  set playerCanBePhotographedValue(String? val) =>
      playerCanBePhotographedValueController?.value = val != null ? [val] : [];
  // State field(s) for playerCanBeOnSocialMedia widget.
  FormFieldController<List<String>>? playerCanBeOnSocialMediaValueController;
  String? get playerCanBeOnSocialMediaValue =>
      playerCanBeOnSocialMediaValueController?.value?.firstOrNull;
  set playerCanBeOnSocialMediaValue(String? val) =>
      playerCanBeOnSocialMediaValueController?.value = val != null ? [val] : [];
  // State field(s) for playerCanReceiveTreatment widget.
  FormFieldController<List<String>>? playerCanReceiveTreatmentValueController;
  String? get playerCanReceiveTreatmentValue =>
      playerCanReceiveTreatmentValueController?.value?.firstOrNull;
  set playerCanReceiveTreatmentValue(String? val) =>
      playerCanReceiveTreatmentValueController?.value =
          val != null ? [val] : [];
  // State field(s) for playerHasMedicalConditions widget.
  FormFieldController<List<String>>? playerHasMedicalConditionsValueController;
  String? get playerHasMedicalConditionsValue =>
      playerHasMedicalConditionsValueController?.value?.firstOrNull;
  set playerHasMedicalConditionsValue(String? val) =>
      playerHasMedicalConditionsValueController?.value =
          val != null ? [val] : [];
  // State field(s) for medicalConditions widget.
  FocusNode? medicalConditionsFocusNode;
  TextEditingController? medicalConditionsTextController;
  String? Function(BuildContext, String?)?
      medicalConditionsTextControllerValidator;
  // State field(s) for playerHasDisabilities widget.
  FormFieldController<List<String>>? playerHasDisabilitiesValueController;
  String? get playerHasDisabilitiesValue =>
      playerHasDisabilitiesValueController?.value?.firstOrNull;
  set playerHasDisabilitiesValue(String? val) =>
      playerHasDisabilitiesValueController?.value = val != null ? [val] : [];
  // State field(s) for disabilities widget.
  FocusNode? disabilitiesFocusNode;
  TextEditingController? disabilitiesTextController;
  String? Function(BuildContext, String?)? disabilitiesTextControllerValidator;
  // State field(s) for playerHasAllergies widget.
  FormFieldController<List<String>>? playerHasAllergiesValueController;
  String? get playerHasAllergiesValue =>
      playerHasAllergiesValueController?.value?.firstOrNull;
  set playerHasAllergiesValue(String? val) =>
      playerHasAllergiesValueController?.value = val != null ? [val] : [];
  // State field(s) for allergies widget.
  FocusNode? allergiesFocusNode;
  TextEditingController? allergiesTextController;
  String? Function(BuildContext, String?)? allergiesTextControllerValidator;
  // State field(s) for additionalInfo widget.
  FocusNode? additionalInfoFocusNode;
  TextEditingController? additionalInfoTextController;
  String? Function(BuildContext, String?)?
      additionalInfoTextControllerValidator;
  // Models for youthSignUpPaymentPlans dynamic component.
  late FlutterFlowDynamicModels<YouthSignUpPaymentPlansModel>
      youthSignUpPaymentPlansModels;

  @override
  void initState(BuildContext context) {
    youthSignUpTeamSelectTeamModels =
        FlutterFlowDynamicModels(() => YouthSignUpTeamSelectTeamModel());
    youthSignUpPaymentPlansModels =
        FlutterFlowDynamicModels(() => YouthSignUpPaymentPlansModel());
  }

  @override
  void dispose() {
    youthSignUpTeamSelectTeamModels.dispose();
    pfirstNameFocusNode?.dispose();
    pfirstNameTextController?.dispose();

    plastNameFocusNode?.dispose();
    plastNameTextController?.dispose();

    pemailAddressFocusNode?.dispose();
    pemailAddressTextController?.dispose();

    pphoneNumberCCFocusNode1?.dispose();
    pphoneNumberCCTextController1?.dispose();

    pphoneNumberFocusNode?.dispose();
    pphoneNumberTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    pphoneNumberCCFocusNode2?.dispose();
    pphoneNumberCCTextController2?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    fANumberFocusNode?.dispose();
    fANumberTextController?.dispose();

    address1FocusNode?.dispose();
    address1TextController?.dispose();

    address2FocusNode?.dispose();
    address2TextController?.dispose();

    address3FocusNode?.dispose();
    address3TextController?.dispose();

    address4FocusNode?.dispose();
    address4TextController?.dispose();

    townCityFocusNode?.dispose();
    townCityTextController?.dispose();

    postcodeFocusNode?.dispose();
    postcodeTextController?.dispose();

    medicalConditionsFocusNode?.dispose();
    medicalConditionsTextController?.dispose();

    disabilitiesFocusNode?.dispose();
    disabilitiesTextController?.dispose();

    allergiesFocusNode?.dispose();
    allergiesTextController?.dispose();

    additionalInfoFocusNode?.dispose();
    additionalInfoTextController?.dispose();

    youthSignUpPaymentPlansModels.dispose();
  }
}
