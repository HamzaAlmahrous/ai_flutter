import 'package:flutter/material.dart';
import '/core/util/input_validation.dart';

Future<String?> dialogBuilder(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('Enter The Text'),
          content: const Text(
              'the text will be classified to either positive or negative'),
          actions: <Widget>[
            Column(
              children: [
                TextFormField(
                  controller: textEditingController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  onTap: () => Scrollable.ensureVisible(context),
                  maxLines: 1,
                  validator: (value) {
                    if (!isNotEmptyField(value)) {
                      return "empty text";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value){
                    if(isNotEmptyField(value)) Navigator.pop(context, value);
                  },
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    hintText: "I like you",
                    prefixIcon: Icon(
                      Icons.insert_comment,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }


