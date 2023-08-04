/*
 * Future<void> main() async {
 *  for (var i = 0; i < 5; i++) {
 *
 *  print('Hello from Dart ($i)!');
 *   await Future.delayed(Duration(milliseconds: 500));
 *  }
 * }
 */

import 'package:dart001/dart_application_1.dart' as dart_application_1;
import 'package:fpdart/fpdart.dart';

/// =======================
/// dart001.dart - template
/// =======================

///
/// =====
/// [class]
/// class CFlagDebug
///
///   [goal]
///     - (de)activate messages logging
///     - log messages
///
class CFlagDebug {
  ///   [properties]
  ///     bool pDebug
  ///       default = false
  ///         switch to allow messages logging or not
  ///     String pDebugMessage
  ///       default = '?????'
  ///         message that has been logged
  ///
  bool pDebug = false;
  String pDebugMessage = '?????';

  ///   [constructor]
  ///     CFlagDebug (bool constructorDebug, String constructorMessage)
  ///       [params]
  ///         bool constructorDebug
  ///           switch to allow messages logging or not
  ///         String constructorMessage
  ///           new default message for loggings
  ///             - if empty = keep current one
  ///       [goal]
  ///         initiate new object
  ///
  CFlagDebug(bool constructorDebug, String constructorMessage) {
    print('[CFlagDebug-CFlagDebug-CONSTRUCTOR-CALLED]'
        '\n\tparams :'
        '\n\t\tconstructorDebug <$constructorDebug>'
        '\n\t\tconstructorMessage <$constructorMessage>');
    print('[CFlagDebug-CFlagDebug-CONSTRUCTOR-initial values'
        '\n\tproperties initial values :'
        '\n\t\tpDebug <$pDebug>'
        '\n\t\tpDebugMessage <$pDebugMessage>');
    pDebug = constructorDebug;
    if (constructorMessage.isEmpty == false) {
      pDebugMessage = constructorMessage;
    }
    print('[CFlagDebug-CFlagDebug-CONSTRUCTOR-END]'
        '\n\tproperties set to :'
        '\n\t\tpDebug <$pDebug>'
        '\n\t\tpDebugMessage <$pDebugMessage>');
    return;
  }

  ///   [method]
  ///     void mLogMessage(String message)
  ///       [params]
  ///         String message
  ///           message to log
  ///       [errors]
  ///           [CFlagDebug-mLogMessage-EMPTY]'
  ///             if EMPTY message
  ///           [CFlagDebug-mLogMessage-NO DEBUG]'
  ///             if NOT in DEBUG mode
  ///       [goal]
  ///         log message
  ///
  void mLogMessage(String message) {
    if (pDebug == true) {
      switch (message.isEmpty) {
        case true:
          {
            pDebugMessage = "-----";
            print('[CFlagDebug-mLogMessage-EMPTY]'
                '\n\tEMPTY message'
                '\n\t\tparams :'
                '\n\t\t\tmessage <$message>');
            break;
          }
        default:
          {
            pDebugMessage = message;
            print('[CFlagDebug-mLogMessage]'
                '\n\tlogged message :'
                '\n\t\t<$pDebugMessage>');
            break;
          }
      }
    } else {
      print('[CFlagDebug-mLogMessage-NO DEBUG]'
          '\n\tNOT in DEBUG mode'
          '\n\t\tdebug <$pDebug>'
          '\n\t\tparams :'
          '\n\t\t\tmessage <$message>');
    }
    return;
  }
}

///
/// =====
///

/// =====
/// function fGreetings
///   [function]
///     void fGreetings(CFlagDebug myDebug, String name)
///       [params]
///         CFlagDebug myDebug
///           object used for message logging
///         String name
///           name of person to gret
///       [errors]
///           [fGreetings-EMPTY]'
///                if EMPTY name
///   [goal]
///     print greetings to someone
///
void fGreetings(CFlagDebug myDebug, String name) {
  myDebug.mLogMessage('[fGreetings-CALLED]'
      '\n\tparams :'
      '\n\t\tmyDebug <$myDebug>'
      '\n\t\tname <$name>');

  if (name.isEmpty == false) {
    print('[fGreetings]'
        '\n\tHello $name'); // Print to console.
  } else {
    myDebug.mLogMessage('[fGreetings-EMPTY]'
        '\n\tEMPTY name'
        '\n\t\tparams :'
        '\n\t\t\t\tmyDebug <$myDebug>'
        '\n\t\t\t\tname <$name>');
  }
  myDebug.mLogMessage('[fGreetings-END]');
  return;
}

///
/// =====
///

// This is where the app starts executing
void main(List<String> arguments) {
  CFlagDebug myDebug = CFlagDebug(true, 'activate debug mode');

  String name = 'John'; // Declare and initialize a variable.
  fGreetings(myDebug, name); // Call a function.

  const String encodingConstString = 'en_US.UTF8 - not  ISO-8859-16';
  print('[main]'
      '\n\tencoding set : $encodingConstString');

  /// functional programming in Dart with fpdart package
  /// ----------------

  print(
      '[package:dart001/dart_application_1.dart - calculate 6*7] : ${dart_application_1.calculate()} !');

  /// ----------------

  /// Sum elements of a list
  const List<int> list = [1, 2, 3, 4];

  /// Functional solution
  var sumF = dart_application_1.sumListFold(list);
  print('[fpdart - list.fold] : $sumF');

  /// ----------------

  /// Composability
  /// Sum all elements of a list that are greater than 2
  /// Functional solution
  sumF = dart_application_1.sumListWhereFold(list);
  print('[fpdart - list.where.fold] : $sumF');

  /// ----------------

  /// Extreme example
  ///
  /// How can you achieve the same result with Imperative code?
  /// Is it even possible? 🤷‍
  sumF = dart_application_1.listETL(list);
  print(
      '[fpdart - list.where.plus.drop.intersect.map.take.first] : initial $list ETL to $sumF');

  /// ----------------

  /// No need to check for `null`
  Option<int> a = Option.of(3);

  /// [Option - getOrElse - True]
  sumF = dart_application_1.optionGetOrElse(a);
  print('[fpdart - Option - getOrElse - True] : $sumF');

  /// ----------------

  /// No need to check for `null
  a = none<int>();

  /// [Option - getOrElse - False]
  ///final resultFalse = b.getOrElse(() => 0) * 2;
  sumF = dart_application_1.optionGetOrElse(a);
  print('[fpdart - Option - getOrElse - False] : $sumF');

  /// ----------------

  /// [Option - list]
  /// ??? final Option<List<int>> c = [Option.of(3), none<int>(), Option.of(5)];
  /// No need to check for `null`
  /// /final resultList = c.getOrElse(() => 0) * 2;
  /// print('[fpdart - Option - list] : $resultList');

  /// ----------------

  /// Error handling using [Option - False] 🎉
  Option<double> myDivideResult = dart_application_1.divideF(3, 0);
  print('[fpdart - error handling - Option - False] : $myDivideResult');

  /// ----------------

  /// Error handling using [Option - True] 🎉
  myDivideResult = dart_application_1.divideF(3, 2);
  print('[fpdart - error handling - Option - True] : $myDivideResult');

  /// ----------------

  return;
}
