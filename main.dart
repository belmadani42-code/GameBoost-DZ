import 'package:flutter/material.dart';

void main() {
  runApp(const GameBoostApp());
}

class GameBoostApp extends StatelessWidget {
  const GameBoostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameBoost DZ',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF020914),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF08A8FF),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  final pages = const [
    DashboardPage(),
    ToolsPage(),
    SavedPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        backgroundColor: const Color(0xFF061525),
        indicatorColor: const Color(0xFF0A8DDE),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.apps_outlined), selectedIcon: Icon(Icons.apps), label: 'الأدوات'),
          NavigationDestination(icon: Icon(Icons.bookmark_border), selectedIcon: Icon(Icons.bookmark), label: 'المحفوظة'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(
              child: Text('GameBoost DZ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ],
        ),
        const Text('مرحباً بك 👋', style: TextStyle(color: Colors.white70, fontSize: 16)),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF082B4A), Color(0xFF34105C)]),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFF168CDE)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('العب بذكاء، وليس بالحظ 🎮', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 7),
              Text('أدوات تساعدك على تحسين تجربة اللعب.', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        const SizedBox(height: 18),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.15,
          children: const [
            ToolCard(icon: Icons.track_changes, title: 'إعدادات الحساسية', subtitle: 'إعدادات جاهزة ومخصصة'),
            ToolCard(icon: Icons.rocket_launch, title: 'محسن الألعاب', subtitle: 'أدوات لتحسين التجربة'),
            ToolCard(icon: Icons.speed, title: 'اختبار FPS', subtitle: 'معرفة أداء جهازك'),
            ToolCard(icon: Icons.calculate, title: 'حاسبة DPI', subtitle: 'احسب القيمة المناسبة'),
            ToolCard(icon: Icons.phone_android, title: 'حسب الجهاز', subtitle: 'إعدادات لهواتف مختلفة'),
            ToolCard(icon: Icons.lightbulb_outline, title: 'نصائح وحيل', subtitle: 'تعلم مهارات جديدة'),
          ],
        ),
      ],
    );
  }
}

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const ToolCard({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF071B2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 34, color: const Color(0xFF12B7FF)),
            const SizedBox(height: 9),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.white60)),
          ],
        ),
      ),
    );
  }
}

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('الأدوات', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.track_changes, color: Color(0xFF12B7FF)),
          title: const Text('إعدادات الحساسية'),
          subtitle: const Text('Free Fire / PUBG / COD'),
          tileColor: const Color(0xFF071B2D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SensitivityPage())),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.calculate, color: Color(0xFF8F6CFF)),
          title: const Text('حاسبة DPI'),
          subtitle: const Text('احسب قيمة DPI بشكل مبسط'),
          tileColor: const Color(0xFF071B2D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DpiPage())),
        ),
      ],
    );
  }
}

class SensitivityPage extends StatefulWidget {
  const SensitivityPage({super.key});

  @override
  State<SensitivityPage> createState() => _SensitivityPageState();
}

class _SensitivityPageState extends State<SensitivityPage> {
  double general = 90, redDot = 85, scope2 = 80, scope4 = 75, scope8 = 65;

  Widget slider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label),
          Text(value.round().toString(), style: const TextStyle(color: Color(0xFF12B7FF), fontWeight: FontWeight.bold)),
        ]),
        Slider(value: value, min: 0, max: 100, onChanged: onChanged),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إعدادات الحساسية')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Free Fire', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 18),
          slider('الحساسية العامة', general, (v) => setState(() => general = v)),
          slider('Red Dot', redDot, (v) => setState(() => redDot = v)),
          slider('منظار 2x', scope2, (v) => setState(() => scope2 = v)),
          slider('منظار 4x', scope4, (v) => setState(() => scope4 = v)),
          slider('منظار 8x', scope8, (v) => setState(() => scope8 = v)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ الإعدادات'))),
            icon: const Icon(Icons.save),
            label: const Text('حفظ الإعدادات'),
          ),
        ],
      ),
    );
  }
}

class DpiPage extends StatefulWidget {
  const DpiPage({super.key});

  @override
  State<DpiPage> createState() => _DpiPageState();
}

class _DpiPageState extends State<DpiPage> {
  double dpi = 400;
  double size = 6.5;

  @override
  Widget build(BuildContext context) {
    final result = (dpi * (size / 5.65)).round();
    return Scaffold(
      appBar: AppBar(title: const Text('حاسبة DPI')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text('احسب قيمة DPI بشكل مبسط', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 25),
            Text('DPI الحالي: ${dpi.round()}', style: const TextStyle(fontSize: 20)),
            Slider(value: dpi, min: 100, max: 800, divisions: 70, onChanged: (v) => setState(() => dpi = v)),
            Text('حجم الشاشة: ${size.toStringAsFixed(1)}'),
            Slider(value: size, min: 4.5, max: 8.0, onChanged: (v) => setState(() => size = v)),
            const Spacer(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    const Text('النتيجة المقترحة'),
                    const SizedBox(height: 8),
                    Text('$result', style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xFF12B7FF))),
                    const SizedBox(height: 8),
                    const Text('هذه حاسبة تقديرية وليست قياساً فعلياً لأداء جهازك.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white60)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('إعداداتي المحفوظة', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 18),
        Card(child: ListTile(leading: const Icon(Icons.gamepad, color: Color(0xFF12B7FF)), title: const Text('Free Fire - متوسط'), subtitle: const Text('آخر تعديل: اليوم'), trailing: const Icon(Icons.more_vert))),
        Card(child: ListTile(leading: const Icon(Icons.gamepad, color: Color(0xFF8F6CFF)), title: const Text('PUBG - قوي'), subtitle: const Text('آخر تعديل: اليوم'), trailing: const Icon(Icons.more_vert))),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('الإعدادات', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        SwitchListTile(value: true, onChanged: (_) {}, title: const Text('الوضع الليلي'), tileColor: const Color(0xFF071B2D)),
        const SizedBox(height: 8),
        ListTile(title: const Text('اللغة'), trailing: const Text('العربية'), tileColor: const Color(0xFF071B2D)),
        const SizedBox(height: 8),
        ListTile(title: const Text('عن التطبيق'), subtitle: const Text('GameBoost DZ v1.0.0'), tileColor: const Color(0xFF071B2D)),
      ],
    );
  }
}
