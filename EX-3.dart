
// Exercise 3
void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  
  // You code
 var numbers = [45, 67, 82, 49, 51, 78, 92, 30];
 var results = numbers.where((n) => n > 50);

 print(results.toList());
 print("5 Students passed");

 
}