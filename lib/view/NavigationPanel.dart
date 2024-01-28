import 'package:flutter/material.dart';
import 'package:newsapp/model/Source.dart';

import '../model/item.dart';

class NavigationPanel extends StatelessWidget {
  final Function(String) onCategorySelected;

  const NavigationPanel({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Scrollbar(
          child: ListView(
            children: [
              DrawerItem(
                source: Source(id: '1', name: 'CNN', category: 'General'),
                icon: Icons.dashboard,
                onPressed: () {
                  onCategorySelected('General');
                },
              ),
              DrawerItem(
                source: Source(id: '2', name: 'BBC Sport', category: 'Sports'),
                icon: Icons.sports_soccer,
                onPressed: () {
                  onCategorySelected('Sports');
                },
              ),
              DrawerItem(
                source: Source(id: '3', name: 'Financial Times', category: 'Business'),
                icon: Icons.business,
                onPressed: () {
                  onCategorySelected('Business');
                },
              ),
              DrawerItem(
                source: Source(id: '4', name: 'Entertainment Weekly', category: 'Entertainment'),
                icon: Icons.movie,
                onPressed: () {
                  onCategorySelected('Entertainment');
                },
              ),
              DrawerItem(
                source: Source(id: '5', name: 'National Geographic', category: 'Science'),
                icon: Icons.science,
                onPressed: () {
                  onCategorySelected('Science');
                },
              ),
              DrawerItem(
                source: Source(id: '6', name: 'TechCrunch', category: 'Technology'),
                icon: Icons.computer,
                onPressed: () {
                  onCategorySelected('Technology');
                },
              ),
              DrawerItem(
                source: Source(id: '7', name: 'Health', category: 'Health'),
                icon: Icons.local_hospital,
                onPressed: () {
                  onCategorySelected('Health');
                },
              ),
              DrawerItem(
                source: Source(id: '8', name: 'New York Times', category: 'World'),
                icon: Icons.public,
                onPressed: () {
                  onCategorySelected('World');
                },
              ),
              DrawerItem(
                source: Source(id: '9', name: 'Food', category: 'Food'),
                icon: Icons.fastfood,
                onPressed: () {
                  onCategorySelected('Food');
                },
              ),
              DrawerItem(
                source: Source(id: '10', name: 'Travel', category: 'Travel'),
                icon: Icons.airplanemode_active,
                onPressed: () {
                  onCategorySelected('Travel');
                },
              ),
              // Add more DrawerItem widgets for other categories...
            ],
          ),
        ),
      ),
    );
  }
}
