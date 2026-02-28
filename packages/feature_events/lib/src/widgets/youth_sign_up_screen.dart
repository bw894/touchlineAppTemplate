import 'package:api_client/api_client.dart';
import 'package:feature_events/src/widgets/youth_payment_plans_widget.dart';
import 'package:feature_events/src/widgets/youth_team_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Multi-step youth player registration screen.
///
/// Pages:
/// 1. Parent / guardian details
/// 2. Player details
/// 3. Medical & special requirements
/// 4. Team selection (loaded via [TeamsGroup.getYouthSystemTeamsCall])
/// 5. Payment plan selection (passed in via [paymentPlans])
///
/// [onComplete] is called after the user confirms on the final page.
class YouthSignUpScreen extends StatefulWidget {
  const YouthSignUpScreen({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.userToken,
    required this.paymentPlans,
    this.clubBadgeUrl,
    this.onComplete,
  });

  final String projectId;
  final String restApiKey;
  final String userToken;
  final List<PaymentPlansStruct> paymentPlans;
  final String? clubBadgeUrl;
  final VoidCallback? onComplete;

  @override
  State<YouthSignUpScreen> createState() => _YouthSignUpScreenState();
}

class _YouthSignUpScreenState extends State<YouthSignUpScreen> {
  int _page = 1;

  // ------ Parent fields ------
  final _pFirstName = TextEditingController();
  final _pLastName = TextEditingController();
  final _pEmail = TextEditingController();
  final _pPhone = TextEditingController();
  final _pAddress1 = TextEditingController();
  final _pTownCity = TextEditingController();
  final _pPostcode = TextEditingController();

  // ------ Player fields ------
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _playerEmail = TextEditingController();
  final _playerPhone = TextEditingController();
  final _faNumber = TextEditingController();
  final _dob = TextEditingController();

  // ------ Medical fields ------
  final _medConditions = TextEditingController();
  final _disabilities = TextEditingController();
  final _allergies = TextEditingController();

  // ------ Team selection ------
  String? _selectedTeamObjectId;
  int _teamSubpage = 0;
  // ignore: unused_field
  String? _shirtSize;
  // ignore: unused_field
  int? _squadNumber;

  // ------ Payment ------
  String? _selectedPlanObjectId;
  // ignore: unused_field
  bool _selectedIsOneTime = true;

