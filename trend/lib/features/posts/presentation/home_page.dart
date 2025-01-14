import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trend/features/posts/presentation/main_post.dart';
import 'package:trend/features/posts/bloc/post_bloc.dart';
import 'package:trend/features/posts/bloc/post_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button

        elevation: 0, // Remove shadow from AppBar
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'T  R  E  N  D',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.2,
                  color: const Color.fromARGB(255, 160, 160, 160),
                ),
                color: const Color.fromARGB(255, 251, 251, 251),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/chat.svg'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: const Color.fromARGB(255, 243, 243, 243),
            thickness: 1,
            height: 1,
          ),
          Expanded(
            child: BlocConsumer<PostBloc, PostState>(
              listener: (context, state) {
                if (state is PostError) {
                  // Show a snackbar if there's an error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.message}')),
                  );
                }
              },
              builder: (context, state) {
                if (state is PostLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PostLoaded) {
                  // Display the list of posts
                  return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) =>
                        MainPost(post: state.posts[index]),
                  );
                } else if (state is PostError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
