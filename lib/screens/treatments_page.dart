import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class TreatmentsPage extends StatelessWidget {
  const TreatmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    final List<Map<String, String>> treatments = [
      {
        'title': l10n.get('cleaning'),
        'desc': l10n.get('cleaning_desc'),
        'icon': 'cleaning',
      },
      {
        'title': l10n.get('orthodontics'),
        'desc': l10n.get('orthodontics_desc'),
        'icon': 'orthodontics',
      },
      {
        'title': l10n.get('implants'),
        'desc': l10n.get('implants_desc'),
        'icon': 'implants',
      },
      {
        'title': l10n.get('whitening'),
        'desc': l10n.get('whitening_desc'),
        'icon': 'whitening',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(32),
        itemCount: treatments.length,
        itemBuilder: (context, index) {
          final t = treatments[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(24),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(0.1),
                child: Icon(
                  Icons.medication,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
              ),
              title: Text(
                t['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(t['desc']!, style: const TextStyle(fontSize: 16)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
