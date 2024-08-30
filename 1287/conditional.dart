import 'dart:io';

void main() {
  print('Enter a number: ');
  String? input = stdin.readLineSync();
  int number = int.tryParse(input ?? '') ?? 0;
  if (number > 0) {
    print('the number is positive');
  } else if (number < 0) {
    print('the number is negative');
  } else {
    print('number is zero');
  }
}
