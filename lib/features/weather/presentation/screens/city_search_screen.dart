import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SearchBar(
              elevation: WidgetStatePropertyAll(2),
              hintText: 'Search city',
              controller: _searchController,
              leading: const BackButton(),
              onSubmitted: (String value) =>
                  context.pushReplacement('/city-weather/${value.trim()}'),
              trailing: [
                IconButton(
                  onPressed: () => context.pushReplacement(
                    '/city-weather/${_searchController.text.trim()}',
                  ),
                  icon: Icon(LucideIcons.search),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
