import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_Item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    // burgers
    Food(name: "Ultimate BBQ Burger",
        description: "A signature BBQ burger with rich BBQ sauce, melted cheese, fresh lettuce, and tomatoes.",
        imagePath: 'images/burgers/ultimate_bbq.jpg',
        price: 0.99,
        category: FoodCategory.burgers,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Sriracha Madness Burger",
        description: "Burger with spicy Sriracha sauce, creamy cheese, pickles, and crispy onions.",
        imagePath: 'images/burgers/siracha_madness.jpg',
        price: 0.89,
        category: FoodCategory.burgers,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Truffle Delight Burger",
        description: "Burger topped with premium truffle sauce, Mozzarella cheese, greens, and tomatoes.",
        imagePath: 'images/burgers/truffle_delight.jpg',
        price: 0.99,
        category: FoodCategory.burgers,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Crispy Chicken Ranch Burger",
        description: "Crispy chicken burger with cool Ranch dressing, pickles, tomatoes, and lettuce.",
        imagePath: 'images/burgers/crispy_chicken.jpg',
        price: 0.99,
        category: FoodCategory.burgers,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Vegan Beyond Burger",
        description: "Vegan burger featuring Beyond Meat patty, Spicy Chipotle sauce, greens, and pickles.",
        imagePath: 'images/burgers/vegan_beyond.jpg',
        price: 0.99,
        category: FoodCategory.burgers,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Vegan Beyond Burger",
        description: "Vegan burger featuring Beyond Meat patty, Spicy Chipotle sauce, greens, and pickles.",
        imagePath: 'images/burgers/vegan_beyond.jpg',
        price: 0.99,
        category: FoodCategory.burgers,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),


    // sides
    Food(name: "Crispy Onion Rings",
        description: "Onion rings deep-fried to a crispy golden brown, served with a tangy dipping sauce.",
        imagePath: "images/sides/1.jpg",
        price: 0.99,
        category: FoodCategory.sides,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Garlic Parmesan Fries",
        description: "Crispy fries tossed with garlic, Parmesan cheese, and herbs, served with a creamy dipping sauce.",
        imagePath: "images/sides/2.jpg",
        price: 1.5,
        category: FoodCategory.sides,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Caesar Salad",
        description: "Fresh romaine lettuce tossed with Caesar dressing, Parmesan cheese, and croutons.",
        imagePath: "images/sides/3.jpg",
        price: 1.2,
        category: FoodCategory.sides,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Sweet Potato Fries",
        description: "Sweet potato fries lightly seasoned and baked until crispy, served with a side of spicy mayo.",
        imagePath: "images/sides/4.jpg",
        price: 1.33,
        category: FoodCategory.sides,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Mozzarella Sticks",
        description: "Golden fried mozzarella sticks with a crispy coating, served with marinara sauce.",
        imagePath: "images/sides/1.jpg",
        price: 0.99,
        category: FoodCategory.sides,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),

    // salads
    Food(name: "Greek Salad",
        description: "Fresh lettuce, tomatoes, cucumbers, red onions, Kalamata olives, and Feta cheese with Greek dressing.",
        imagePath: "images/salads/1.jpg",
        price: 2.5,
        category: FoodCategory.salads,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Classic Caesar Salad",
        description: "Romaine lettuce, croutons, and Parmesan cheese tossed in Caesar dressing.",
        imagePath: "images/salads/2.jpg",
        price: 1.65,
        category: FoodCategory.salads,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Crispy Onion Rings",
        description: "Onion rings deep-fried to a crispy golden brown, served with a tangy dipping sauce.",
        imagePath: "images/sides/3.jpg",
        price: 1.65,
        category: FoodCategory.salads,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Crispy Onion Rings",
        description: "Onion rings deep-fried to a crispy golden brown, served with a tangy dipping sauce.",
        imagePath: "images/sides/4.jpg",
        price: 1.65,
        category: FoodCategory.salads,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),
    Food(name: "Crispy Onion Rings",
        description: "Onion rings deep-fried to a crispy golden brown, served with a tangy dipping sauce.",
        imagePath: "images/sides/5.jpg",
        price: 1.65,
        category: FoodCategory.salads,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 1.20),
          Addon(name: "Bacon", price: 1.20),
          Addon(name: "Advocado", price: 1.50),
        ]),

    // desserts
    Food(name: "Classic Chocolate Brownie",
        description: "Rich and gooey chocolate brownie served warm with a scoop of vanilla ice cream and chocolate sauce.",
        imagePath: "images/desserts/1.jpg",
        price: 2.6,
        category: FoodCategory.desserts,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "New York Cheesecake",
        description: "Creamy and decadent cheesecake with a graham cracker crust, served with raspberry coulis.",
        imagePath: "images/desserts/2.jpg",
        price: 2.6,
        category: FoodCategory.desserts,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Mango Sorbet",
        description: "Refreshing mango sorbet served in a chilled bowl with fresh berries on the side.",
        imagePath: "images/desserts/3.jpg",
        price: 2.6,
        category: FoodCategory.desserts,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Tiramisu",
        description: "Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese, dusted with cocoa powder.",
        imagePath: "images/desserts/4.jpg",
        price: 2.6,
        category: FoodCategory.desserts,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Fruit Tart",
        description: "Crisp pastry shell filled with pastry cream and topped with assorted fresh fruits and a light glaze.",
        imagePath: "images/desserts/5.jpg",
        price: 2.6,
        category: FoodCategory.desserts,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),

    // drinks
    Food(name: "Iced Caramel Macchiato",
        description: "Espresso blended with caramel syrup and milk, topped with whipped cream and caramel drizzle.",
        imagePath: "images/drinks/1.jpg",
        price: 2.6,
        category: FoodCategory.drinks,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Fresh Strawberry Smoothie",
        description: "Blend of fresh strawberries, yogurt, and a hint of honey, served chilled.",
        imagePath: "images/drinks/2.jpg",
        price: 2.6,
        category: FoodCategory.drinks,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Mint Lemonade",
        description: "Refreshing lemonade infused with fresh mint leaves and served over ice.",
        imagePath: "images/drinks/3.jpg",
        price: 2.6,
        category: FoodCategory.drinks,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Iced Matcha Latte",
        description: "Japanese green tea powder mixed with milk and served over ice.",
        imagePath: "images/drinks/4.jpg",
        price: 2.6,
        category: FoodCategory.drinks,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),
    Food(name: "Iced Matcha Latte",
        description: "Japanese green tea powder mixed with milk and served over ice.",
        imagePath: "images/drinks/4.jpg",
        price: 2.6,
        category: FoodCategory.drinks,
        availbleAddons: [
          Addon(name: "Extra Cheese", price: 2.65),
          Addon(name: "Bacon", price: 2.85),
          Addon(name: "Advocado", price: 2.9),
        ]),

  ];

  // GETTER
  List<Food> get menu => _menu;
  List<CartItems> get cart => _cart;

  //OPERATION

    //User cart
  final List<CartItems> _cart = [];

    //Add to cart
  void addToCart (Food food, List<Addon> selectedAddons, int quantity) {

    //Check xem có cái item nào trong cart trùng với item vừa thêm vào không
    CartItems? cartItem = _cart.firstWhereOrNull((item) {
      //Kiểm tra xem các item food có giống nhau
      bool isSameFood = item.food == food;
      //Check nếu danh sách addons chọn có giống nhau
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });



    //If item đã tồn tại, tăng quantity
    if (cartItem != null){
      cartItem.quantity++;
    }
    //Nếu không thì tạo cart item mới
    else{
      _cart.add(
        CartItems(food: food, selectedAddons: selectedAddons, quantity:  quantity)
      );
    } notifyListeners();
  }
    void removeQuantity(CartItems cartItems){
    if (cartItems.quantity>1){
      cartItems.quantity--;
    }else{return;} notifyListeners();
    }

    //Remove from cart
    void removeFromCart (CartItems cartItems) {
    int cartIndex=_cart.indexOf(cartItems);
    if (cartIndex!=-1){
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
    }
    //Get total price in cart
    double getTotalPrice (){
    double totalPrice = 0;
    double total = 0;

    for (CartItems cartItems in _cart){
      double itemTotal = cartItems.food.price;
      for(Addon addon in cartItems.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItems.quantity;
    }
    return total;
    }

    //Get total items number of cart
  int getTotalItem(){
    int totalItems= 0;
    for(CartItems cartItems in _cart){
      totalItems+= cartItems.quantity;
    }
    return totalItems;
  }
    //Clear cart
  void clearCart(){
    _cart.clear();

    notifyListeners();
  }


  //HELPERS
    //Generate a receipt
    String displayCartReceipt(){
      final receipt = StringBuffer();
      receipt.writeln("Here is your receipt.");
      receipt.writeln();

      //format the date to include up to second only
        String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
      receipt.writeln(formattedDate);
      receipt.writeln();
      receipt.writeln("-----------------");

      for (final cartItems in cart){
        receipt.writeln("${cartItems.quantity} x ${cartItems.food.name} - ${_formatPrice(cartItems.food.price)}");
        if (cartItems.selectedAddons.isNotEmpty){
          receipt.writeln("   Add-ons: ${_formatAddons(cartItems.selectedAddons)}");
        }
        receipt.writeln();
      }
      receipt.writeln("-----------------");
      receipt.writeln();
      receipt.writeln("Total Items: ${getTotalItem()}");
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
      return receipt.toString();
    }

    String _formatPrice(double price){
      return "\$${price.toStringAsFixed(2)}";
    }
    //Format double value into money
    String _formatAddons(List<Addon> addons){
     return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)}").join(", ");
    }
    //Format list of Addons into a String Summary


}