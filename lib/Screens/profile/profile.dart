import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'My profile',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/women1.png'), // Replace with your image asset path
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Matilda Brown',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'matildabrown@mail.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildProfileOption('My orders', 'Already have 12 orders'),
              _buildProfileOption('Shipping addresses', '3 addresses'),
              _buildProfileOption('Payment methods', 'Visa **34'),
              _buildProfileOption('Promocodes', 'You have special promocodes'),
              _buildProfileOption('My reviews', 'Reviews for 4 items'),
              _buildProfileOption('Settings', 'Notifications, password'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, String subtitle) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // Handle option tap
          },
        ),
        Divider(),
      ],
    );
  }
}
