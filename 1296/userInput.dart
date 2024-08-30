import 'dart:io';
void main()
{
  print("Enter text");
  String? name = stdin.readLineSync();
  print("Enter number");
  int? n=int.parse(stdin.readLineSync()!);
  print(name);
  print(n);

}
