import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple responsive check
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.cloud_circle, color: Colors.indigo),
            SizedBox(width: 10),
            Text('CloudApp', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: isDesktop
            ? [
                TextButton(onPressed: () {}, child: const Text('Features')),
                TextButton(onPressed: () {}, child: const Text('Pricing')),
                TextButton(onPressed: () {}, child: const Text('About')),
                const SizedBox(width: 10),
                FilledButton(onPressed: () {}, child: const Text('Get Started')),
                const SizedBox(width: 20),
              ]
            : null, // Use drawer for mobile
      ),
      drawer: !isDesktop
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.cloud_circle, color: Colors.white, size: 48),
                        SizedBox(height: 10),
                        Text('CloudApp', style: TextStyle(color: Colors.white, fontSize: 24)),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Features'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.attach_money),
                    title: const Text('Pricing'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {},
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
              color: Colors.indigo.shade50,
              child: Column(
                children: [
                  const Text(
                    'Build Your Dream Web App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Launch your project faster with our modern, responsive Flutter template.\nScalable, secure, and ready for production.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.rocket_launch),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Text('Get Started Now', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Text('Learn More', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Features Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    const Text(
                      'Why Choose Us?',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Everything you need to succeed',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 50),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 40,
                          runSpacing: 40,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildFeatureCard(
                              icon: Icons.speed,
                              title: 'Lightning Fast',
                              description: 'Optimized for performance to ensure the best user experience.',
                            ),
                            _buildFeatureCard(
                              icon: Icons.security,
                              title: 'Secure by Default',
                              description: 'Enterprise-grade security features built right into the core.',
                            ),
                            _buildFeatureCard(
                              icon: Icons.devices,
                              title: 'Fully Responsive',
                              description: 'Looks amazing on desktops, tablets, and mobile devices.',
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey.shade900,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: const Column(
                children: [
                  Text(
                    '© 2024 CloudApp Inc. All rights reserved.',
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({required IconData icon, required String title, required String description}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.indigo, size: 32),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, height: 1.5),
          ),
        ],
      ),
    );
  }
}
