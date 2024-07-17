import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String description;

  Contact(
      {required this.name,
      required this.phoneNumber,
      required this.description});
}

class ContactBlock extends StatelessWidget {
  final Contact contact;
  final bool isGeneralSection;

  const ContactBlock(
      {super.key, required this.contact, this.isGeneralSection = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isGeneralSection
                    ? contact.phoneNumber
                    : getInitials(contact.name),
                style: const TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  contact.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
          !isGeneralSection
          ?ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.primary2,
                backgroundColor: AppColor.transparent,
                shape: const StadiumBorder(),
                elevation: 0,
                shadowColor: Colors.transparent,
                side: const BorderSide(
                  width: 0,
                  color: AppColor.transparent,
                ),
              ),
              onPressed: () {},
              child: const Text(
                "...",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          )
          :Container()
        ],
      ),
    );
  }

  String getInitials(String name) {
    List<String> nameSplit = name.split(' ');
    String initials = '';
    int numInitials = 2;

    if (nameSplit.length < 2) {
      numInitials = 1;
    }

    for (int i = 0; i < nameSplit.length; i++) {
      initials += nameSplit[i][0];

      if (initials.length >= numInitials) {
        break;
      }
    }

    return initials.toUpperCase();
  }
}
