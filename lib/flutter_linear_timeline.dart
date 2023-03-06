library flutter_linear_timeline;

import 'package:flutter/material.dart';

class LinearLineWidget extends StatelessWidget {
  const LinearLineWidget(
      {Key? key, this.width, this.lineList, this.currentIndex,this.successColorLight,this.textColor})
      : super(key: key);

  final double? width;
  final List<String>? lineList;
  final int? currentIndex;
  final Color? successColorLight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.width*0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              lineList!.length,
                  (index) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: index == currentIndex
                        ? size.width * 0.08
                        : size.width * 0.06,
                    width: index == currentIndex
                        ? size.width * 0.08
                        : size.width * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == currentIndex
                            ? successColorLight??Colors.green
                            : Colors.grey),
                  ),
                  index != lineList!.length - 1
                      ? Container(
                    width: width!/(lineList!.length),
                    height: 2,
                    decoration:  BoxDecoration(color: textColor??Colors.white),
                  )
                      : Wrap(),
                ],
              )),
        ),

        SizedBox(
          width: width!+size.width*0.11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                lineList!.length,
                    (index) =>   Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: width!/(lineList!.length),
                    child: Center(
                      child: Text(
                        lineList![index],
                        style: TextStyle(
                            fontSize: index == currentIndex ? 13 : 11,
                            color: textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )),
          ),
        ),

      ],
    );
  }
}