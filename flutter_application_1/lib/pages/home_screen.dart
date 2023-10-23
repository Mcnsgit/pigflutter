import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/user_service.dart';
import 'package:go_router/go_router.dart';
import '/widgets/filter_drawer.dart';
import '/pages/profile_page.dart';
import '/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> users;
  bool isLoading = true;
  String searchQuery = '';
  double maxDistance = 50.0;
  final scrollController = ScrollController();
  BottomNavBar bottomNavigationBar =   BottomNavBar ( goRouter: GoRouter(routes: []));

  Future<void> _fetchUsers() async {
    // Simulate a delay to make it look like you're fetching real data.
    await Future.delayed(const Duration(seconds: 2));

    users = List.generate(
      20,
      (index) => User(
        name: 'User $index',
        imageUrl: 'https://example.com/user$index.jpg',
        distance: (index + 1) * 2.5,
        age: 18 + index,
      ),
    );
  }

  void _applyFilters(Filters filters) {
    setState(() {
      isLoading = true;
    });

    List<User> filteredUsers = users
        .where(
            (user) => user.age >= filters.age && user.distance <= maxDistance)
        .toList();

    setState(() {
      users = filteredUsers;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers().then((_) {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearby users')),
      body: isLoading
          ? _buildLoadingPlaceholder()
          : users.isEmpty
              ? const Center(child: Text('No users found'))
              : _buildUserGrid(),
      drawer: _buildUserMenuDrawer(UserProfilePic(profileImageUrl: '', email: '', name:''  )), // User menu drawer
      endDrawer: _buildFilterDrawer(), 
      bottomNavigationBar:   BottomNavBar(goRouter: GoRouter(routes: []),),
       );
  }

  Widget _buildLoadingPlaceholder() {
    // You can use a GridView.builder for the loading placeholder.
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
      ),
      itemCount: 20, // Number of placeholders
      itemBuilder: (context, index) {
        return const Card(
          child: Column(
            children: [
              Placeholder(
                fallbackHeight: 120,
                fallbackWidth: 120,
              ),
              Placeholder(
                fallbackHeight: 20,
              ),
              Placeholder(
                fallbackHeight: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
      ),
      controller: scrollController,
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(user: user),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  user.imageUrl,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                Text(user.name),
                Text('${user.distance} km away'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserMenuDrawer(UserProfilePic userProfilePic) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('User Name'), // Replace with user's name
            accountEmail: const Text('user@example.com'), // Replace with user's email
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(userProfilePic.profileImageUrl),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings screen or add functionality here.
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {
              // Navigate to edit profile screen or add functionality here.
            },
          ),
          ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            // Perform logout or add functionality here.
          },
        ),
        ],
      ),
    );
  }

  Widget _buildFilterDrawer() {
    // You can customize the filter drawer as needed.
    return Drawer(
      child: FilterDrawer(
        onApplyFilters: _applyFilters,
      ),
    );
  }
}
