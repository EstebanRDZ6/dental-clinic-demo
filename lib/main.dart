import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/app_localizations.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const DentalClinicDemo(),
    ),
  );
}

class AppState extends ChangeNotifier {
  Locale _locale = const Locale('es');
  Locale get locale => _locale;

  void changeLanguage(String langCode) {
    if (langCode != _locale.languageCode) {
      _locale = Locale(langCode);
      notifyListeners();
    }
  }
}

class DentalClinicDemo extends StatelessWidget {
  const DentalClinicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // Color palette medical style
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF0077B6),
      primary: const Color(0xFF0077B6),
      secondary: const Color(0xFF00B4D8),
      tertiary: const Color(0xFF90E0EF),
      surface: const Color(0xFFFFFFFF),
    );

    return MaterialApp.router(
      title: 'Dental Clinic Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      locale: appState.locale,
      supportedLocales: const [Locale('en', ''), Locale('es', '')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/treatments',
          builder: (context, state) => const TreatmentsPage(),
        ),
        GoRoute(
          path: '/booking',
          builder: (context, state) => const BookingPage(),
        ),
        GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
        GoRoute(
          path: '/prices',
          builder: (context, state) => const PricesPage(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    var appState = Provider.of<AppState>(context, listen: false);

    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.medical_information, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              l10n.get('title'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          if (isDesktop) ...[
            TextButton(
              onPressed: () => context.go('/'),
              child: Text(
                l10n.get('home'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/treatments'),
              child: Text(
                l10n.get('treatments'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/booking'),
              child: Text(
                l10n.get('booking'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/prices'),
              child: Text(
                l10n.get('prices'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/about'),
              child: Text(
                l10n.get('about'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/contact'),
              child: Text(
                l10n.get('contact'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
          ],
          DropdownButton<String>(
            value: appState.locale.languageCode,
            dropdownColor: Theme.of(context).colorScheme.primary,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            icon: const Icon(Icons.language, color: Colors.white),
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 'en', child: Text('EN')),
              DropdownMenuItem(value: 'es', child: Text('ES')),
            ],
            onChanged: (val) {
              if (val != null) appState.changeLanguage(val);
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer:
          isDesktop
              ? null
              : Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.medical_information,
                              size: 60,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              l10n.get('title'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _DrawerItem(
                      icon: Icons.home,
                      title: l10n.get('home'),
                      route: '/',
                    ),
                    _DrawerItem(
                      icon: Icons.medical_services,
                      title: l10n.get('treatments'),
                      route: '/treatments',
                    ),
                    _DrawerItem(
                      icon: Icons.calendar_month,
                      title: l10n.get('booking'),
                      route: '/booking',
                    ),
                    _DrawerItem(
                      icon: Icons.attach_money,
                      title: l10n.get('prices'),
                      route: '/prices',
                    ),
                    _DrawerItem(
                      icon: Icons.info,
                      title: l10n.get('about'),
                      route: '/about',
                    ),
                    _DrawerItem(
                      icon: Icons.contact_support,
                      title: l10n.get('contact'),
                      route: '/contact',
                    ),
                  ],
                ),
              ),
      body: child,
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // close drawer
      },
    );
  }
}
