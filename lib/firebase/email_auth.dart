import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> createUser(String user, String email, String pwd) async {
    try {
      final credentials = await auth.createUserWithEmailAndPassword(
          email: email, password: pwd);

      await credentials.user!
          .sendEmailVerification(); // Esperar a que se envíe el correo
      return true;
    } catch (e) {
      print('Error al crear el usuario: $e');
    }
    return false;
  }

  Future<bool> validateUser(String email, String pwd) async {
    try {
      final credentials =
          await auth.signInWithEmailAndPassword(email: email, password: pwd);
      if (credentials.user!.emailVerified) {
        return true;
      }
    } catch (e) {
      print('Error al verificar el usuario: ${e}');
    }
    return false;
  }
}
