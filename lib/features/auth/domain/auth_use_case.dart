import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/auth/data/auth_repo.dart';

import 'package:manty_nomer_1/features/auth/data/user_model.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUseCase {
  GetAuthRepo getAuthRepo;
  AuthUseCase(this.getAuthRepo);
  Future<UserModel> setUser(GoogleSignInAuthentication googleAuth) async {
    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    UserModel user = UserModel(
      email: userCredential.user!.email!,
      name: userCredential.user!.displayName!,
      image: userCredential.user!.photoURL!,
      uid: userCredential.user!.uid,
      date: DateTime.now().toString(),
    );

    UserModel? userFrom = await getAuthRepo.setUser(user);

    if (userFrom != null) {
      user = userFrom;
    }

    sl<SharedPreferences>().setString(
      SharedKeys.authEmail,
      user.email,
    );
    sl<SharedPreferences>().setString(
      SharedKeys.name,
      user.name,
    );
    sl<SharedPreferences>().setString(
      SharedKeys.image,
      user.image,
    );
    sl<SharedPreferences>().setString(
      SharedKeys.uid,
      user.uid,
    );

    return user;
  }
}
