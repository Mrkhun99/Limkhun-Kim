void main() {
// //   // Map of pizza prices
// //   // const pizzaPrices = {
// //   //   'margherita': 5.5,
// //   //   'pepperoni': 7.5,
// //   //   'vegetarian': 6.5,
// //   // };

// //   // Example order
// //   // const order = ['margherita', 'pepperoni', 'pineapple'];

// //   // Your code

  Map<String, double>pizzaPrices = {
  'Margherita': 5.5, 
  'Pepperoni': 7.5, 
  'Vegetarian': 6.5, 
  };

  List<String> order = ['Margherita' , 'Pepperoni' , 'Sasuage'];
  double total = 0; 
  for(var number in order){
    if (pizzaPrices.containsKey(number)){
      total += pizzaPrices[number]!;
    } else {
      print("\" $number \" is out of stock");
    }
  };
  print("Total : \$$total");

}