  @override
  void dispose() {
    for (final c in [
      _pFirstName, _pLastName, _pEmail, _pPhone, _pAddress1,
      _pTownCity, _pPostcode, _firstName, _lastName, _playerEmail,
      _playerPhone, _faNumber, _dob, _medConditions, _disabilities, _allergies,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _next() => setState(() => _page++);
  void _back() {
    if (_page > 1) {
      setState(() => _page--);
    } else {
      Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          leading: IconButton(
            icon: const Icon(Icons.west),
            onPressed: _back,
          ),
          title: Text(
            'YOUTH SIGN UP — Page $_page of 5',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
        ),
        body: _buildPage(theme),
      ),
    );
  }

  Widget _buildPage(ThemeData theme) {
    switch (_page) {
      case 1:
        return _FormPage(
          title: 'Parent / Guardian Details',
          fields: [
            _field(_pFirstName, 'First Name'),
            _field(_pLastName, 'Last Name'),
            _field(_pEmail, 'Email', keyboardType: TextInputType.emailAddress),
            _field(_pPhone, 'Phone', keyboardType: TextInputType.phone),
            _field(_pAddress1, 'Address Line 1'),
            _field(_pTownCity, 'Town / City'),
            _field(_pPostcode, 'Postcode'),
          ],
          onNext: _next,
        );
      case 2:
        return _FormPage(
          title: 'Player Details',
          fields: [
            _field(_firstName, 'First Name'),
            _field(_lastName, 'Last Name'),
            _field(_dob, 'Date of Birth (DD/MM/YYYY)'),
            _field(_playerEmail, 'Email',
                keyboardType: TextInputType.emailAddress),
            _field(_playerPhone, 'Phone',
                keyboardType: TextInputType.phone),
            _field(_faNumber, 'FA Number'),
          ],
          onNext: _next,
        );
      case 3:
        return _FormPage(
          title: 'Medical & Special Requirements',
          fields: [
            _field(_medConditions, 'Medical Conditions', maxLines: 3),
            _field(_disabilities, 'Disabilities', maxLines: 3),
            _field(_allergies, 'Allergies', maxLines: 3),
          ],
          onNext: _next,
        );
      case 4:
        return _TeamSelectionPage(
          projectId: widget.projectId,
          restApiKey: widget.restApiKey,
          userToken: widget.userToken,
          selectedTeamObjectId: _selectedTeamObjectId,
          teamSubpage: _teamSubpage,
          onTeamSelect: (objectId) async {
            setState(() {
              _selectedTeamObjectId = objectId;
              _teamSubpage = 1;
            });
          },
          onShirtSizeSelect: (size) async =>
              setState(() => _shirtSize = size),
          onSquadNumberSelect: (n) async =>
              setState(() => _squadNumber = n),
          onExpandTeam: () => setState(() => _teamSubpage = 2),
          onNext: _next,
        );
      case 5:
        return _PaymentPage(
          paymentPlans: widget.paymentPlans,
          clubBadgeUrl: widget.clubBadgeUrl,
          selectedPlanObjectId: _selectedPlanObjectId,
          onSelected: (planObjectId, isOneTime) async {
            setState(() {
              _selectedPlanObjectId = planObjectId;
              _selectedIsOneTime = isOneTime;
            });
          },
          onComplete: widget.onComplete,
        );
      default:
        return const Center(child: Text('Complete'));
    }
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Generic form page
// ---------------------------------------------------------------------------
class _FormPage extends StatelessWidget {
  const _FormPage({
    required this.title,
    required this.fields,
    required this.onNext,
  });

  final String title;
  final List<Widget> fields;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 16.0),
          ...fields,
          const SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            height: 44.0,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('NEXT'),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Team selection page
// ---------------------------------------------------------------------------
class _TeamSelectionPage extends StatelessWidget {
  const _TeamSelectionPage({
    required this.projectId,
    required this.restApiKey,
    required this.userToken,
    required this.selectedTeamObjectId,
    required this.teamSubpage,
    required this.onTeamSelect,
    required this.onShirtSizeSelect,
    required this.onSquadNumberSelect,
    required this.onExpandTeam,
    required this.onNext,
  });

  final String projectId;
  final String restApiKey;
  final String userToken;
  final String? selectedTeamObjectId;
  final int teamSubpage;
  final Future<void> Function(String) onTeamSelect;
  final Future<void> Function(String) onShirtSizeSelect;
  final Future<void> Function(int?) onSquadNumberSelect;
  final VoidCallback onExpandTeam;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<ApiCallResponse>(
      future: TeamsGroup.getYouthSystemTeamsCall.call(
        userToken: userToken,
        bLappId: projectId,
        bLRestApiKey: restApiKey,
      ),
      builder: (context, snap) {
        if (!snap.hasData) {
          return Center(
            child: SpinKitWanderingCubes(
              color: theme.colorScheme.primary,
              size: 50.0,
            ),
          );
        }
        final teams = (snap.data!.jsonBody
                    .toList()
                    .map<TeamStruct?>(TeamStruct.maybeFromMap)
                    .toList() as Iterable<TeamStruct?>)
                .withoutNulls
                .toList();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Your Team',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 16.0),
              ...teams.map((team) => Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 10.0),
                    child: YouthTeamSelectWidget(
                      team: team,
                      subpage: selectedTeamObjectId == team.objectId
                          ? teamSubpage
                          : 0,
                      teamObjectId: selectedTeamObjectId,
                      onTeamSelect: (id) async {
                        await onTeamSelect(id);
                        onExpandTeam();
                      },
                      onShirtSizeSelect: onShirtSizeSelect,
                      onSquadNumberSelect: onSquadNumberSelect,
                    ),
                  )),
              const SizedBox(height: 24.0),
              if (selectedTeamObjectId != null)
                SizedBox(
                  width: double.infinity,
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('NEXT'),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Payment plan page
// ---------------------------------------------------------------------------
class _PaymentPage extends StatelessWidget {
  const _PaymentPage({
    required this.paymentPlans,
    required this.selectedPlanObjectId,
    required this.onSelected,
    this.clubBadgeUrl,
    this.onComplete,
  });

  final List<PaymentPlansStruct> paymentPlans;
  final String? selectedPlanObjectId;
  final String? clubBadgeUrl;
  final Future<void> Function(String, bool) onSelected;
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose a Payment Plan',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 16.0),
          ...paymentPlans.map((plan) => Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: YouthPaymentPlansWidget(
                  paymentPlan: plan,
                  clubBadgeUrl: clubBadgeUrl,
                  onSelected: onSelected,
                ),
              )),
          if (selectedPlanObjectId != null) ...[
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.infinity,
              height: 44.0,
              child: ElevatedButton(
                onPressed: onComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('COMPLETE SIGN UP'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
