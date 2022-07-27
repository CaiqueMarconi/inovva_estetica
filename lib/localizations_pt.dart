import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
import 'package:intl/intl.dart' as intl;

class _PTBRMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _PTBRMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'pt';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final localeName = intl.Intl.canonicalizedLocale(locale.toString());
    await intl.initializeDateFormatting(localeName);
    return SynchronousFuture<MaterialLocalizations>(
      PTBRMaterialLocalizations(
        localeName: localeName,
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d'),
        decimalFormat: intl.NumberFormat('#,##0.###', localeName),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_PTBRMaterialLocalizationsDelegate old) => false;
}

class PTBRMaterialLocalizations extends GlobalMaterialLocalizations {
  const PTBRMaterialLocalizations({
    String localeName = 'pt',
    required intl.DateFormat fullYearFormat,
    required intl.DateFormat compactDateFormat,
    required intl.DateFormat shortDateFormat,
    required intl.DateFormat mediumDateFormat,
    required intl.DateFormat longDateFormat,
    required intl.DateFormat yearMonthFormat,
    required intl.DateFormat shortMonthDayFormat,
    required intl.NumberFormat decimalFormat,
    required intl.NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          compactDateFormat: compactDateFormat,
          shortDateFormat: shortDateFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          shortMonthDayFormat: shortMonthDayFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );

  @override
  String get moreButtonTooltip => r'Mais';

  @override
  String get aboutListTileTitleRaw => r'Sobre $applicationName';

  @override
  String get alertDialogLabel => r'Alerta';

  @override
  String get anteMeridiemAbbreviation => r'AM';

  @override
  String get backButtonTooltip => r'Voltar';

  @override
  String get cancelButtonLabel => r'CANCELAR';

  @override
  String get closeButtonLabel => r'FECHAR';

  @override
  String get closeButtonTooltip => r'Fechar';

  @override
  String get collapsedIconTapHint => r'Expandir';

  @override
  String get continueButtonLabel => r'Continuar';

  @override
  String get copyButtonLabel => r'Copiar';

  @override
  String get cutButtonLabel => r'Recortar';

  @override
  String get deleteButtonTooltip => r'Deletar';

  @override
  String get dialogLabel => r'Alerta';

  @override
  String get drawerLabel => r'Menu de Navegação';

  @override
  String get expandedIconTapHint => r'Colapsar';

  @override
  String get hideAccountsLabel => r'Esconder contas';

  @override
  String get licensesPageTitle => r'Licenças';

  @override
  String get modalBarrierDismissLabel => r'Limpar';

  @override
  String get nextMonthTooltip => r'Próximo mês';

  @override
  String get nextPageTooltip => r'Próxima página';

  @override
  String get okButtonLabel => r'OK';

  @override
  String get openAppDrawerTooltip => r'Abrir menu de navegação';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow de $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      r'$firstRow–$lastRow de aprox $rowCount';

  @override
  String get pasteButtonLabel => r'Colar';

  @override
  String get popupMenuLabel => r'Menu de Popup';

  @override
  String get postMeridiemAbbreviation => r'PM';

  @override
  String get previousMonthTooltip => r'Mês Anterior';

  @override
  String get previousPageTooltip => r'Página Anterior';

  @override
  String get refreshIndicatorSemanticLabel => r'Atualizar';

  @override
  String get remainingTextFieldCharacterCountFew => '';

  @override
  String get remainingTextFieldCharacterCountMany => '';

  @override
  String get remainingTextFieldCharacterCountOne => r'1 caractere restante';

  @override
  String get remainingTextFieldCharacterCountOther =>
      r'$remainingCount caracteres restantes';

  @override
  String get remainingTextFieldCharacterCountTwo => '';

  @override
  String get remainingTextFieldCharacterCountZero =>
      r'Nenhum caractere restante';

  @override
  String get reorderItemDown => r'Mover acima';

  @override
  String get reorderItemLeft => r'Mover para esquerda';

  @override
  String get reorderItemRight => r'Mover para direita';

  @override
  String get reorderItemToEnd => r'Mover para o final';

  @override
  String get reorderItemToStart => r'Mover para o início';

  @override
  String get reorderItemUp => r'Mover para cima';

  @override
  String get rowsPerPageTitle => r'Linhas por página:';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => r'Pesquisar';

  @override
  String get selectAllButtonLabel => r'Selecionar Tudo';

  @override
  String get selectedRowCountTitleFew => r'olá 5';

  @override
  String get selectedRowCountTitleMany => r'olá 4';

  @override
  String get selectedRowCountTitleOne => r'1 item selecionado';

  @override
  String get selectedRowCountTitleOther =>
      r'$selectedRowCount items selecionados';

  @override
  String get selectedRowCountTitleTwo => r'olá 3';

  @override
  String get selectedRowCountTitleZero => r'Nenhum item selecionado';

  @override
  String get showAccountsLabel => r'Exibir contas';

  @override
  String get showMenuTooltip => r'Exibir menu';

  @override
  String get signedInLabel => r'Logado';

  @override
  String get tabLabelRaw => r'Aba $tabIndex de $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerHourModeAnnouncement => r'Selecionar Hora';

  @override
  String get timePickerMinuteModeAnnouncement => r'Selecionar Minutos';

  @override
  String get viewLicensesButtonLabel => r'Ver Licenças';

  @override
  List<String> get narrowWeekdays =>
      const <String>['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];

  @override
  int get firstDayOfWeekIndex => 1;

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _PTBRMaterialLocalizationsDelegate();

  @override
  String get calendarModeButtonLabel => r'';

  @override
  String get dateHelpText => 'Ver Ajuda';

  @override
  String get dateInputLabel => 'Ver Ajuda';

  @override
  String get dateOutOfRangeLabel => 'Fora do limite';

  @override
  String get datePickerHelpText => 'Ver Ajuda';

  @override
  String get dateRangeEndDateSemanticLabelRaw => 'Inválido';

  @override
  String get dateRangeEndLabel => 'Inválido';

  @override
  String get dateRangePickerHelpText => 'Ver Ajuda';

  @override
  String get dateRangeStartDateSemanticLabelRaw => 'Inválido';

  @override
  String get dateRangeStartLabel => 'Data de Início';

  @override
  String get dateSeparator => 'Separador';

  @override
  String get dialModeButtonLabel => 'Modo de Diálogo';

  @override
  String get inputDateModeButtonLabel => 'Modo de Entrada de Texto';

  @override
  String get inputTimeModeButtonLabel => 'Modo de Tempo';

  @override
  String get invalidDateFormatLabel => 'Inválido';

  @override
  String get invalidDateRangeLabel => 'Inválido';

  @override
  String get invalidTimeLabel => 'Inválido';

  @override
  String get licensesPackageDetailTextOther => 'Licenças';

  @override
  String get saveButtonLabel => 'Salvar';

  @override
  String get selectYearSemanticsLabel => 'Selecionar Ano';

  @override
  String get timePickerDialHelpText => 'Ver Ajuda';

  @override
  String get timePickerHourLabel => 'Horas';

  @override
  String get timePickerInputHelpText => 'Ver Ajuda';

  @override
  String get timePickerMinuteLabel => 'Minutos';

  @override
  String get unspecifiedDate => 'Data nao especificada';

  @override
  String get unspecifiedDateRange => 'Periodo nao especificado';

  @override
  String get firstPageTooltip => r'olá';

  @override
  String get lastPageTooltip => r'olá 2';
}
