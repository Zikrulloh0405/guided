// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GeneratedLocalization {
  GeneratedLocalization();

  static GeneratedLocalization? _current;

  static GeneratedLocalization get current {
    assert(_current != null,
        'No instance of GeneratedLocalization was loaded. Try to initialize the GeneratedLocalization delegate before accessing GeneratedLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GeneratedLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GeneratedLocalization();
      GeneratedLocalization._current = instance;

      return instance;
    });
  }

  static GeneratedLocalization of(BuildContext context) {
    final instance = GeneratedLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of GeneratedLocalization present in the widget tree. Did you add GeneratedLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static GeneratedLocalization? maybeOf(BuildContext context) {
    return Localizations.of<GeneratedLocalization>(
        context, GeneratedLocalization);
  }

  /// `Choose Language`
  String get choose_language {
    return Intl.message(
      'Choose Language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `You will continue as`
  String get choose_panel_header {
    return Intl.message(
      'You will continue as',
      name: 'choose_panel_header',
      desc: '',
      args: [],
    );
  }

  /// `Select one of the following`
  String get choose_panel_sub_header {
    return Intl.message(
      'Select one of the following',
      name: 'choose_panel_sub_header',
      desc: '',
      args: [],
    );
  }

  /// `Tourist`
  String get choose_panel_button_tourist {
    return Intl.message(
      'Tourist',
      name: 'choose_panel_button_tourist',
      desc: '',
      args: [],
    );
  }

  /// `Guide`
  String get choose_panel_button_guide {
    return Intl.message(
      'Guide',
      name: 'choose_panel_button_guide',
      desc: '',
      args: [],
    );
  }

  /// `Login up`
  String get auth_login_header_login_up {
    return Intl.message(
      'Login up',
      name: 'auth_login_header_login_up',
      desc: '',
      args: [],
    );
  }

  /// `Log in with one of the following option`
  String get auth_login_sub_header_login_up {
    return Intl.message(
      'Log in with one of the following option',
      name: 'auth_login_sub_header_login_up',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get auth_login_button {
    return Intl.message(
      'Login',
      name: 'auth_login_button',
      desc: '',
      args: [],
    );
  }

  /// `Don,t  have  an account?  `
  String get auth_login_do_not_have_account {
    return Intl.message(
      'Don,t  have  an account?  ',
      name: 'auth_login_do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get auth_login_go_sign_up {
    return Intl.message(
      'Register',
      name: 'auth_login_go_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get auth_create_account_text {
    return Intl.message(
      'Create Account',
      name: 'auth_create_account_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get auth_create_account_header_enter_full_name {
    return Intl.message(
      'Enter your full name',
      name: 'auth_create_account_header_enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get auth_create_account_label_name {
    return Intl.message(
      'Name',
      name: 'auth_create_account_label_name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get auth_create_account_label_surname {
    return Intl.message(
      'Surname',
      name: 'auth_create_account_label_surname',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get auth_create_account_next_button {
    return Intl.message(
      'Next',
      name: 'auth_create_account_next_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have  an account? `
  String get auth_create_account_already_have_account {
    return Intl.message(
      'Already have  an account? ',
      name: 'auth_create_account_already_have_account',
      desc: '',
      args: [],
    );
  }

  /// ` Log in`
  String get auth_create_account_go_login_up {
    return Intl.message(
      ' Log in',
      name: 'auth_create_account_go_login_up',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get auth_create_account_enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'auth_create_account_enter_your_email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<GeneratedLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<GeneratedLocalization> load(Locale locale) =>
      GeneratedLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
