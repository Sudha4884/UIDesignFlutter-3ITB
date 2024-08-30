void main()
{
  var firstname = "pragnya";
  var secondname = "chandra";
  print("full name is $firstname $secondname");
  int num1 = 16;
  int num2 = 18 ;
  int add = num1+num2;
  int sub = num1-num2;
  int mul = num1*num2;
  double div = num1 / num2;
  print("addition is $add \nsubtraction is $sub \nmultiplication is $mul \ndivision is $div");
  bool access = false;
  print("is access allowed : $access");
  double price = 123456.99820766432;
  print(price.toStringAsFixed(2));
  String number = "25";
  print("Type of strvalue is ${number.runtimeType}"); 
  int intvalue = int.parse(number);
  print("Value of intvalue is $intvalue");
  print("Type of intvalue is ${intvalue.runtimeType}");
}


