import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/meal.dart';
import 'package:flutter_menu_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.title, this.meals, {super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? const Text('No meals found. Try another category!')
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
            itemCount: meals.length,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}
