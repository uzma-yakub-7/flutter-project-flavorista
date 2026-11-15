class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.rating,
    required this.emoji,
    required this.menu,
  });

  final String id;
  final String name;
  final String category;
  final String description;
  final double rating;
  final String emoji;
  final List<MenuItem> menu;
}

class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.emoji,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String emoji;
}

const sampleRestaurants = <Restaurant>[
  Restaurant(
    id: 'r1',
    name: 'The Cozy Kitchen',
    category: 'Comfort Food',
    description: 'Comforting favourites made fresh for every order.',
    rating: 4.8,
    emoji: '🍲',
    menu: [
      MenuItem(id: 'm1', name: 'Creamy Pasta', description: 'Pasta in a creamy herb sauce.', price: 320, category: 'Main', emoji: '🍝'),
      MenuItem(id: 'm2', name: 'Grilled Sandwich', description: 'Toasted sandwich with fresh fillings.', price: 220, category: 'Snacks', emoji: '🥪'),
    ],
  ),
  Restaurant(
    id: 'r2',
    name: 'Slice & Spice',
    category: 'Pizza',
    description: 'Freshly baked slices with delicious toppings.',
    rating: 4.6,
    emoji: '🍕',
    menu: [
      MenuItem(id: 'm3', name: 'Classic Pizza', description: 'Cheese, tomato and herbs.', price: 550, category: 'Main', emoji: '🍕'),
      MenuItem(id: 'm4', name: 'Garlic Bread', description: 'Toasted bread with garlic butter.', price: 180, category: 'Snacks', emoji: '🥖'),
    ],
  ),
  Restaurant(
    id: 'r3',
    name: 'Sweet Corner',
    category: 'Desserts',
    description: 'A little sweetness for your day.',
    rating: 4.7,
    emoji: '🍰',
    menu: [
      MenuItem(id: 'm5', name: 'Chocolate Cake', description: 'Soft chocolate cake slice.', price: 190, category: 'Dessert', emoji: '🍰'),
      MenuItem(id: 'm6', name: 'Cold Coffee', description: 'Chilled coffee-style beverage.', price: 160, category: 'Beverages', emoji: '🥤'),
    ],
  ),
];
