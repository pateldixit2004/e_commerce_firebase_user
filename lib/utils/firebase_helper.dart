import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase_user/screen/model/add_to_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper
{
  static final base=FireBaseHelper._();
  FireBaseHelper._();
  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;



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
    User? user = auth.currentUser;
    return user!=null;
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
      print("============== $e");
      return "$e";
    }
  }

  Map<String, String?> userData()
  {
    User? user=auth.currentUser;
    var email=user!.email;
    var name=user.displayName;
    var img=user.photoURL;
    return {"email":email,"name":name,"img":img,};
  }
  //========================================================================================

Stream<QuerySnapshot<Map<String, dynamic>>> readProductData()
{
  return firestore.collection('Product').snapshots();

}



void addCard(AddtoCardModel model)
{
  firestore.collection('card').doc('uid').collection('Product').add(
    {
      "name": model.name,
      "price": model.price,
      "cate": model.cate,
      "img": model.img,
      "dec": model.dec
    }
  );
}

Stream<QuerySnapshot<Map<String, dynamic>>> getCardData()
{
  return firestore.collection('card').doc('uid').collection('Product').snapshots();
}
}