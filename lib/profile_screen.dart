import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    '@ Rezan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('images/foto 8.jpg'),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '@ Zannn',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileStat(value: '256', label: 'Following'),
                    ProfileStat(value: '256.7K', label: 'Followers'),
                    ProfileStat(value: '5.2M', label: 'Likes'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('Edit profile'),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('Share profile'),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.person_add_alt, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('230103111', style: TextStyle(color: Colors.white54)),
                const SizedBox(height: 20),
                const Divider(color: Colors.white24),
                const SizedBox(height: 10),
                const IconRow(),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      // ignore: unused_local_variable
                      final images = [
                    'images/foto 1.jpg',
                    'images/foto 2.jpg',
                    'images/foto 3.jpg',
                    'images/foto 4.jpg',
                    'images/foto5.jpg',
                    'images/foto6.jpg',
                  ];
                    return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[800],
                    ),
                  );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String value;
  final String label;

  const ProfileStat({required this.value, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.grid_on, color: Colors.white),
        Icon(Icons.lock_outline, color: Colors.white54),
        Icon(Icons.repeat, color: Colors.white54),
        Icon(Icons.bookmark_border, color: Colors.white54),
        Icon(Icons.favorite_border, color: Colors.white54),
      ],
    );
  }
}
