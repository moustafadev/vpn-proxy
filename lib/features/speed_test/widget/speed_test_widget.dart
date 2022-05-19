import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class SpeedTestWidget extends StatelessWidget {
  SpeedTestWidget({
    Key? key,
    required this.assetName,
    required this.isSelect,
    required this.onTap,
    required this.text,
    required this.mode,
    required this.deleteScreen,
  }) : super(key: key);

  final String text;
  final String assetName;
  bool isSelect = false;
  bool mode = true;
  bool deleteScreen = false;

  Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 90,
      width: size.width,
      decoration: BoxDecoration(
        color: kBlackLight,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 10),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              assetName,
              height: 32,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      text,
                      style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: mode ? kGrey : kReadMode.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 7, right: 7, top: 5, bottom: 5),
                        child: Text(
                          "5 дней",
                          style: mainBoldTextStyle.copyWith(
                            color: mode ? kMainGrey : kReadMode,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: kYellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 5),
                        child: Text(
                          "IPv4",
                          style: mainBoldTextStyle.copyWith(
                            color: kBlack,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "136.117.121.183",
                      style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
            deleteScreen
                ? Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.more_vert,
                          color: kWhite,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                isSelect ? kBlackLight : Color(0xFF1B1E22),
                                isSelect ? kGreyPrimary : Color(0xFF0D0D0F),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: isSelect
                                ? const CircleAvatar(
                                    backgroundColor: kYellow,
                                    radius: 8,
                                  )
                                : const CircleAvatar(
                                    backgroundColor: kTrans,
                                    radius: 8,
                                  ),
                          ),
                        ),
                      )
                    ],
                  )
                : isSelect
                    ? Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          'assets/icons/icons/Vector.svg',
                          height: 12,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Container(),
                      ),
          ],
        ),
      ),
    );
  }
}
