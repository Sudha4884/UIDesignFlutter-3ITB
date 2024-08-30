import 'dart:io';

void main() {
  print('Enter a number:');
  String? input = stdin.readLineSync();  // Read user input
  int number = int.tryParse(input ?? '') ?? 0;  // Convert input to integer

  if (number > 0) {
    print('The number is positive.');
  } else if (number < 0) {
    print('The number is negative.');
  } else {
    print('The number is zero.');
  }
}
