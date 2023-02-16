import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class AppInfo {
  AppInfo(this._packageInfo);

  final PackageInfo _packageInfo;

  String get appName => _packageInfo.appName;
  String get applicationId => _packageInfo.packageName;
  String get versionCode => _packageInfo.buildNumber;
  String get versionName => _packageInfo.version;
}
