import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/story_detail/presentation/bloc/story_detail_bloc.dart';

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
          return Stack(
            children: [
              Image.network(
                state.storyDetails!.photoUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      state.storyDetails!.name!,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      state.storyDetails!.description!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          );
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
}
