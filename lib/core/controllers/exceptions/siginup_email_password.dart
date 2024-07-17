class SignUpWothEmailAndPasswordFailure{
    final String message;

    SignUpWothEmailAndPasswordFailure([this.message="An error ocurred"]);

    factory SignUpWothEmailAndPasswordFailure.code(String code){
      switch(code){
        case 'weak-password' : return SignUpWothEmailAndPasswordFailure('weak-password');
        case 'invalid-email' : return SignUpWothEmailAndPasswordFailure('invalid-email');
        case 'email-alredy-in-use' : return SignUpWothEmailAndPasswordFailure('email-alredy-in-use');
        case 'operation-not-allowed' : return SignUpWothEmailAndPasswordFailure('operation-not-allowed');
        case 'user-disabled' : return SignUpWothEmailAndPasswordFailure('user-disabled');
        default : return SignUpWothEmailAndPasswordFailure("Erreur inconnue");
      }
    }
}