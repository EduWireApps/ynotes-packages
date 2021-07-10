import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ynotes_components/ynotes_components.dart';
import 'package:sizer/sizer.dart';

class TestPage extends StatelessWidget {
  final List<Color> colors = [currentTheme.colors.primary.shade100];

  Widget temp(BuildContext context) => Padding(
      padding: EdgeInsets.all(20), child: Container(height: 200, color: colors[Random().nextInt(colors.length)]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: currentTheme.isDark ? Brightness.dark : Brightness.light,
          iconTheme: IconThemeData(color: currentTheme.colors.neutral.shade500),
          centerTitle: false,
          backgroundColor: currentTheme.colors.neutral.shade100,
          title: Text("Test page",
              style: TextStyle(fontWeight: FontWeight.w700, color: currentTheme.colors.neutral.shade500)),
        ),
        backgroundColor: currentTheme.colors.neutral.shade200,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Période",
                              style: TextStyle(
                                color: currentTheme.colors.neutral.shade400,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          Text("Trimestre 3",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w700,
                                  color: currentTheme.colors.neutral.shade500,
                                  height: .9)),
                        ],
                      ),
                      YHorizontalSpacer(10),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: YButton(
                          onPressed: () async {
                            final res = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021, 1, 1),
                                lastDate: DateTime(2022, 1, 1));
                            print(res);
                          },
                          text: "Changer",
                          type: YColor.neutral,
                          icon: Icons.date_range_rounded,
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
            SliverPersistentHeader(
                floating: true,
                delegate: _SliverAppBarDelegate(
                    child: PreferredSize(child: CustomHeader(), preferredSize: Size.fromHeight(56)))),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: currentTheme.colors.neutral.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Filtres",
                          style: TextStyle(color: currentTheme.colors.neutral.shade400),
                        ),
                        Text(
                          "Simulateur",
                          style: TextStyle(color: currentTheme.colors.neutral.shade400),
                        ),
                      ],
                    )),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
                temp(context),
              ]),
            )
          ],
        ));
  }
}

class CustomHeader extends StatefulWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  Widget data(BuildContext context, {required String label, required String data}) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                color: currentTheme.colors.neutral.shade400,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              )),
          Text(data,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: currentTheme.colors.neutral.shade500,
                  height: .9))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: currentTheme.colors.neutral.shade300,
          boxShadow: [
            BoxShadow(color: Colors.black38.withOpacity(.3), blurRadius: 5, offset: Offset(0, 5), spreadRadius: 0)
          ],
        ),
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("17,01",
                  style: TextStyle(
                      fontSize: 25.sp, fontWeight: FontWeight.w600, color: currentTheme.colors.neutral.shade500)),
              Row(
                children: [
                  YHorizontalSpacer(25),
                  data(context, label: "Max", data: "18,59"),
                  YHorizontalSpacer(10),
                  data(context, label: "Classe", data: "14,78"),
                  YHorizontalSpacer(10),
                  data(context, label: "Min", data: "9,75"),
                ],
              )
            ],
          ),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
