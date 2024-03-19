import 'package:echelon/ui/common/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'default_system_overlay_model.dart';

class DefaultSystemOverlay extends StackedView<DefaultSystemOverlayModel> {
  final Widget scaffold;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Color? systemNavigationBarColor;
  final Brightness? systemNavigationBarIconBrightness;

  const DefaultSystemOverlay({
    super.key,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.systemNavigationBarColor,
    this.systemNavigationBarIconBrightness,
    required this.scaffold,
  });

  @override
  Widget builder(
    BuildContext context,
    DefaultSystemOverlayModel viewModel,
    Widget? child,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? context.scaffoldBackground,
        statusBarIconBrightness:
            statusBarIconBrightness ?? context.iconBrightness,
        systemNavigationBarColor:
            systemNavigationBarColor ?? context.scaffoldBackground,
        systemNavigationBarIconBrightness:
            systemNavigationBarIconBrightness ?? context.iconBrightness,
      ),
      child: SafeArea(child: scaffold),
    );
  }

  @override
  DefaultSystemOverlayModel viewModelBuilder(
    BuildContext context,
  ) =>
      DefaultSystemOverlayModel();
}
