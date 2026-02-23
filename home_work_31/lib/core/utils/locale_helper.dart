import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocaleHelper {
  static const Locale enLocale = Locale('en', 'US');
  static const Locale ruLocale = Locale('ru', 'RU');
  
  static const List<Locale> supportedLocales = [enLocale, ruLocale];
  
  static String formatCurrency(double amount, Locale locale) {
    final formatter = NumberFormat.currency(
      locale: locale.languageCode,
      symbol: locale.languageCode == 'ru' ? '₽' : '\$',
    );
    return formatter.format(amount);
  }
  
  static String formatDate(DateTime date, Locale locale) {
    final formatter = DateFormat.yMMMd(locale.languageCode);
    return formatter.format(date);
  }
  
  static String formatDateTime(DateTime date, Locale locale) {
    final formatter = DateFormat.yMMMd().add_Hm();
    return formatter.format(date);
  }
}
