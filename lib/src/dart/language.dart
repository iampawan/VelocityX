abstract class Language {
  /// flag for short form e.g(1 min) | long form e.g(1 minute ago)
  bool? shortForm;
  Language(this.shortForm);

  String prefixAgo();
  String prefixFromNow();

  String suffixAgo();
  String suffixFromNow();

  String lessThanOneMinute(int seconds);
  String aboutAMinute(int minutes);
  String minutes(int minutes);

  String aboutAnHour(int minutes);
  String hours(int hours);

  String aDay(int hours);
  String days(int days);

  String aboutAMonth(int days);
  String months(int months);

  String aboutAYear(int year);
  String years(int years);

  String delimiter() => ' ';
}

/// To use [English] language for timeAgo. More languages can be added in the future.
class English implements Language {
  @override
  bool? shortForm;
  English({bool shortForm = false}) {
    // ignore: prefer_initializing_formals
    this.shortForm = shortForm;
  }

  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => shortForm! ? '' : 'ago';
  @override
  String suffixFromNow() => shortForm! ? '' : 'from now';
  @override
  String lessThanOneMinute(int seconds) => shortForm! ? 'now' : 'a moment';
  @override
  String aboutAMinute(int minutes) => shortForm! ? '1 min' : 'a minute';
  @override
  String minutes(int minutes) =>
      shortForm! ? '$minutes min' : '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => shortForm! ? '~1 h' : 'about an hour';
  @override
  String hours(int hours) => shortForm! ? '$hours h' : '$hours hours';
  @override
  String aDay(int hours) => shortForm! ? '~1 d' : 'a day';
  @override
  String days(int days) => shortForm! ? '$days d' : '$days days';
  @override
  String aboutAMonth(int days) => shortForm! ? '~1 mo' : 'about a month';
  @override
  String months(int months) => shortForm! ? '$months mo' : '$months months';
  @override
  String aboutAYear(int year) => shortForm! ? '~1 yr' : 'about a year';
  @override
  String years(int years) => shortForm! ? '$years yr' : '$years years';
  @override
  String delimiter() => ' ';
}
