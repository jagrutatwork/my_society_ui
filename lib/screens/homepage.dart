import 'package:flutter/material.dart';
import 'package:my_society/screens/login.dart';
import 'package:my_society/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Dashboard'),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('My Society', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.local_post_office),
              title: const Text('Society Updates'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.meeting_room),
              title: const Text('Meetings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Maintenance'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Society Chat'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Log Out'),
              onTap: () {
                _logOut(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pending Approvals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const Icon(Icons.local_shipping, color: Colors.orange),
                title: const Text('Amazon Package - Flat 402'),
                subtitle: const Text('Arrived at 10:30 AM'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Approve'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Past Deliveries', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Flipkart - Flat 402'),
                    subtitle: Text('Apr 27, 2:15 PM | Approved by Guard A'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Swiggy - Flat 305'),
                    subtitle: Text('Apr 26, 8:00 PM | Approved by Guard B'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Zomato - Flat 110'),
                    subtitle: Text('Apr 25, 7:45 PM | Approved by Guard A'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
   void _logOut(BuildContext context) async {
    // Clear the token or any other session data
    await ApiService.logout();

    // Redirect to login page after logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
