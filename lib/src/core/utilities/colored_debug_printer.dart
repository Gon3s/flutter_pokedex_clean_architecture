import 'dart:developer';

class Print {
  Print._();

  static void printRequest(String text) => yellow('REQUEST', text);

  static void printResponse(String text) => green('SUCCESS', text);

  static void printFailure(String text) => red('FAILURE', text);

  static void black(String prefix, String text) => log(
        '\x1B[30m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void red(String prefix, String text) => log(
        '\x1B[31m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void green(String prefix, String text) => log(
        '\x1B[32m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void yellow(String prefix, String text) => log(
        '\x1B[33m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void blue(String prefix, String text) => log(
        '\x1B[34m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void magenta(String prefix, String text) => log(
        '\x1B[35m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void cyan(String prefix, String text) => log(
        '\x1B[36m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );

  static void white(String prefix, String text) => log(
        '\x1B[37m$text\x1B[0m',
        name: ' ${prefix.toUpperCase()} ',
      );
}
