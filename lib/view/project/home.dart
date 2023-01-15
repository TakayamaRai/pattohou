import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/data/common.dart';
import 'package:pattohou/models/repository/database/project_repository.dart';
import 'package:pattohou/view/components/load_dialog.dart';
import 'package:pattohou/view/components/text.dart';
import 'package:pattohou/view/project/components/create_button.dart';
import 'package:pattohou/view/project/components/home_appber.dart';
import 'package:pattohou/view/project/components/project_tile.dart';
import 'package:pattohou/view/project/create_project.dart';
import 'package:pattohou/viewmodel/common/loading_viewmodel.dart';

class Home extends HookConsumerWidget {
  Home({Key? key}) : super(key: key);
  final text = MyText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mProjectsWatch = ref.watch(projectStreamProvider);
    return Scaffold(
      backgroundColor: MyColor.background,
      body: Stack(
        children: [
          homeAppBar(context),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + appBarHeight),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: mProjectsWatch.when(
                    error: (err, _) {
                      debugPrint(err.toString());
                      return Container(
                        child: text.p14normal(text: err.toString()),
                      );
                    },
                    loading: () => Loading().dialog(message: "物件を取得中です"),
                    data: (mProjects) {
                      if (mProjects.isEmpty) {
                        return Center(
                          child: text.p14bold(
                              text: "物件が登録されていません\n"
                                  "下部の＋ボタンから物件を登録してください",
                              color: MyColor.gray,
                              textAlign: TextAlign.center),
                        );
                      }
                      return ListView.builder(
                        itemCount: mProjects.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: ProjectTile(
                              id: mProjects.keys.elementAt(i),
                              project: mProjects.values.elementAt(i),
                              onTap: () => _onTapProjectTile(),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CreateButton(
                    onPressed: () => _onTapCreateProject(context))),
          ),
          if (ref.watch(loadingStatusProvider).isLoading)
            Loading().dialog(message: "お待ちください"),
        ],
      ),
    );
  }

  _onTapProjectTile() {}

  _onTapCreateProject(BuildContext context) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (context) {
      return CreateProjectPage();
    }));
  }
}
