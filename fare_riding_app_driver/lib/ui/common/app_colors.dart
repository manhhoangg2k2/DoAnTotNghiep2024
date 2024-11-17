import 'dart:ui';

class AppColors {
  AppColors._();

  ///Common
  static const Color primary = Color(0xFF008955);
  static const Color primaryDisable = Color(0x99F5C608);
  static const Color secondary = Color(0xFF47CFFF);
  static const Color red = Color(0xFFFB1626);
  static const Color blue = Color(0xFF266BEB);
  static const Color gray = Color(0xFF7E7E7E);
  static const Color grayDark = Color(0xFF49454F);
  static const Color yellow = Color(0xFFFFDA45);
  static const Color orange = Color(0xFFFF8F1F);
  static const Color itemFocus = Color(0xFFFFFFE6);
  static const Color neutralStroke = Color(0xFFE0E0E0);
  static const Color orangeDisable = Color(0xFFFABF83);
  static const Color purple = Color(0xFFA020F0);
  static const Color green = Color(0xFF4EA54D);
  static const List<Color> gradientPrimary = [
    Color(0xFFFFEDA4),
    Color(0xFFFFFFFF)
  ];

  ///Background
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0F1B2B);
  static const Color bgInput = Color(0xFFF5F5F5);
  static const Color backgroundHighLight = Color(0xFFFFFEF6);
  static const Color backgroundNormal = Color(0xFFEFEFEF);
  static const Color backgroundWallet = Color(0xFFFEEAC5);
  static const Color backgroundWarning = Color(0xFFFFF2F0);
  static const Color backgroundError = Color(0xFFFFF2F0);
  static const Color backgroundAccess = Color(0xFFF5F5F5);
  static const Color backgroundHeader = Color(0xFFEBF5FF);

  ///Shadow
  static const Color shadow = Color(0x25606060);

  ///Border
  static const Color border = Color(0xFFB3B3B3);

  ///Divider
  static const Color divider = Color(0xFF606060);
  static const Color dividerLight = Color(0xFFE0E0E0);

  ///Text
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1C1C1C);
  static const Color textGrey = Color(0xFF616161);
  static const Color textBlue = Color(0xFF0000FF);
  static const Color textDisable = Color(0xFF89a3b1);
  static const Color textHighLine = Color(0xFFFF3133);
  static const Color textHint = Color(0xFFB3B3B3);
  static const Color textLight = Color(0xFFFFFFFF);

  ///TextField
  static const Color textFieldEnabledBorder = Color(0xFF919191);
  static const Color textFieldFocusedBorder = Color(0xFFd74315);
  static const Color textFieldDisabledBorder = Color(0xFF919191);
  static const Color textFieldCursor = Color(0xFF919191);

  ///Button
  static const Color buttonBGWhite = Color(0xFFcdd0d5);
  static const Color buttonBGTint = secondary;
  static const Color buttonBorder = secondary;
  static const Color linkButton = Color(0xFF0F6CBD);

  /// Tabs
  static const Color imageBG = Color(0xFF919191);

  ///BottomNavigationBar
  static const Color bottomNavigationBar = Color(0xFF919191);

  /// BottomSheet
  static const Color bottomSheetStroke = Color(0xFFD1D1D1);
  static const Color bottomSheetForeground = Color(0xFF242424);

  /// status auction
  static const Color statusSuccess = Color(0xFF3FAADA);
  static const Color statusHighest = Color(0xFF7DC482);
  static const Color statusAuctioning = Color(0xFFF7CA4A);
}
