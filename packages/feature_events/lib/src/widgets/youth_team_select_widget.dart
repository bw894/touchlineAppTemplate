import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

/// Animated team selection card used in the youth sign-up flow.
///
/// Has three visual subpage states driven by [subpage]:
/// * 0 — simple card showing team name only
/// * 1 — highlighted / selected state
/// * 2 — full form revealing shirt size selector and squad number input
///
/// Callbacks notify the parent when the user selects:
/// * [onTeamSelect] — tapped the card (passes teamObjectId)
/// * [onShirtSizeSelect] — tapped a shirt size button (passes size string)
/// * [onSquadNumberSelect] — entered a squad number (passes int?)
class YouthTeamSelectWidget extends StatefulWidget {
  const YouthTeamSelectWidget({
    super.key,
    required this.team,
    required this.subpage,
    this.teamObjectId,
    this.onTeamSelect,
    this.onShirtSizeSelect,
    this.onSquadNumberSelect,
  });

  final TeamStruct team;
  final int subpage;
  final String? teamObjectId;
  final Future<void> Function(String teamObjectId)? onTeamSelect;
  final Future<void> Function(String shirtSize)? onShirtSizeSelect;
  final Future<void> Function(int? squadNumber)? onSquadNumberSelect;

  @override
  State<YouthTeamSelectWidget> createState() => _YouthTeamSelectWidgetState();
}

class _YouthTeamSelectWidgetState extends State<YouthTeamSelectWidget> {
  String? _shirtSizeSelected;
  final _squadController = TextEditingController();
  final _squadFocus = FocusNode();

  static const _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  bool get _isSelected =>
      widget.teamObjectId == widget.team.objectId && widget.subpage >= 1;

  bool get _isExpanded =>
      widget.teamObjectId == widget.team.objectId && widget.subpage == 2;

  @override
  void dispose() {
    _squadController.dispose();
    _squadFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 230),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _isSelected
            ? theme.colorScheme.primary.withValues(alpha: 0.1)
            : theme.colorScheme.surfaceContainerHighest,
        border: Border.all(
          color: _isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.outline.withValues(alpha: 0.3),
          width: _isSelected ? 2.0 : 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () async {
          if (widget.onTeamSelect != null) {
            await widget.onTeamSelect!(widget.team.objectId);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team name row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.team.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  if (_isSelected)
                    Icon(Icons.check_circle,
                        color: theme.colorScheme.primary, size: 20.0),
                ],
              ),

              // Expanded: shirt size + squad number
              if (_isExpanded) ...[
                const SizedBox(height: 12.0),
                Text(
                  'SHIRT SIZE',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6.0),
                Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: _sizes.map((size) {
                    final isChosen = _shirtSizeSelected == size;
                    return GestureDetector(
                      onTap: () async {
                        setState(() => _shirtSizeSelected = size);
                        if (widget.onShirtSizeSelect != null) {
                          await widget.onShirtSizeSelect!(size);
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: isChosen
                              ? theme.colorScheme.primary
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: isChosen
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outline,
                          ),
                        ),
                        child: Text(
                          size,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: isChosen
                                ? Colors.white
                                : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'SQUAD NUMBER',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6.0),
                TextField(
                  controller: _squadController,
                  focusNode: _squadFocus,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter squad number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 8.0, 12.0, 8.0),
                  ),
                  onChanged: (val) async {
                    if (widget.onSquadNumberSelect != null) {
                      await widget.onSquadNumberSelect!(int.tryParse(val));
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
