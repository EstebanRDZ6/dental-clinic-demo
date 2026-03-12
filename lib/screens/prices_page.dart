import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PricesPage extends StatelessWidget {
  const PricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Text(
                  l10n.get('prices'),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const TabBar(tabs: [Tab(text: 'Basic'), Tab(text: 'Advanced')]),
                Expanded(
                  child: TabBarView(
                    children: [
                      _PricesList(
                        items: {
                          l10n.get('cleaning'): '\$50',
                          l10n.get('whitening'): '\$150',
                          'Consulta General': '\$30',
                        },
                      ),
                      _PricesList(
                        items: {
                          l10n.get('orthodontics'): '\$1200+',
                          l10n.get('implants'): '\$800+',
                          'Endodoncia': '\$200',
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PricesList extends StatelessWidget {
  final Map<String, String> items;
  const _PricesList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children:
          items.entries.map((e) {
            return Card(
              elevation: 1,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(
                  e.key,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  e.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
