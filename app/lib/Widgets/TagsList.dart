import 'package:app/Services/Service.dart';
import 'package:app/Widgets/Tag.dart';
import 'package:flutter/material.dart';

class TagsList extends StatefulWidget {
  final List<String> tags;
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
    List<Widget> tagsWidget = [];

    for (var i = 0; i < widget.tags.length; i++) {
      tagsWidget.add(new Tag(
        text: widget.tags[i],
        isActive: true,
      ));
    }

    return Container(
        child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 5.0,
            runSpacing: 5.0,
            direction: Axis.horizontal,
            children: tagsWidget));
  }

  Future<List<Widget>> getAllTags() async {
    List<Widget> tagsWidget = [];
    getTags().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              tagsWidget.add(Tag(
                text: value[i],
                isActive: true,
              ))
            }
        });

    return tagsWidget;
  }
}
