import 'package:event_flutter/utils/EADataProvider.dart';
import 'package:event_flutter/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EANotificationScreen extends StatefulWidget {
  const EANotificationScreen({Key? key}) : super(key: key);

  @override
  _EANotificationScreenState createState() => _EANotificationScreenState();
}

class _EANotificationScreenState extends State<EANotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          "Notification",
          center: true,
          backWidget: Icon(Icons.arrow_back, color: white).onTap(() {
            finish(context);
          }),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          shrinkWrap: true,
          padding: EdgeInsets.all(12),
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonCachedNetworkImage(notificationList[index].image, fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(35),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(notificationList[index].name!, style: boldTextStyle()),
                        10.width,
                        Text(notificationList[index].time!, style: secondaryTextStyle()),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( notificationList[index].subtitle!, style: secondaryTextStyle(color: black)),
                        4.height,
                        Text( notificationList[index].subtime!.toUpperCase(), style: secondaryTextStyle()),
                      ],
                    )
                  ],
                ).expand()
              ],
            ).paddingSymmetric(vertical: 12);
          },
        ));
  }
}
