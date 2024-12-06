import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/28838879/pexels-photo-28838879/free-photo-of-fashionable-woman-posing-outdoors-by-gate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.teal,
                    onPressed: () {},
                    child: const Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Widya Shabina',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Traveler',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.black),
              title: const Text('My Membership'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bookmark, color: Colors.black),
              title: const Text('My Collection'),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '24',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
