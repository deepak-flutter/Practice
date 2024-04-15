import 'package:flutter/material.dart';

class LanguageBottomModalSheetComponent {
  static showModalSheet({
    required BuildContext context,
    required List<dynamic> languageList,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 4,
                  color: Colors.grey.shade200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Available languages",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: languageList
                      .map(
                        (e) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            color: Colors.grey.shade100,
                          ),
                          child: Text(
                            e.language,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
