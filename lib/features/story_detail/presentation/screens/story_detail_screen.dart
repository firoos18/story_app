import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/story_detail/domain/entity/story_detail_entity.dart';
import 'package:story_app_dicoding/features/story_detail/presentation/bloc/story_detail_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class StoryDetailScreen extends StatefulWidget {
  final String storyId;

  const StoryDetailScreen({super.key, required this.storyId});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  @override
  void initState() {
    context
        .read<StoryDetailBloc>()
        .add(GetStoryDetails(storyId: widget.storyId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBFF),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<StoryDetailBloc, StoryDetailState>(
      builder: (_, state) {
        if (state is StoryDetailLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is StoryDetailLoaded) {
          return _storyDetail(state.storyDetails!);
        }

        if (state is StoryDetailError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _storyDetail(StoryDetailEntity story) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          story.photoUrl!,
          height: MediaQuery.of(context).size.height * 0.55,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    story.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    timeago.format(
                      DateTime.parse(story.createdAt!),
                    ),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff201A1B).withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              Text(
                story.description!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        )
      ],
    );
  }
}
