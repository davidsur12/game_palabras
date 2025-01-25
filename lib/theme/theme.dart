import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284307345),
      surfaceTint: Color(4284307345),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293189631),
      onPrimaryContainer: Color(4282728567),
      secondary: Color(4284439665),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293189625),
      onSecondaryContainer: Color(4282860633),
      tertiary: Color(4280575112),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291356415),
      onTertiaryContainer: Color(4278209645),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4287823882),
      surface: Color(4294768895),
      onSurface: Color(4280032032),
      onSurfaceVariant: Color(4282861135),
      outline: Color(4286084736),
      outlineVariant: Color(4291413456),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413686),
      inversePrimary: Color(4291280895),
      primaryFixed: Color(4293189631),
      onPrimaryFixed: Color(4279833161),
      primaryFixedDim: Color(4291280895),
      onPrimaryFixedVariant: Color(4282728567),
      secondaryFixed: Color(4293189625),
      onSecondaryFixed: Color(4279965996),
      secondaryFixedDim: Color(4291347420),
      onSecondaryFixedVariant: Color(4282860633),
      tertiaryFixed: Color(4291356415),
      onTertiaryFixed: Color(4278197806),
      tertiaryFixedDim: Color(4287942134),
      onTertiaryFixedVariant: Color(4278209645),
      surfaceDim: Color(4292729056),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4294044916),
      surfaceContainerHigh: Color(4293650159),
      surfaceContainerHighest: Color(4293255657),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281675621),
      surfaceTint: Color(4284307345),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285294241),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281742407),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285426304),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278205013),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281758616),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285792262),
      onError: Color(4294967295),
      errorContainer: Color(4291767335),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768895),
      onSurface: Color(4279308310),
      onSurfaceVariant: Color(4281808190),
      outline: Color(4283650394),
      outlineVariant: Color(4285426805),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413686),
      inversePrimary: Color(4291280895),
      primaryFixed: Color(4285294241),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283715207),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285426304),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283781735),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281758616),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279589502),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4291413453),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293650159),
      surfaceContainerHigh: Color(4292860899),
      surfaceContainerHighest: Color(4292137176),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280951899),
      surfaceTint: Color(4284307345),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282925690),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281084477),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282992475),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278202438),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278210161),
      onTertiaryContainer: Color(4294967295),
      error: Color(4284481540),
      onError: Color(4294967295),
      errorContainer: Color(4288151562),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768895),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4278190080),
      outline: Color(4281084723),
      outlineVariant: Color(4283058257),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413686),
      inversePrimary: Color(4291280895),
      primaryFixed: Color(4282925690),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281412450),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282992475),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281544772),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278210161),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203984),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4290492351),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294242295),
      surfaceContainer: Color(4293255657),
      surfaceContainerHigh: Color(4292334555),
      surfaceContainerHighest: Color(4291413453),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291280895),
      surfaceTint: Color(4291280895),
      onPrimary: Color(4281280863),
      primaryContainer: Color(4282728567),
      onPrimaryContainer: Color(4293189631),
      secondary: Color(4291347420),
      onSecondary: Color(4281347649),
      secondaryContainer: Color(4282860633),
      onSecondaryContainer: Color(4293189625),
      tertiary: Color(4287942134),
      onTertiary: Color(4278203469),
      tertiaryContainer: Color(4278209645),
      onTertiaryContainer: Color(4291356415),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279505688),
      onSurface: Color(4293255657),
      onSurfaceVariant: Color(4291413456),
      outline: Color(4287795097),
      outlineVariant: Color(4282861135),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255657),
      inversePrimary: Color(4284307345),
      primaryFixed: Color(4293189631),
      onPrimaryFixed: Color(4279833161),
      primaryFixedDim: Color(4291280895),
      onPrimaryFixedVariant: Color(4282728567),
      secondaryFixed: Color(4293189625),
      onSecondaryFixed: Color(4279965996),
      secondaryFixedDim: Color(4291347420),
      onSecondaryFixedVariant: Color(4282860633),
      tertiaryFixed: Color(4291356415),
      onTertiaryFixed: Color(4278197806),
      tertiaryFixedDim: Color(4287942134),
      onTertiaryFixedVariant: Color(4278209645),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4282005566),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4280032032),
      surfaceContainer: Color(4280295205),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292794623),
      surfaceTint: Color(4291280895),
      onPrimary: Color(4280556884),
      primaryContainer: Color(4287662791),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292794867),
      onSecondary: Color(4280623926),
      secondaryContainer: Color(4287794853),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290503167),
      onTertiary: Color(4278200637),
      tertiaryContainer: Color(4284323774),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294955724),
      onError: Color(4283695107),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(-16220708 ),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4292860646),
      outline: Color(4290031803),
      outlineVariant: Color(4287795097),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255657),
      inversePrimary: Color(4282859897),
      primaryFixed: Color(4293189631),
      onPrimaryFixed: Color(4279174463),
      primaryFixedDim: Color(4291280895),
      onPrimaryFixedVariant: Color(4281675621),
      secondaryFixed: Color(4293189625),
      onSecondaryFixed: Color(4279308065),
      secondaryFixedDim: Color(4291347420),
      onSecondaryFixedVariant: Color(4281742407),
      tertiaryFixed: Color(4291356415),
      onTertiaryFixed: Color(4278194975),
      tertiaryFixedDim: Color(4287942134),
      onTertiaryFixedVariant: Color(4278205013),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4282729290),
      surfaceContainerLowest: Color(4278650636),
      surfaceContainerLow: Color(4280163619),
      surfaceContainer: Color(4280821549),
      surfaceContainerHigh: Color(4281545272),
      surfaceContainerHighest: Color(4282268995),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294110719),
      surfaceTint: Color(4291280895),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291017724),
      onPrimaryContainer: Color(4278714424),
      secondary: Color(4294110719),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291084504),
      onSecondaryContainer: Color(4278913306),
      tertiary: Color(4293128959),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287678962),
      onTertiaryContainer: Color(4278193431),
      error: Color(4294962409),
      onError: Color(4278190080),
      errorContainer: Color(4294946468),
      onErrorContainer: Color(4280418305),
      surface: Color(4279505688),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294967295),
      outline: Color(4294176505),
      outlineVariant: Color(4291150284),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255657),
      inversePrimary: Color(4282859897),
      primaryFixed: Color(4293189631),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291280895),
      onPrimaryFixedVariant: Color(4279174463),
      secondaryFixed: Color(4293189625),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291347420),
      onSecondaryFixedVariant: Color(4279308065),
      tertiaryFixed: Color(4291356415),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287942134),
      onTertiaryFixedVariant: Color(4278194975),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4283518806),
      surfaceContainerLowest: Color(4278190080),
      surfaceContainerLow: Color(4280295205),
      surfaceContainer: Color(4281413686),
      surfaceContainerHigh: Color(4282137153),
      surfaceContainerHighest: Color(4282861132),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
