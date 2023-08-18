import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';
import 'package:story_app_dicoding/features/story/presentation/bloc/stories_bloc.dart';

class StoryScreen extends StatelessWidget {
  final List<StoryEntity> _stories = [];
  final ScrollController _scrollController = ScrollController();

  StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<StoriesBloc, StoriesState>(listener: (context, state) {
      if (state is StoriesLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Loading Stories!'),
          ),
        );
      } else if (state is StoriesLoaded && state.stories!.listStory!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All Stories Loaded!'),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is StoriesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is StoriesLoaded) {
        // return ListView.builder(
        //   itemCount: state.stories!.listStory!.length,
        //   itemBuilder: (ctx, index) {
        //     final stories = state.stories!.listStory;
        //     return ListTile(
        //       title: Text(stories![index].name!),
        //       leading: Image.network(
        //         stories[index].photoUrl!,
        //         width: 52,
        //         height: 52,
        //         fit: BoxFit.cover,
        //       ),
        //     );
        //   },
        // );
        _stories.addAll(state.stories!.listStory!);
        context.read<StoriesBloc>().isFetching = false;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
      return ListView.builder(
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.offset ==
                  _scrollController.position.maxScrollExtent) {
                context.read<StoriesBloc>()
                  ..isFetching = true
                  ..add(const GetStories());
              }
            }),
          itemCount: _stories.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              onTap: () {
                print(_stories[index].id);
              },
              title: Text(_stories[index].name!),
              leading: Image.network(
                _stories[index].photoUrl!,
                fit: BoxFit.cover,
                width: 56,
                height: 56,
              ),
              subtitle: Text(_stories[index].description!),
            );
          });
    });
  }
}
