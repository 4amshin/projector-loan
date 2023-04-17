import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataImg extends StatelessWidget {
  const NoDataImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/no_data.svg',
        height: 200,
      ),
    );
  }
}
