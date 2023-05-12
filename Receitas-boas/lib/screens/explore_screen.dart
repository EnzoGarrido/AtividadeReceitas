import 'package:flutter/material.dart';
import 'package:receitasboas/components/today_recipe_list_view.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 2
    return FutureBuilder(
        // 2
        future: mockService.getExploreData(),
        // 3
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          // 4
          if (snapshot.connectionState == ConnectionState.done) {
            // 5
            return ListView(
              // 7
              scrollDirection: Axis.vertical.children,
              children: [
                // 7
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                // 8
                const SizedBox(height: 16),
                //9
                FriendPostListView(
                    friendPosts: snapshot.data?.friendPosts ?? []),
              ],
            );
          } else {
            // 10
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
