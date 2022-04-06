import 'package:app/Services/Service.dart';
import 'package:app/Widgets/Tag.dart';
import 'package:flutter/material.dart';

class TagsList extends StatefulWidget {
  const TagsList({Key? key}) : super(key: key);

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<Widget>>(
      future: getAllTags(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.0,
              direction: Axis.horizontal,
              children: snapshot.data!);
        } else {
          return Text('data');
        }
      },
    ));
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
