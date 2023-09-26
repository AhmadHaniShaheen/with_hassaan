import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_apps/controller/setting_controller.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingController>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('setting'.tr()),
          ),
          body: Column(
            children: [
              SwitchListTile(
                title: Text('current_model'.tr()),
                subtitle:
                    provider.isDark ? Text('dark'.tr()) : Text('light'.tr()),
                value: provider.isDark,
                onChanged: (value) {
                  provider.changeMode();
                },
              ),
              SwitchListTile(
                title: Text('change_lagne'.tr()),
                subtitle: provider.isArabic
                    ? Text('english'.tr())
                    : Text(
                        'arabic'.tr(),
                      ),
                value: provider.isArabic,
                onChanged: (value) {
                  provider.changeLange(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
