import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Service Pricing Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PricingPage(),
    );
  }
}

class PricingPage extends StatelessWidget {
  const PricingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PricingData> pricingPlans = [
      PricingData(
        badgeText: '',
        icon: Icons.storage, // Icon untuk Basic (storage)
        serviceName: 'Basic',
        description: 'Untuk pemula',
        price: 'Rp 500.000',
        duration: '1 month',
        features: [
          'Hosting 10GB',
          'Bandwidth 100GB',
          'Email 5 akun',
          'SSL Basic',
          'Support Email',
        ],
        backgroundColor: Colors.grey[50],
      ),
      PricingData(
        badgeText: 'Rekomendasi',
        icon: Icons.laptop, // Icon untuk Professional (laptop)
        serviceName: 'Professional',
        description: 'Paling populer',
        price: 'Rp 5.000.000',
        duration: '1 month',
        features: [
          'Hosting unlimited',
          'Bandwidth unlimited',
          'Email unlimited',
          'SSL Premium',
          'Support 24/7',
          'Database unlimited',
        ],
        backgroundColor: Colors.blue[50],
        isFeatured: true,
      ),
      PricingData(
        badgeText: '',
        icon: Icons.cloud, // Icon untuk Enterprise (cloud)
        serviceName: 'Enterprise',
        description: 'Untuk korporasi',
        price: 'Custom',
        duration: 'Hubungi kami',
        features: [
          'Dedicated Server',
          'Custom Domain',
          'API Access',
          'Priority Support',
          'Backup Harian',
          'Konsultasi Gratis',
        ],
        backgroundColor: Colors.amber[50],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('IT Service Pricing'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Pilih Paket Layanan Terbaik',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Solusi cloud terlengkap dengan harga terjangkau',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              // Responsive grid layout
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: pricingPlans
                    .map((plan) => PricingCard(
                          badgeText: plan.badgeText,
                          icon: plan.icon,
                          serviceName: plan.serviceName,
                          description: plan.description,
                          price: plan.price,
                          duration: plan.duration,
                          features: plan.features,
                          backgroundColor: plan.backgroundColor ?? Colors.white,
                          isFeatured: plan.isFeatured,
                          onPressedButton: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Paket ${plan.serviceName} dipilih!'),
                              ),
                            );
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PricingData {
  final String badgeText;
  final IconData icon;
  final String serviceName;
  final String description;
  final String price;
  final String duration;
  final List<String> features;
  final Color? backgroundColor;
  final bool isFeatured;

  PricingData({
    required this.badgeText,
    required this.icon,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.duration,
    required this.features,
    this.backgroundColor,
    this.isFeatured = false,
  });
}

class PricingCard extends StatefulWidget {
  final String badgeText;
  final IconData icon;
  final String serviceName;
  final String description;
  final String price;
  final String duration;
  final List<String> features;
  final Color backgroundColor;
  final bool isFeatured;
  final VoidCallback onPressedButton;

  const PricingCard({
    Key? key,
    required this.badgeText,
    required this.icon,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.duration,
    required this.features,
    required this.backgroundColor,
    required this.isFeatured,
    required this.onPressedButton,
  }) : super(key: key);

  @override
  State<PricingCard> createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Transform.scale(
        scale: _isHovered ? 1.05 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 300,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isFeatured ? Colors.blue : Colors.grey[200]!,
              width: widget.isFeatured ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.08),
                blurRadius: _isHovered ? 15 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Main Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header dengan Icon dan Service Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          widget.icon,
                          size: 48,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.serviceName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Harga dan Durasi (Row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '/ ${widget.duration}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Daftar Fitur (Column & Row combination)
                    Column(
                      children: widget.features
                          .map((feature) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        feature,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 24),

                    // Call-to-Action Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: widget.onPressedButton,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Pilih Paket',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Badge Recommended (Positioned di sudut kanan atas)
              if (widget.badgeText.isNotEmpty)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.badgeText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}