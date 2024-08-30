import 'dart:io';

void main() {
  print("Enter a number between 1 and 3:");
  String? input = stdin.readLineSync();
  int number = int.tryParse(input ?? '') ?? 0;
  switch (number) {
    case 1:
      print('your number is 1');
      break;
    case 2:
      print('your number is 2');
      break;
    case 3:
      print('your number is 3');
      break;
    default:
      print('Invalid number');
      break;
  }
}
