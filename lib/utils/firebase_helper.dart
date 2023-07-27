import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper
{
  static final base=FireBaseHelper._();
  FireBaseHelper._();
  FirebaseAuth auth=FirebaseAuth.instance;


  Future<String> anonymouslyGet()
  async {
    try
        {
          await auth.signInAnonymously();
          return "Sucess";
        }
        catch(e)
    {
      return "please try again";
    }
  }

  bool checkUser()
  {
    auth.currentUser;
    return auth!=null;
  }



  Future<void> signOut()
  async {
    await auth.signOut();
    GoogleSignIn().signOut();

  }
  Future<String> createUser(String email,String password)
  async {
    try
    {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Sucess";
    }
    catch(e)
    {
      return "${e}";
    }
  }


  Future<String> signIn(String email,String password)
  async {
    try
        {
          await  auth.signInWithEmailAndPassword(email: email, password: password);
          return "Sucess";
        }
        catch(e)
    {
      return "${e}";
    }
  }

  Future<String> googleSignIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await auth.signInWithCredential(credential);
      return "Sucess";
    } catch (e) {
      return "$e";
    }
  }
}