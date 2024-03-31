import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF21899C), // Set the app bar color here
        ),
        primaryColor: const Color(0xFF21899C),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF23A0C9),
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Set app bar color here
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('User Profile'),
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor, // Set drawer header color here
              ),
            ),
            ListTile(
              title: Text('Edit Details'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditDetailsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Perform log out action here
                Navigator.popUntil(context, ModalRoute.withName('/')); // Go back to the first screen
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildFunctionalityCard(
            context,
            'Mess Payment',
            Icons.payment,
                () {
              // Add functionality for mess payment here
            },
          ),
          _buildFunctionalityCard(
            context,
            'Add Request',
            Icons.add,
                () {
              // Add functionality for adding request here
            },
          ),
          _buildFunctionalityCard(
            context,
            'Mess Updates',
            Icons.update,
                () {
              // Add functionality for mess updates here
            },
          ),
          _buildFunctionalityCard(
            context,
            'Contact',
            Icons.contact_phone,
                () {
              // Add functionality for contact here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionalityCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF23A0C9), // Set the card background color here
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Set app bar color here
      ),
      body: Center(
        child: Text('Edit User Details Here'),
      ),
    );
  }
}
