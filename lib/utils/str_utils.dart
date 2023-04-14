class StrUtils {
  StrUtils._();

  static String title(String value) {
    List<String> listString = value.split(' ');
    String capString = '';

    for (String text in listString) {
      if ({'de', 'do', 'of', 'the'}.contains(text)) {
        capString += ' $text';
      } else {
        capString +=
            ' ${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
      }
    }

    return capString.trim();
  }
}
