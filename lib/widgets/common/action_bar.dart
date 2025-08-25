import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';
import 'custom_button.dart';

class ActionBar extends StatelessWidget {
  final List<ActionButton> actions;
  final String? title;
  final bool showDivider;

  const ActionBar({
    super.key,
    required this.actions,
    this.title,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.smallSpacing),
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
        Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: actions.map((action) {
              if (action.type == ActionButtonType.spacer) {
                return const Spacer();
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomButton(
                    text: action.text,
                    onPressed: action.onPressed,
                    type: action.buttonType,
                    icon: action.icon,
                    isLoading: action.isLoading,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        if (showDivider) ...[
          const SizedBox(height: AppConstants.defaultSpacing),
          Container(
            height: 1,
            color: AppColors.border,
          ),
        ],
      ],
    );
  }
}

class ActionButton {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final IconData? icon;
  final bool isLoading;
  final ActionButtonType type;

  const ActionButton({
    required this.text,
    this.onPressed,
    this.buttonType = ButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.type = ActionButtonType.button,
  });

  const ActionButton.spacer()
      : text = '',
        onPressed = null,
        buttonType = ButtonType.primary,
        icon = null,
        isLoading = false,
        type = ActionButtonType.spacer;
}

enum ActionButtonType {
  button,
  spacer,
}

// Quick Action Buttons
class QuickActionButtons extends StatelessWidget {
  final List<QuickAction> actions;

  const QuickActionButtons({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: actions.map((action) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomButton(
              text: action.text,
              onPressed: action.onPressed,
              type: action.buttonType,
              icon: action.icon,
              height: 40,
            ),
          ),
        );
      }).toList(),
    );
  }
}
class QuickAction {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final IconData? icon;

  const QuickAction({
    required this.text,
    this.onPressed,
    this.buttonType = ButtonType.secondary,
    this.icon,
  });
}

