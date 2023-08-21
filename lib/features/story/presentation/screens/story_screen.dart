import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/core/bloc/bloc_with_state.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';
import 'package:story_app_dicoding/features/story/presentation/bloc/stories_bloc.dart';

class StoryScreen extends HookWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      body: _buildBody(scrollController),
    );
  }

  Widget _buildBody(ScrollController scrollController) {
    return BlocBuilder<StoriesBloc, StoriesState>(builder: (_, state) {
      if (state is StoriesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is StoriesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      } else if (state is StoriesLoaded) {
        return _buildStories(scrollController, state.stories, state.noMoreData);
      }
      return const SizedBox();
    });
  }

  Widget _buildStories(ScrollController scrollController,
      List<StoryEntity>? stories, bool? noMoreData) {
    return ListView(
      controller: scrollController,
      children: [
        ...List<Widget>.from(
          stories!.map(
            (e) => Builder(
              builder: (context) => ListTile(
                title: Text(e.name!),
                leading: Image.network(
                  e.photoUrl!,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
                subtitle: Text(e.description!),
              ),
            ),
          ),
        ),
        if (noMoreData!) ...[
          const SizedBox(),
        ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: CupertinoActivityIndicator(),
          )
        ]
      ],
    );
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final storiesBloc = BlocProvider.of<StoriesBloc>(context);
    final state = storiesBloc.blocProcessState;

    if (currentScroll == maxScroll) {
      storiesBloc.add(const GetStories());
    }
  }
}
