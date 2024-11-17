import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'Ver tudo',
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: textColor ?? Theme.of(context).textTheme.headlineSmall!.color,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if(showActionButton)
          TextButton(
            onPressed: () {},
            child: Text(buttonTitle),
          ),
      ],
    );
  }
}