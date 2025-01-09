import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.2, // Responsif
                  backgroundImage: const NetworkImage(
                    'https://images.pexels.com/photos/28838879/pexels-photo-28838879/free-photo-of-fashionable-woman-posing-outdoors-by-gate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: size.width * 0.35, // Responsif
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
            _buildProfileOption(
              icon: Icons.star,
              title: 'My Membership',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.bookmark,
              title: 'My Collection',
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
            _buildProfileOption(
              icon: Icons.logout,
              title: 'Logout',
              iconColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color iconColor = Colors.black,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
