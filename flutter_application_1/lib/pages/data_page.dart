import 'package:flutter/material.dart';
import '../service/data_service.dart';  // Update with your actual path

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State <DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Future<Map<String, dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = DataService().fetchData('https://gaymeatup-default-rtdb.europe-west1.firebasedatabase.app/');}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Page')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Replace with your own logic to display data
            return const Center(child: Text('Data Loaded'));
          }
        },
      ),
    );
  }
}
