import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/constants/locale_keys.dart';
import 'package:flutter_clean_architecture_template/core/theme/custom_theme.dart';
import 'package:flutter_clean_architecture_template/core/utils/size_utils.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const _LoadingDialog(),
  );
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoActivityIndicator(
            color: CustomTheme.primaryColor,
          ),
          SizedBox(height: 10.hp),
          Text(
            LocaleKeys.loading.tr(),
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
