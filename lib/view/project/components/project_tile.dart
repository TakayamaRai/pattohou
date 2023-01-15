import 'package:flutter/material.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/data/common.dart';
import 'package:pattohou/models/repository/model/project_model.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/viewmodel/common/format.dart';

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
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: MyColor.gray,
              offset: Offset(3, 4),
              blurRadius: 8,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(project.status == ProjectStatus.edit)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: MyColor.gray,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit_outlined,color: Colors.white,size: 30,)
                  ),
                ),
              if(project.status == ProjectStatus.complete)
              const Icon(Icons.check_circle,color: MyColor.primary,size: 50,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text.p14bold(text: project.name),
                    const SizedBox(height: 5,),
                    if(project.receiver != "")
                    text.p12normal(text: "${project.receiver} 宛",color: MyColor.gray),
                    if(project.receiver == "")
                      text.p12normal(text: "宛先なし",color: MyColor.gray),
                    const SizedBox(height: 5,),
                    if(project.atReportedDate != null)
                      text.p12normal(text: "報告日：${Format().fmtDate(project.atReportedDate!)}",color: MyColor.gray),
                    if(project.atReportedDate == null)
                      text.p12normal(text: "報告日：",color: MyColor.gray),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right,color: MyColor.gray,size: 20,)
            ],
          ),
        ),
      ),
      onTap:() => onTap(),
    );
  }
}
