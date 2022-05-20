import 'package:erasmus_helper/services/group_service.dart';
import 'package:erasmus_helper/services/tag_service.dart';
import 'package:erasmus_helper/views/social/groups/components/group_card.dart';
import 'package:flutter/material.dart';

class GroupCarousel extends StatelessWidget {
  final String tagId;

  const GroupCarousel({Key? key, required this.tagId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait(// wait for user info
          [
        GroupService.getGroupsWithTag(tagId),
        TagService.getTagTitle(tagId)
      ]),
      builder: (context, response) {
        if (response.connectionState == ConnectionState.done) {
          if (response.data != null) {
            List data = response.data as List;
            List groupIds = data[0] as List;
            String title = data[1].toString();

            return Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: groupIds.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GroupCard(groupId: groupIds[index]);
                    },
                  ),
                ),
              ],
            );
          }
        }
        return Container();
      },
    );
  }
}
