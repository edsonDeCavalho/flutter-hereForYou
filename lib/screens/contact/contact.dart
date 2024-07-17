// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
//import 'package:here_for_u/style/all_style.dart';
import 'package:here_for_u/style/components/all_components.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State {
  List<Contact> generalContacts = [
    Contact(
        name: 'Violences Femmes Info',
        phoneNumber: '3919',
        description: "Écoute, information et Orientation"),
    Contact(
        name: 'Police et Gendarmerie',
        phoneNumber: '17',
        description: "France"),
    Contact(
        name: 'Police et Gendarmerie',
        phoneNumber: '112',
        description: "Union européenne"),
    Contact(
        name: 'Remplacement du 15, 17 et 18',
        phoneNumber: '114',
        description:
            "Pour les personnes sourdes, malentendantes, aphasiques et dysphasiques"),
    Contact(
        name: 'Urgences médicales (Samu)',
        phoneNumber: '15',
        description: "France"),
    Contact(name: 'Pompiers', phoneNumber: '16', description: "France"),
  ];

  List<Contact> emergencyContacts = [
    Contact(
        name: 'Julie Smith', phoneNumber: '1111111111', description: "Mère"),
    Contact(name: 'John Doe', phoneNumber: '2222222222', description: "Père"),
    Contact(
        name: 'Emma Johnson', phoneNumber: '3333333333', description: "Amie"),
    // Add more emergency contacts here
  ];

  List<Contact> filteredGeneralContacts = [];
  List<Contact> filteredEmergencyContacts = [];
  bool showGeneralContacts = false;

  @override
  void initState() {
    super.initState();
    filteredGeneralContacts = generalContacts;
    filteredEmergencyContacts = emergencyContacts;
  }

  void filterContacts(String query) {
    setState(() {
      filteredGeneralContacts = generalContacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      filteredEmergencyContacts = emergencyContacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void openContactOptions(Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Perform call functionality here
                  if (kDebugMode) {
                    print("Appel en cours '${contact.name}' au ${contact.phoneNumber}");
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child:  Text(
                    "Appeler '${contact.name}' au ${contact.phoneNumber} ",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: const Text(
                    'Annuler',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void toggleGeneralContacts() {
    setState(() {
      showGeneralContacts = !showGeneralContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopPage(
        pageName: "Contacts",
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: Column(
          children: [
            //TopPage(pageName: "Contacts"),
            MySearchBar(
              hintText: "Rechercher",
              onChanged: (query) {
                filterContacts(query);
              },
              minHeight: 40,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: toggleGeneralContacts,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'General',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                showGeneralContacts
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          if (showGeneralContacts)
                            filteredGeneralContacts.isEmpty
                                ? const Center(child: Text("Aucun résultat"))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: filteredGeneralContacts.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          openContactOptions(
                                              filteredGeneralContacts[index]);
                                        },
                                        child: ContactBlock(
                                          contact:
                                              filteredGeneralContacts[index],
                                          isGeneralSection: showGeneralContacts,
                                        ),
                                      );
                                    },
                                  ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Emergency Number',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  filteredEmergencyContacts.isEmpty
                      ? const Center(child: Text("Aucun résultat"))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredEmergencyContacts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                openContactOptions(
                                    filteredEmergencyContacts[index]);
                              },
                              child: ContactBlock(
                                contact: filteredEmergencyContacts[index],
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: SizedBox(
        width: 55,
        height: 55,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColor.primary3,
            elevation: 1,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
