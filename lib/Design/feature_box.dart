import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {

  final String FeatureName;
  final String ImgPath;
  final bool PowerStatus;
  void Function(bool)? onChanged;

   FeatureBox({
    super.key,
    required this.FeatureName,
    required this.ImgPath,
    required this.PowerStatus,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: PowerStatus ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon
            Image.asset(
              ImgPath,
              height: 65,
              color: PowerStatus ? Colors.white : Colors.black,
            ),

            //Feature + Switch
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                      FeatureName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: PowerStatus ? Colors.white : Colors.black,
                      ),
                                      ),
                    )),
                Transform.rotate(
                  angle: 3.14 / 2,
                  child: CupertinoSwitch(
                      value: PowerStatus,
                      onChanged: onChanged,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
