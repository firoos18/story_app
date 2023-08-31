import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/navbar/presentation/bloc/navigation_bloc.dart';
import 'package:story_app_dicoding/features/navbar/presentation/screens/navigation_screen.dart';
import 'package:story_app_dicoding/features/story/presentation/screens/story_screen.dart';
import 'package:story_app_dicoding/features/upload_story/presentation/bloc/upload_image_bloc.dart';
import 'package:story_app_dicoding/features/upload_story/presentation/widgets/image_input.dart';
import 'package:story_app_dicoding/features/upload_story/presentation/widgets/location_input.dart';

class UploadStoryScreen extends StatefulWidget {
  const UploadStoryScreen({super.key});

  @override
  State<UploadStoryScreen> createState() => _UploadStoryScreenState();
}

class _UploadStoryScreenState extends State<UploadStoryScreen> {
  var _enteredDescription = '';
  final formKey = GlobalKey<FormState>();

  void uploadStory() {
    formKey.currentState!.save();

    // Dismiss keyboard
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    context.read<UploadImageBloc>().add(
          OnUploadStory(description: _enteredDescription.toString()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageBloc, UploadImageState>(
      listener: (context, state) {
        if (state is UploadStoryLoading) {
          showCupertinoModalPopup(
            context: context,
            builder: (ctx) => const CupertinoAlertDialog(
              content: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          );
        } else if (state is UploadStoryError) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception!.message!),
            ),
          );
        } else if (state is UploadStorySuccess) {
          Navigator.pop(context);
          context.read<NavigationBloc>().add(
                const OnNavbarClicked(StoryScreen(), 'Home'),
              );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              const Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: ImageInput(),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: LocationInput(),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Form(
                key: formKey,
                child: TextFormField(
                  maxLines: 5,
                  onSaved: (newValue) {
                    _enteredDescription = newValue!;
                  },
                  decoration: InputDecoration(
                    fillColor: const Color(0xffFFFBFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xff847375),
                      ),
                    ),
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      color: const Color(0xff410003).withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                onPressed: uploadStory,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    backgroundColor: const Color(0xffD81E5B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: const Text(
                  'Upload',
                  style: TextStyle(
                    color: Color(0xffFFFBFF),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
