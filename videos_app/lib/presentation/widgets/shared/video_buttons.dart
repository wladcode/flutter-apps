import 'package:flutter/material.dart';
import 'package:videos_app/config/helpers/human_formats.dart';
import 'package:videos_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          iconColor: Colors.red,
          value: videoPost.likes,
          label: 'likes',
        ),
        const SizedBox(height: 10),
        _CustomIconButton(
          icon: Icons.comment,
          iconColor: Colors.blue,
          value: videoPost.comments,
          label: 'comments',
        ),
        const SizedBox(height: 10),
        _CustomIconButton(
          icon: Icons.remove_red_eye_outlined,
          iconColor: Colors.green,
          value: videoPost.views,
          label: 'views',
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final int value;
  final String label;

  const _CustomIconButton({
    required this.icon,
    required this.value,
    required this.label,
    Color? iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${HumanFormats.humanReadableNumber(value.toDouble())} $label',
                ),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          icon: Icon(icon, color: color),
        ),
        Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
