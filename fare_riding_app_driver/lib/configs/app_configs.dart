import 'dart:ui';

// import 'app_env_config.dart';

class AppConfigs {
  AppConfigs._();

  static const String appName = "Click247";

  // static Environment env = Environment.prod;

  ///API Env
  // static String get baseUrl => env.baseUrl;
  //
  // static String get envName => env.envName;

  ///Paging
  static const pageSize = 40;
  static const pageSizeMax = 1000;

  ///Local
  static const appLocal = 'vi_VN';
  static const appLanguage = 'vi';
  static const defaultLocal = Locale.fromSubtags(languageCode: appLanguage);

  ///DateFormat

  static const dateAPIFormat = 'dd/MM/yyyy';
  static const dateDisplayFormat = 'dd/MM/yyyy';
  static const dateDisplayFormat1 = 'dd-MM-yyyy';

  static const dateTimeAPIFormat =
      "MM/dd/yyyy'T'hh:mm:ss.SSSZ"; //Use DateTime.parse(date) instead of ...
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';
  static const dateTimeDisplayFormatAlternate = 'dd-MM-yyyy | HH:mm';
  static const dateTimeDisplayFormatAlternate1 = 'dd-MM-yyyy  HH:mm';
  static const customDateTimeFormat = 'd MMMM y, HH:mm';
  static const dateTimeDisplayFormat2 = 'HH:mm | dd-MM-yyy';
  static const fullMonthYearFormat  = 'MMMM yyyy';


  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();
  static final birthMinDate = DateTime(1900, 1, 1);
  static final birthMaxDate = DateTime.now();

  ///Number
  static const numberFormat = '#,##0';
  static const locale = 'en_US';

  ///Font
  static const fontFamily = 'Roboto';

  ///Max file
  static const maxAttachFile = 5;
}

class FirebaseConfig {
  //Todo
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}

class MovieAPIConfig {
  static const String apiKey = '26763d7bf2e94098192e629eb975dab0';
}

class UpGraderAPIConfig {
  static const String apiKey = '';
}
