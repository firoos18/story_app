import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';
import 'package:story_app_dicoding/features/story/presentation/bloc/stories_bloc.dart';
import 'package:story_app_dicoding/features/story/presentation/widgets/story_card.dart';
import 'package:story_app_dicoding/features/story_detail/presentation/screens/story_detail_screen.dart';

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
      backgroundColor: const Color(0xffFFFBFF),
      body: _buildBody(scrollController, context),
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff201A1B),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(ScrollController scrollController, BuildContext context) {
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _homeBuild(
              state.stories, scrollController, state.noMoreData, context),
        );
      }
      return const SizedBox();
    });
  }

  Widget _buildStories(
    ScrollController scrollController,
    List<StoryEntity>? stories,
    bool? noMoreData,
    BuildContext context,
  ) {
    return ListView(
      controller: scrollController,
      children: [
        ...List<Widget>.from(
          stories!.map(
            (e) => Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => StoryDetailScreen(storyId: e.id!),
                    ),
                  );
                },
                child: StoryCard(
                  description: e.description!,
                  name: e.name!,
                  photoUrl: e.photoUrl!,
                  createdAt: e.createdAt!,
                ),
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

    if (currentScroll == maxScroll) {
      storiesBloc.add(const GetStories());
    }
  }

  Widget _recentStoryList(StoryEntity story) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            story.photoUrl!,
            height: 210,
            width: 175,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                story.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xffFFFBFF),
                ),
              ),
              Text(
                story.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 8,
                  color: Color(0xffFFFBFF),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _homeBuild(
    List<StoryEntity>? stories,
    ScrollController scrollController,
    bool? noMoreData,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 36),
        const Text(
          'Recents',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xff201A1B),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (ctx, index) => Container(
              margin: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            StoryDetailScreen(storyId: stories[index].id!),
                      ),
                    );
                  },
                  child: _recentStoryList(stories![index])),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'All Stories',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xff201A1B),
          ),
        ),
        Expanded(
            child:
                _buildStories(scrollController, stories, noMoreData, context)),
      ],
    );
  }
}
