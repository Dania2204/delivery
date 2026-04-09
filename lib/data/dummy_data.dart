import '../models/burger.dart';

class DummyData {
  static final List<Burger> burgers = [
    Burger(
      id: '1',
      name: 'Cheeseburger',
      subtitle: "Wendy's Burger",
      rating: 4.9,
      timeMins: 26,
      description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      price: 8.24,
      imageUrl: 'assets/burger1.png',
    ),
    Burger(
      id: '2',
      name: 'Hamburger',
      subtitle: 'Veggie Burger',
      rating: 4.8,
      timeMins: 14,
      description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
      price: 9.99,
      imageUrl: 'assets/burger2.png',
    ),
    Burger(
      id: '3',
      name: 'Hamburger',
      subtitle: 'Chicken Burger',
      rating: 4.6,
      timeMins: 42,
      description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      price: 12.48,
      imageUrl: 'assets/burger3.png',
    ),
    Burger(
      id: '4',
      name: 'Fried Chicken Burger',
      subtitle: 'Fried Chicken Burger',
      rating: 4.8,
      timeMins: 14,
      description: "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      price: 26.99,
      imageUrl: 'assets/burger4.png',
    ),
  ];
}
