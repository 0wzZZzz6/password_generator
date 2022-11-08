library password_generator;

import 'dart:math';

class PasswordGenerator {
  //Define the allowed chars to use in the password
  final String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  final String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final String _numbers = "0123456789";
  final String _special = "-_=+[]{}!@#\$%^&*();:'|\\,<.>/?`";

  // ignore: slash_for_doc_comments
  /**
 * @desc Function to generate password based on some criteria
 * @param bool _isWithLetters: password must contain letters
 * @param bool _isWithUppercase: password must contain uppercase letters
 * @param bool _isWithNumbers: password must contain numbers
 * @param bool _isWithSpecial: password must contain special chars
 * @param int _numberCharPassword: password length
 * @return string: new password
 */
  String generatePassword({
    bool isWithLetters = true,
    bool isWithUppercase = true,
    bool isWithNumbers = true,
    bool isWithSpecial = true,
    int numberCharPassword = 12,
  }) {
    //Create the empty string that will contain the allowed chars
    String allowedChars = "";

    //Put chars on the allowed ones based on the input values
    allowedChars += (isWithLetters ? _lowerCaseLetters : '');
    allowedChars += (isWithUppercase ? _upperCaseLetters : '');
    allowedChars += (isWithNumbers ? _numbers : '');
    allowedChars += (isWithSpecial ? _special : '');

    int i = 0;
    String result = "";
    List<String> newChars = allowedChars.split('');
    newChars.shuffle();

    //Create password
    while (i < numberCharPassword) {
      //Get random int
      int randomInt = Random.secure().nextInt(newChars.length);
      //Get random char and append it to the password
      result += newChars[randomInt];
      i++;
    }

    return result;
  }
}
