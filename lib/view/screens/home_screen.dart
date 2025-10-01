import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/sharedPreference.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: _buildBottomActions(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            _buildTopAppBar(context),
            const SizedBox(height: 8),
            _buildInfoCards(),
            const SizedBox(height: 12),
            _buildTodayTableSection(),
            const SizedBox(height: 8),

            const Text(
              "Pending Items",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            _buildPendingItemCard(),
            const SizedBox(height: 10),
            _buildPendingItemCard(),
            const SizedBox(height: 10),
            _buildPendingItemCard(),
            const SizedBox(height: 10),
            _buildPendingItemCard(),
            const SizedBox(height: 10),

            const Text(
              "Served Items",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            const SizedBox(height: 20),

            const Text(
              "Canceled Items",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            _buildServedAndCanceledItemCard(),
            const SizedBox(height: 8),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Top App Bar
  Widget _buildTopAppBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 30, color: Color(0xFF218C4E)),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // ✅ Works now
              },
            );
          },
        ),
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        _buildNotificationButton(),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF218C4E), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.notifications_outlined,
            size: 24,
            color: Color(0xFF218C4E),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCards() {
    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            title: "Total Tips Earned",
            amount: "\$0",
            backgroundColor: Colors.blue[50]!,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildInfoCard(
            title: "Total Orders Served",
            amount: "0",
            backgroundColor: Colors.green[50]!,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String amount,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Accepted Table Section
  Widget _buildTodayTableSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Accepted Table",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTableButton("Table 1", true),
              const SizedBox(width: 8),

              _buildTableButton("Table 2", false),
              const SizedBox(width: 8),

              _buildTableButton("Table 3", false),
              const SizedBox(width: 8),

              _buildTableButton("Table 4", false),
              const SizedBox(width: 8),

              _buildTableButton("Table 5", false),
              const SizedBox(width: 8),

              _buildTableButton("Table 6", false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF218C4E) : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF218C4E),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Pending/Served Item Card
  Widget _buildPendingItemCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://i.imgur.com/5VfF9Qp.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Kurkure Momos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Delicious",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "1 × AED 250",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildItemButton(
                    "Cancel Item",
                    const Color(0xFF218C4E),
                    const Color(0xFF218C4E),
                    const Color(0xFF218C4E),
                    onTap: () {
                      // Handle cancel item
                    },
                  ),
                ),
                const SizedBox(width: 8), // Fixed: width instead of height
                Expanded(
                  child: _buildItemButton(
                    "Served",
                    Colors.white,
                    const Color(0xFF218C4E),
                    const Color(0xFF218C4E),
                    isFilled: true,
                    onTap: () {
                      // Handle served item
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServedAndCanceledItemCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://i.imgur.com/5VfF9Qp.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Kurkure Momos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Delicious",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "1 × AED 250",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Fixed Bottom Actions (not scrolling)
  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.only(right: 8, top: 8, left: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionButton("View Bill Details", isFilled: true, onTap: () {}),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Cancel Order",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text, {
    bool isFilled = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: isFilled ? const Color(0xFF218C4E) : Colors.white,
          border: Border.all(color: const Color(0xFF218C4E)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isFilled ? Colors.white : const Color(0xFF218C4E),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  // Item button with proper sizing
  Widget _buildItemButton(
    String text,
    Color fg,
    Color border,
    Color bg, {
    bool isFilled = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: isFilled ? bg : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isFilled ? Colors.white : fg,
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove default padding
        children: [
          // Drawer Header
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF218C4E)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "John Doe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Drawer Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => Navigator.pop(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              SharedPref.setBool(PrefKeys.isLogin, false);
              SharedPref.setString(PrefKeys.userToken, '');
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
