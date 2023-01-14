import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/data/common.dart';
import 'package:pattohou/models/repository/model/project_model.dart';
import 'package:pattohou/view/components/text.dart';

class ProjectTile extends StatelessWidget {
  final String id;
  final ProjectModel project;
  final Function onTap;
  ProjectTile({
    super.key, 
    required this.id, 
    required this.project,
    required this.onTap,
  });
  final text = MyText();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 6),
              blurRadius: 100,
            )
          ]
        ),
        child: Row(
          children: [
            if(project.status == ProjectStatus.edit)
              Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: MyColor.gray,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit_outlined,color: Colors.white,size: 30,)
              ),
            if(project.status == ProjectStatus.complete)
            const Icon(Icons.check_circle,color: MyColor.primary,size: 50,),
            Column(
              children: [
                text.p14bold(text: project.name),
                text.p12normal(text: "${project.receiver} 宛",color: MyColor.gray),
                text.p12normal(text: "報告日：${project.atReportedDate}"),
              ],
            ),
            const Icon(Icons.chevron_right,color: MyColor.gray,size: 20,)
          ],
        ),
      ),
      onTap:() => onTap(),
    );
  }
}
