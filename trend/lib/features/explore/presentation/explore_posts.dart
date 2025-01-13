import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:trend/features/explore/data/explore_api.dart';

class ExplorePosts extends StatefulWidget {
  const ExplorePosts({super.key});

  @override
  State<ExplorePosts> createState() => _ExplorePostsState();
}

class _ExplorePostsState extends State<ExplorePosts> {
  final ExploreApi exploreApi = ExploreApi(dio: Dio());
  List<Map<String, dynamic>> posts = [];
  String? nextPageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts(); // Fetch initial posts
  }

  void _fetchPosts() async {
    if (isLoading) return; // Prevent multiple requests
    setState(() {
      isLoading = true;
    });

    try {
      final response = await exploreApi.fetchAllPosts(nextPageUrl: nextPageUrl);
      setState(() {
        posts.addAll(response['results']); // Append new posts
        nextPageUrl = response['next']; // Update next page URL
      });
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? const Center(child: CircularProgressIndicator()) // Loading state
        : Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero, // Ensure no extra padding is applied
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of images per row
                crossAxisSpacing: 1, // Horizontal spacing
                mainAxisSpacing: 1, // Vertical spacing
                childAspectRatio: 1, // Ensures square cells
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(0), // Optional rounded corners
                  child: post['image'] != null
                      ? Image.network(
                          post['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        )
                      : const Icon(
                          Icons.broken_image), // Placeholder for missing images
                );
              },
            ),
          );
  }
}
