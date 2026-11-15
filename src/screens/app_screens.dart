import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import '../providers/app_providers.dart';
import '../widgets/common_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(30)),
                  child: const Center(child: Text('🍽️', style: TextStyle(fontSize: 58))),
                ),
                const SizedBox(height: 26),
                Text('Flavorista', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Good food. Easy choices. A better way to manage your restaurant experience.',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                PrimaryButton(
                  label: 'Get started',
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                  child: const Center(child: Text('Create an account')),
                ),
              ],
            ),
          ),
        ),
      );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('Welcome back!', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder()),
                  validator: (v) => v == null || !v.contains('@') ? 'Enter a valid email address' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder()),
                  validator: (v) => v == null || v.length < 6 ? 'Password must contain at least 6 characters' : null,
                ),
                const SizedBox(height: 22),
                PrimaryButton(
                  label: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeShell()), (_) => false);
                    }
                  },
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                  child: const Text('New here? Create an account'),
                ),
                const Text('Demo form only — connect authentication in a later phase.', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      );
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Create account')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text('Join Flavorista', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 22),
                TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'Full name', border: OutlineInputBorder()),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Name is required' : null),
                const SizedBox(height: 14),
                TextFormField(controller: _email, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    validator: (v) => v == null || !v.contains('@') ? 'Enter a valid email' : null),
                const SizedBox(height: 14),
                TextFormField(controller: _password, obscureText: true, decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                    validator: (v) => v == null || v.length < 6 ? 'Use at least 6 characters' : null),
                const SizedBox(height: 22),
                PrimaryButton(label: 'Create account', onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeShell()), (_) => false);
                  }
                }),
                const SizedBox(height: 10),
                const Text('Demo form only — no account is stored or created on a server.', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      );
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;
  final _pages = const [HomeScreen(), RestaurantListScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _pages[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (value) => setState(() => _index = value),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.restaurant_menu), label: 'Restaurants'),
            NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Hello, food lover 👋', style: Theme.of(context).textTheme.titleMedium),
                Text('What are you craving?', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ])),
              CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primaryContainer, child: const Icon(Icons.restaurant, color: Colors.deepOrange)),
            ]),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(22)),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('A delicious day starts here', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Explore restaurants and find something you love.'),
              ]),
            ),
            const SectionTitle('Categories'),
            Wrap(spacing: 9, runSpacing: 9, children: ['🍔 Burgers', '🍕 Pizza', '🍚 Rice', '🍰 Desserts', '🥤 Beverages'].map((e) => Chip(label: Text(e))).toList()),
            const SectionTitle('Popular restaurants'),
            ...sampleRestaurants.map((r) => RestaurantTile(restaurant: r)),
          ],
        ),
      );
}

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('Restaurants', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text('Browse places and explore their menus.'),
            const SizedBox(height: 12),
            ...sampleRestaurants.map((r) => RestaurantTile(restaurant: r)),
          ],
        ),
      );
}

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: CircleAvatar(radius: 28, child: Text(restaurant.emoji, style: const TextStyle(fontSize: 27))),
          title: Text(restaurant.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${restaurant.category}  •  ⭐ ${restaurant.rating}\n${restaurant.description}', maxLines: 2, overflow: TextOverflow.ellipsis),
          isThreeLine: true,
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RestaurantDetailScreen(restaurant: restaurant))),
        ),
      );
}

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(restaurant.name)),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(child: Text(restaurant.emoji, style: const TextStyle(fontSize: 76))),
            Text(restaurant.name, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
            Text('${restaurant.category}  •  ⭐ ${restaurant.rating}', textAlign: TextAlign.center),
            const SectionTitle('About'),
            Text(restaurant.description),
            const SectionTitle('Menu items'),
            ...restaurant.menu.map((item) => MenuItemTile(item: item)),
          ],
        ),
      );
}

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({super.key, required this.item});
  final MenuItem item;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Text(item.emoji, style: const TextStyle(fontSize: 30)),
          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${item.description}\n৳${item.price.toStringAsFixed(0)}'),
          isThreeLine: true,
          trailing: IconButton(
            tooltip: 'Add to cart',
            icon: const Icon(Icons.add_circle, color: Colors.deepOrange),
            onPressed: () {
              context.read<CartProvider>().add(item);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.name} added to cart')));
            },
          ),
        ),
      );
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CartProvider>(
        builder: (context, cart, _) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your cart', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 14),
                if (cart.items.isEmpty)
                  const Expanded(child: EmptyState(icon: Icons.shopping_bag_outlined, title: 'Your cart is empty', message: 'Explore restaurants and add something delicious.'))
                else ...[
                  Expanded(
                    child: ListView(
                      children: cart.items.map((entry) => Card(
                        child: ListTile(
                          title: Text(entry.item.name),
                          subtitle: Text('৳${entry.item.price.toStringAsFixed(0)} × ${entry.quantity} = ৳${entry.total.toStringAsFixed(0)}'),
                          leading: Text(entry.item.emoji, style: const TextStyle(fontSize: 28)),
                          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(onPressed: () => cart.decrease(entry.item.id), icon: const Icon(Icons.remove_circle_outline)),
                            Text('${entry.quantity}'),
                            IconButton(onPressed: () => cart.add(entry.item), icon: const Icon(Icons.add_circle_outline)),
                          ]),
                        ),
                      )).toList(),
                    ),
                  ),
                  const Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('৳${cart.subtotal.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ]),
                  const SizedBox(height: 12),
                  PrimaryButton(label: 'Continue to checkout (demo)', onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Checkout is planned for Phase 2.')));
                  }),
                  TextButton(onPressed: cart.clear, child: const Text('Clear cart')),
                ],
              ],
            ),
          ),
        ),
      );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('Profile & settings', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const CircleAvatar(radius: 38, child: Icon(Icons.person, size: 42)),
            const SizedBox(height: 10),
            const Text('Guest User', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Demo profile', textAlign: TextAlign.center),
            const SectionTitle('Preferences'),
            Consumer<ThemeProvider>(
              builder: (context, theme, _) => SwitchListTile(
                title: const Text('Dark theme'),
                subtitle: const Text('Theme preference is saved locally.'),
                value: theme.isDark,
                onChanged: (_) => theme.toggleTheme(),
              ),
            ),
            const ListTile(leading: Icon(Icons.receipt_long), title: Text('Order history'), subtitle: Text('Planned for Phase 2')),
            const ListTile(leading: Icon(Icons.favorite_border), title: Text('Favorites'), subtitle: Text('Basic favorite state is prepared')),
            const ListTile(leading: Icon(Icons.notifications_none), title: Text('Notifications'), subtitle: Text('Planned for Phase 2')),
          ],
        ),
      );
}
