// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, no_logic_in_create_state, must_be_immutable

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_for_u/screens/signUp/verification.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:here_for_u/style/all_style.dart';
import '../../core/db/data/Utilisateur.dart';
import '../../style/components/all_components.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:dotted_border/dotted_border.dart';

class DocumentsScreen extends StatefulWidget {

  Utilisateur? utilisateur ;
  DocumentsScreen(
      {Key? key, this.utilisateur})
      : super(key: key);
  
  @override
  State createState() => _DocumentsScreenState(utilisateur);
}

class _DocumentsScreenState extends State {
  late Utilisateur? utilisateur_documents =Utilisateur("", "", "") ;
  File? image;
  PlatformFile? pickedFile;
  PlatformFile? sndPickedFile;

  _DocumentsScreenState(Utilisateur? utilisateur_for_documents){
    utilisateur_documents=utilisateur_for_documents;
  }
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      File? imageTemporary = File(image.path);
      imageTemporary = await cropImage(imageFile: imageTemporary);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("La sélection de l'image a échoué : $e");
      }
      Navigator.of(context).pop();
    }
  }

  Future cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future selectFirstFile() async {
    final getFile = await FilePicker.platform.pickFiles();
    if (getFile == null) return;

    setState(() {
      pickedFile = getFile.files.first;
    });
  }

  Future selectSndFile() async {
    final getSndFile = await FilePicker.platform.pickFiles();
    if (getSndFile == null) return;

    setState(() {
      sndPickedFile = getSndFile.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopSignUp(
                    step: "Etape 3/4",
                    title: "Inscription",
                    description:
                        "Lorem ipsum dolor sit amet consectetur. Sit viverra et porttitor sem at ipsum enim. "),
                const SizedBox(height: 20),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: AppColor.black, fontSize: 15),
                        text: "Photo récente de votre visage",
                        children: [
                      TextSpan(text: '', style: TextStyle(color: Colors.red))
                    ])),
                const SizedBox(height: 5),
                image != null
                    ? SizedBox(
                        height: 90.0,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                              //onTap: () => pickImage(ImageSource.gallery),
                              onTap: () async {
                                Map<Permission, PermissionStatus> statuses =
                                    await [
                                  Permission.storage,
                                  Permission.camera,
                                ].request();
                                if (statuses[Permission.storage]!.isGranted &&
                                    statuses[Permission.camera]!.isGranted) {
                                  showImagePicker(context);
                                } else {
                                  if (kDebugMode) {
                                    print(
                                        "Aucune autorisation n'a été accordée");
                                  }
                                }
                              },
                              child: Image.file(
                                image!,
                                fit: BoxFit.fitWidth,
                              )),
                        ))
                    : SizedBox(
                        height: 90.0,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey,
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            elevation: 0,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.black,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            Map<Permission, PermissionStatus> statuses = await [
                              Permission.storage,
                              Permission.camera,
                            ].request();
                            if (statuses[Permission.storage]!.isGranted &&
                                statuses[Permission.camera]!.isGranted) {
                              showImagePicker(context);
                            } else {
                              if (kDebugMode) {
                                print("Aucune autorisation n'a été accordée");
                              }
                            }
                          },
                          child: const ImageIcon(
                              AssetImage('images/camera-outline-rounded.png')),
                        ),
                      ),
                const SizedBox(height: 35),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: AppColor.black, fontSize: 15),
                        text: "Carte d'identité - recto",
                        children: [
                      TextSpan(text: '', style: TextStyle(color: Colors.red))
                    ])),
                const SizedBox(height: 5),
                pickedFile != null
                    ? Column(
                        children: [
                          MyDottedBorder(
                            //text: "${pickedFile!.name} Changer de fichier",
                            text: pickedFile!.name,
                            onPressed: () {
                              selectFirstFile();
                            },
                          ),
                          Image.file(
                            File(pickedFile!.path!),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        ],
                      )
                    : MyDottedBorder(
                        text: "Choisir un fichier",
                        onPressed: () {
                          selectFirstFile();
                        },
                      ),
                const SizedBox(height: 20),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: AppColor.black, fontSize: 15),
                        text: "Carte d'identité - verso",
                        children: [
                      TextSpan(text: '', style: TextStyle(color: Colors.red))
                    ])),
                const SizedBox(height: 5),
                sndPickedFile != null
                    ? MyDottedBorder(
                        text: sndPickedFile!.name,
                        onPressed: () {
                          selectSndFile();
                        },
                      )
                    : MyDottedBorder(
                        text: "Choisir un fichier",
                        onPressed: () {
                          selectSndFile();
                        },
                      ),
                const SizedBox(height: 35),
                NextStepButton(
                  cancelText: 'Retour',
                  nextText: 'Suivant',
                  onPressed: () {
                    /**
                     * Recuperation des fichiers
                     * pour envoyer a la screen verification
                     *
                     *
                     * (il sufit de set l'objet ; utilisateur_documents )
                     */


                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return VerificationScreen(
                              utilisateur_verification: utilisateur_documents
                          );
                        }));
                  },
                )
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
        ));
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Wrap(
            children: [
              InkWell(
                child:  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          size: 30.0,
                          color: AppColor.darkGray,
                        ),
                        SizedBox(width: 35.0),
                        Text(
                          "Caméra",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    )),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              //SizedBox(height: 16),
              InkWell(
                child:  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.image,
                          size: 30.0,
                          color: AppColor.darkGray,
                        ),
                        SizedBox(width: 35.0),
                        Text(
                          "Galerie",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    )),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
