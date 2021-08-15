import 'package:dunija/core/services/shared_pref.dart';
import 'package:dunija/core/utils/strings.dart';

class AppSettings {
  var _getHealthTips,
      _isAlarmOn,
      _isVoiceOn,
      _isStorageEnabled,
      _fullName,
      _email,
      _occupation,
      _interests,
      _referrer,
      _plan,
      _badge;

  AppSettings() {
    getPrefs();
  }

  bool get heatth => _getHealthTips;
  bool get alarm => _isAlarmOn;
  bool get storage => _isStorageEnabled;
  bool get voice => _isVoiceOn;
  String get fullName => _fullName;
  String get email => _email;
  String get occupation => _occupation;
  String get interests => _interests;
  String get referrer => _referrer;
  String get plan => _plan;
  String get badge => _badge;

  Future getPrefs() async {
    final keys = AppStrings.keys;

    ///Iterate keys map, read prefs and
    ///set corresponding value
    keys.forEach((key) async {
      await SharedPrefs().read(key).then((value) {
        switch (key) {
          case 'health':
            _getHealthTips = value;

            break;
          case 'alarm':
            _isAlarmOn = value;

            break;
          case 'voice':
            _isVoiceOn = value;

            break;
          case 'storage':
            _isStorageEnabled = value;

            break;
          case 'full_name':
            _fullName = value;

            break;
          case 'email':
            _email = value;

            break;
          case 'occupation':
            _occupation = value;

            break;
          case 'interests':
            _interests = value;

            break;
          case 'referrer':
            _referrer = value;

            break;
          case 'plan':
            _plan = value;

            break;
          case 'badge':
            _badge = value;
            break;
        }
        print('$key: $value');
      });
    });
  }
}
