import 'dart:io';

void main() {
  print('Enter a number between 1 and 5:');
  String? input = stdin.readLineSync(); 
  int number = int.tryParse(input ?? '') ?? 0; 

  switch (number) {
    case 1:
      print('You entered number one.');
      break;
    case 2:
      print('You entered number two.');
      break;
    case 3:
      print('You entered number three.');
      break;
    case 4:
      print('You entered number four.');
      break;
    case 5:
      print('You entered number five.');
      break;
    default:
      print('Invalid number. Please enter a number between 1 and 5.');
      break;
  }
}
