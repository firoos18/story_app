import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:story_app_dicoding/features/upload_story/presentation/bloc/upload_image_bloc.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageBloc, UploadImageState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    title: const Text('Select Image Source'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context
                              .read<UploadImageBloc>()
                              .add(OnGalleryImagePicked());
                        },
                        child: const Text('Gallery'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context
                              .read<UploadImageBloc>()
                              .add(OnCameraImagePicked());
                        },
                        child: const Text('Camera'),
                      ),
                    ],
                  ));
        },
        child: Container(
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(
            color: const Color(0xff410003).withOpacity(0.25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: state.pickedImage == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FeatherIcons.image,
                      size: 16,
                      color: const Color(0xff410003).withOpacity(0.5),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Take Image',
                      style: TextStyle(
                        fontSize: 10,
                        color: const Color(0xff410003).withOpacity(0.5),
                      ),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    state.pickedImage!,
                    width: double.infinity,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      );
    });
  }
}
