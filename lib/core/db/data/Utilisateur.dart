// ignore_for_file: non_constant_identifier_names, file_names


class Utilisateur{
  String? id = "";
  String? email="";
  String? mot_passe="";
  String? telephone="";
  String? sexe="";
  String? nom="";
  String? prenom="";
  String? date_de_naissance="";
  String? adresse="";
  String? ville="";
  String? codePostal="";
  Utilisateur(this.email, this.mot_passe, this.telephone);


  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'mot_passe': mot_passe,
    'telephone': telephone,
    'sexe': sexe,
    'nom': nom,
    'prenom': prenom,
    'date_de_naissance': date_de_naissance,
    'adresse': adresse,
    'ville': ville,
    'codePostal': codePostal,
  };
}