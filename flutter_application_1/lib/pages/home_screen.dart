import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  String searchQuery = '';
  double maxDistance = 50.0;

  Future<void> _fetchData() async {
    // Simulate fetching data from an API
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Nearby'),
      ),
      body: isLoading ? const SizedBox.expand(child: Center(child: CircularProgressIndicator())) 
      : const  Center(
        child: Column(
          children:  [
            
          ],
        ),
      ),
    );
  }
}