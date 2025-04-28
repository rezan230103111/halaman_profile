import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool temaDark = true; // Awal tema dark

  void gantiTema() {
    setState(() {
      temaDark = !temaDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: temaDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: temaDark ? Colors.black : Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              temaDark ? Icons.wb_sunny : Icons.nightlight_round,
              color: temaDark ? Colors.white : Colors.black,
            ),
            onPressed: gantiTema, // Panggil fungsi ganti tema
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const IconRow(),

                const SizedBox(height: 10),
                Center(
                  child: Text(
                    '@ Rezan',
                    style: TextStyle(
                      color: temaDark ? Colors.white : Colors.black,
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
                          border: Border.all(
                            color: temaDark ? Colors.black : Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                username(),
                const SizedBox(height: 20),
                follower(),
                const SizedBox(height: 20),
                edit(),
                const SizedBox(height: 10),
                bio(),
                const SizedBox(height: 20),
                Divider(color: temaDark ? Colors.white24 : Colors.black26),
                const SizedBox(height: 10),
                const IconRow(),
                const SizedBox(height: 10),
                Expanded(
                  child: galery(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GridView galery() {
    final images = [
      'images/foto 1.jpg',
      'images/foto 2.jpg',
      'images/foto 3.jpg',
      'images/foto 4.jpg',
      'images/foto5.jpg',
      'images/foto6.jpg',
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
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
    );
  }

  Text bio() => Text(
        '230103111',
        style: TextStyle(
          color: temaDark ? Colors.white54 : Colors.black54,
        ),
      );

  Row edit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: temaDark ? Colors.white : Colors.black),
            foregroundColor: temaDark ? Colors.white : Colors.black,
          ),
          onPressed: () {},
          child: const Text('Edit profile'),
        ),
        const SizedBox(width: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: temaDark ? Colors.white : Colors.black),
            foregroundColor: temaDark ? Colors.white : Colors.black,
          ),
          onPressed: () {},
          child: const Text('Share profile'),
        ),
        const SizedBox(width: 10),
        Icon(Icons.person_add_alt, color: temaDark ? Colors.white : Colors.black),
      ],
    );
  }

  Row follower() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileStat(value: '256', label: 'Following'),
        ProfileStat(value: '256.7K', label: 'Followers'),
        ProfileStat(value: '5.2M', label: 'Likes'),
      ],
    );
  }

  Text username() {
    return Text(
      '@ Zannn',
      style: TextStyle(
        color: temaDark ? Colors.white : Colors.black,
        fontSize: 16,
      ),
    );
  }
}

class Bakso extends StatelessWidget {
  const Bakso({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Edit bio...',
        hintStyle: TextStyle(color: Colors.white54),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
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
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
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
