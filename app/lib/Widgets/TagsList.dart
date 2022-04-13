import 'package:app/Services/Service.dart';
import 'package:app/Widgets/Tag.dart';
import 'package:flutter/material.dart';

class TagsList extends StatefulWidget {
  final List<Tag> tags;
  const TagsList({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 5.0,
            runSpacing: 5.0,
            direction: Axis.horizontal,
            children: widget.tags));
  }
}
