import 'package:event_flutter/components/EAProfileTopComponent.dart';
import 'package:event_flutter/screens/EANotificationScreen.dart';
import 'package:event_flutter/screens/EARewardScreen.dart';
import 'package:event_flutter/utils/EAColors.dart';
import 'package:event_flutter/utils/EADataProvider.dart';
import 'package:event_flutter/utils/EAImages.dart';
import 'package:event_flutter/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EAConnectionScreen.dart';
import 'EAIndexScreen.dart';
import 'EASettingScreen.dart';

class EAProfileScreen extends StatefulWidget {
  @override
  EAProfileScreenState createState() => EAProfileScreenState();
}

class EAProfileScreenState extends State<EAProfileScreen> {
  bool pinned = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: context.height() * 0.60,
              floating: false,
              pinned: true,
              centerTitle: true,
              title: AnimatedOpacity(
                opacity: innerBoxIsScrolled ? 1.0 : 0.0,
                duration: Duration(milliseconds: 200),
                child: Text(
                  "Smit john",
                  style: boldTextStyle(color: white),
                ),
              ),
              backgroundColor:  innerBoxIsScrolled ? primaryColor1 : Colors.transparent ,
              forceElevated: innerBoxIsScrolled,
              iconTheme: IconThemeData(color: white),
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: EAProfileTopComponent(),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            EANotificationScreen().launch(context);
                          },
                          icon: Icon(Icons.notifications_active_outlined, color: white, size: 28),
                        ),
                        Positioned(
                          right: 4,
                          top: 6,
                          child: Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(shape: BoxShape.circle, color: white), child: Text('1', style: secondaryTextStyle(color: primaryColor1))),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          //EASettingScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                        },
                        icon: Icon(AntDesign.setting, color: white))
                  ],
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              Text('Activity'.toUpperCase(), style: boldTextStyle(color: primaryColor1)),
              Divider(color: primaryColor1),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(12),
                physics: NeverScrollableScrollPhysics(),
                itemCount: activityList.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(activityList[index].icon!),
                      10.width,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(activityList[index].subtitle!, style: secondaryTextStyle(color: black)),
                              10.width,
                              Text(activityList[index].time!.toUpperCase(), style: secondaryTextStyle()),
                            ],
                          ),
                          10.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(activityList[index].image!, height: 80, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                              12.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(activityList[index].name!, style: boldTextStyle()),
                                  4.height,
                                  Text(activityList[index].subtime!.toUpperCase(), style: secondaryTextStyle()),
                                ],
                              ).expand(),
                            ],
                          )
                        ],
                      ).expand()
                    ],
                  ).paddingSymmetric(vertical: 8);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
