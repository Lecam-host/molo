import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class FunctionUtils {
  static Future<String> convertDate(DateTime data, String langage) async {
    String dateStr = data.toString();

    // Parser la date en objet DateTime
    DateTime date = DateTime.parse(dateStr);

    // Initialiser les données de localisation (par exemple, pour le français)
    await initializeDateFormatting(langage, null);

    // Formater la date selon la locale française
    return DateFormat.yMd(langage).format(date);
    // print("Date formatée (fr_FR) : $formattedDateFr"); // Sortie : 19/07/2019

    // // Formater la date selon la locale anglaise (États-Unis)
    // String formattedDateEn = DateFormat.yMd('en_US').format(date);
    // print("Date formatée (en_US) : $formattedDateEn"); // Sortie : 7/19/2019

    // // Formater la date selon la locale allemande
    // String formattedDateDe = DateFormat.yMd('de_DE').format(date);
    // print("Date formatée (de_DE) : $formattedDateDe");
  }
}
