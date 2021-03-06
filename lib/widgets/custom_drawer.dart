import '../views/favorite_stories_screen.dart';
import '../views/story_list_screen.dart';
import 'package:flutter/material.dart';

// Custom Drawer used in both scaffolds for Navigation

// This is not ideal code, it should have a ListView instead with a method to create your own new custom page navigator tiles.
// There should also be just one single function that does the navigation, but I used this approach as it saved me on complexity and time.
// In production code, I would've implemented it the ideal way.
class CustomDrawer extends StatelessWidget {
  CustomDrawer();

  void redirectToTopStoriesScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return StoryListScreen();
    }));
  }

  void redirectToFavoriteStories(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return FavoriteStoriesScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SizedBox(
      child: Column(
        children: [
          // A simple container which can display an Image or App Logo in a better UI.
          Container(
            child: const Center(
              child: Text("Butter Top Stories App"),
            ),
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Top Stories"),
            onTap: () => redirectToTopStoriesScreen(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite_rounded),
            title: const Text("Favorite Stories"),
            onTap: () => redirectToFavoriteStories(context),
          ),
          const Divider(),
        ],
      ),
      height: MediaQuery.of(context).size.height,
    ));
  }
}
