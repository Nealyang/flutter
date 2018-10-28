import 'package:event_bus/event_bus.dart';

class Constants {
  static const String REDIRECT_URL = "http://yubo725.top/osc/osc.php";

  static const String LOGIN_URL =
      "https://www.oschina.net/action/oauth2/authorize?client_id=4rWcDXCNTV5gMWxtagxI&response_type=code&redirect_uri=" +
          REDIRECT_URL;

  static const String OSC_CLIENT_ID = "4rWcDXCNTV5gMWxtagxI";

  static const String END_LINE_TAG = "COMPLETE";

  static EventBus eventBus = new EventBus();
}
