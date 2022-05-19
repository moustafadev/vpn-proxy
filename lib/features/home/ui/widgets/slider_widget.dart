import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';

class SliderPeriodWidget extends StatefulWidget {
  const SliderPeriodWidget({Key? key}) : super(key: key);

  @override
  State<SliderPeriodWidget> createState() => _SliderPeriodWidgetState();
}

class _SliderPeriodWidgetState extends State<SliderPeriodWidget> {
  var proxyController = Get.put(ProxyController());
  var value = 30.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${proxyController.startSliderValue.toInt()} дней",
                  style: mainSemibooextStyle.copyWith(
                    fontSize: 12,
                    color: kMainGrey,
                  ),
                ),
                Text(
                  "${proxyController.endSliderWidget.toInt()} дней",
                  style: mainBoldTextStyle.copyWith(
                    fontSize: 12,
                    color: kMainGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SliderTheme(
            data: SliderThemeData(
                overlayColor: kYellow.withOpacity(0.2),
                trackHeight: 6,
                // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 10),
                thumbShape: RoundedRectangleSeekbarShape(
                  thumbRadius: 10,
                  roundness: 30,
                  thickness: 1,
                ),
                tickMarkShape: const LineSliderTickMarkShape(),
                thumbColor: kYellow,
                activeTrackColor: kYellow,
                activeTickMarkColor: kYellow,
                inactiveTrackColor: kBlackLight,
                inactiveTickMarkColor: kBlackLight,
                overlayShape: SliderComponentShape.noOverlay),
            child: SizedBox(
              child: Slider(
                value: value,
                // activeColor: kYellow ,
                // inactiveColor:kBlackLight ,
                min: proxyController.startSliderValue,
                max: proxyController.endSliderWidget,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    proxyController.updateSelectValue(value);
                    this.value = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedRectangleSeekbarShape extends SliderComponentShape {
  //The radius of the thumb
  final double thumbRadius;

  //the thickness of the border
  final double thickness;

  //the roundness of the corners
  final double roundness;

  RoundedRectangleSeekbarShape(
      {this.thumbRadius = 6.0, this.thickness = 2, this.roundness = 6.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      bool? isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      double? value,
      double? textScaleFactor,
      Size? sizeWithOverflow,
      TextDirection? textDirection,
      Thumb? thumb,
      bool? isPressed}) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: center, radius: thumbRadius);

    final roundedRectangle = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left - 1, rect.top),
        Offset(rect.right + 1, rect.bottom),
      ),
      Radius.circular(roundness),
    );

    final fillPaint = Paint()
      ..color = kYellow
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(roundedRectangle, fillPaint);
    canvas.drawRRect(roundedRectangle, borderPaint);
  }
}

class LineSliderTickMarkShape extends SliderTickMarkShape {
  const LineSliderTickMarkShape({
    this.tickMarkRadius,
  });

  final double? tickMarkRadius;

  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    required bool isEnabled,
  }) {
    assert(sliderTheme.trackHeight != null);
    return Size.fromRadius(tickMarkRadius ?? sliderTheme.trackHeight! / 4);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    required bool isEnabled,
  }) {
    Color? begin;
    Color? end;
    switch (textDirection) {
      case TextDirection.ltr:
        final bool isTickMarkRightOfThumb = center.dx > thumbCenter.dx;
        begin = isTickMarkRightOfThumb
            ? sliderTheme.disabledInactiveTickMarkColor
            : sliderTheme.disabledActiveTickMarkColor;
        end = isTickMarkRightOfThumb
            ? sliderTheme.inactiveTickMarkColor
            : sliderTheme.activeTickMarkColor;
        break;
      case TextDirection.rtl:
        final bool isTickMarkLeftOfThumb = center.dx < thumbCenter.dx;
        begin = isTickMarkLeftOfThumb
            ? sliderTheme.disabledInactiveTickMarkColor
            : sliderTheme.disabledActiveTickMarkColor;
        end = isTickMarkLeftOfThumb
            ? sliderTheme.inactiveTickMarkColor
            : sliderTheme.activeTickMarkColor;
        break;
    }
    final Paint paint = Paint()
      ..color = ColorTween(begin: begin, end: end).evaluate(enableAnimation)!;
       paint.strokeCap = StrokeCap.round;
  paint.strokeWidth = 3;

    final double tickMarkRadius = getPreferredSize(
          isEnabled: isEnabled,
          sliderTheme: sliderTheme,
        ).width /
        2;
    if (tickMarkRadius > 0) {
      context.canvas.drawLine(Offset(center.dx, center.dy - 8),
          Offset(center.dx, center.dy + 8), paint);
      // context.canvas.drawRect(Rect.fromLTRB(0.0, 0.0, 50.0, 50.0), paint);

      // context.canvas.drawRect(
      //     Rect.fromLTRB(
      //       0,
      //       0,
      //       center.dx,
      //       center.dy,
      //     ),
      //     paint
      //     // Offset(center.dx - 5, center.dy - 5), Offset(center.dx + 10, center.dy + 10), paint
      //     );
    }
  }
}
