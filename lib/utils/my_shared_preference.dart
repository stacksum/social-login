import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:shared_value/shared_value.dart';




  SharedValue<bool> isLoggedIn = SharedValue(
    key: StringKeys.isLoggedIN,
    value: false,
    autosave: true,
  );

   SharedValue<String> userName = SharedValue(
    key: StringKeys.userName,
    value: '',
    autosave: true,
  );
   SharedValue<String> userEmail = SharedValue(
    key: StringKeys.userEmail,
    value: '',
    autosave: true,
  );
   SharedValue<String> userPic = SharedValue(
    key: StringKeys.userPic,
    value: '',
    autosave: true,
  );
   SharedValue<String> loginType = SharedValue(
    key: StringKeys.loginType,
    value: '',
    autosave: true,
  );



