import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_apps/controller/setting_controller.dart';

class SettingViewSelector extends StatefulWidget {
  const SettingViewSelector({super.key});

  @override
  State<SettingViewSelector> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingViewSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr()),
      ),
      body: Column(
        children: [
          Selector<SettingController, bool>(
            selector: (context, provider) {
              return provider.isDark;
            },
            builder: (context, isDark, child) {
              return SwitchListTile(
                title: Text('current_model'.tr()),
                subtitle: isDark ? Text('dark'.tr()) : Text('light'.tr()),
                value: isDark,
                onChanged: (value) {
                  Provider.of<SettingController>(context, listen: false)
                      .changeMode();
                },
              );
            },
          ),
          Selector<SettingController, bool>(
            selector: (context, provider) {
              return provider.isArabic;
            },
            builder: (context, isArabic, child) {
              return SwitchListTile(
                title: Text('change_lagne'.tr()),
                subtitle: isArabic
                    ? Text('english'.tr())
                    : Text(
                        'arabic'.tr(),
                      ),
                value: isArabic,
                onChanged: (value) {
                  Provider.of<SettingController>(context, listen: false)
                      .changeLange(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
