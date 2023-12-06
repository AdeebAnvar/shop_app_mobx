import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialogue {
  Future<dynamic> showCupertinoLoadingDialogue(
      {required BuildContext ctx, required String loadingString}) {
    return showCupertinoDialog(
        // barrierColor: Colors.black26,

        context: ctx,
        builder: (context) {
          return CupertinoAlertDialog(
            // backgroundColor: Colors.black26,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal.shade600,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  loadingString,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        });
  }
}
