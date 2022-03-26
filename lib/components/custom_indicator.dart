import 'package:flutter/material.dart';

import 'constants.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
      child: CircularProgressIndicator(
        color: kTextColor,),
  );
}
