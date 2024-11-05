import 'package:flutter/material.dart';

void mainBottomsheet({
  context,
  modalContent,
  isBorderRadius = true,
  bottomSheetCloseHandler,
}) {
  bool flag = false;

  if (flag == false) {
    flag = true;
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isBorderRadius ? 15 : 0),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [modalContent],
          ),
        );
      },
    ).whenComplete(() {
      flag = !flag;

      if (bottomSheetCloseHandler != null) {
        bottomSheetCloseHandler();
      }
    });
  }
}
