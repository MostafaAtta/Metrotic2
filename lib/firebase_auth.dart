import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/models/wallet.dart';

import 'View/HomScreen.dart';
import 'View/rechargeBalance.dart';
import 'View/verification.dart';
import 'models/user.dart' as myUser;
import 'notification_service.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

/*

  User? _userFromFirebase(auth.User user){
    if(user == null){
      return null;
    }

    return User(uid: user.uid,email: user.email!,name: "" , phone: "", tagID: "", nationalID: "");

  }
*/

  //Stream<User?> get user => _firebaseAuth.authStateChanges().map(_userFromFirebase);

  CollectionReference usersReference =
      FirebaseFirestore.instance.collection('Users');
  CollectionReference ticketsReference =
      FirebaseFirestore.instance.collection('Tickets');
  CollectionReference walletsReference =
      FirebaseFirestore.instance.collection('Wallets');
  CollectionReference cardsReference =
      FirebaseFirestore.instance.collection('Cards');
  CollectionReference notificationsReference =
      FirebaseFirestore.instance.collection('notifications');
  CollectionReference stationsReference =
      FirebaseFirestore.instance.collection('stations');
  CollectionReference subscriptionsReference =
      FirebaseFirestore.instance.collection('Subscriptions');

  Future<String?> resetPassword(
      {required String email, required BuildContext context}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      showConfirmation(context: context);
      return "Done".tr();
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> register(
      {required String name,
      required String email,
      required String phone,
      required String tagID,
      required String nationalID,
      required BuildContext context}) async {
    await usersReference.add({
      'name': name,
      'email': email,
      'phone': phone,
      'tagID': tagID,
      'nationalID': nationalID,
    }).then((value) {
      _saveUser(myUser.User(
          uid: value.id,
          email: email,
          name: name,
          phone: phone,
          tagID: tagID,
          nationalID: nationalID));
      createWallet(uid: value.id);
      Navigator.of(context)
          .pushReplacementNamed(Verification.routeName, arguments: {
        //"phone": phoneController.text.trim(),
        "phone": "+2$phone",
      });
    });
  }

  _saveUser(myUser.User user) async {
    log("email: ${user.uid}");
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', user.uid);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('phone', user.phone);
    prefs.setString('tagID', user.tagID);
    prefs.setString('nationalID', user.nationalID);
  }

  Future<myUser.User> getLocalUser() async {
    final prefs = await SharedPreferences.getInstance();

    return myUser.User(
        uid: prefs.getString("uid") ?? "",
        email: prefs.getString("email") ?? "",
        name: prefs.getString("name") ?? "",
        phone: prefs.getString("phone") ?? "",
        tagID: prefs.getString("tagID") ?? "",
        nationalID: prefs.getString("nationalID") ?? "");
  }

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      log("Signed in");

      //showSnackBar(context, "Signed in");
      getUser(email: email, context: context);
    } on auth.FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      //log(e.message!);

    }
  }

  Future<void> getUser(
      {required String email, required BuildContext context}) async {
    await usersReference.where('email', isEqualTo: email).get().then((value) {
      value.docs.forEach((result) {
        myUser.User user = myUser.User(
            uid: result.id,
            email: result.get('email'),
            name: result.get('name'),
            phone: result.get('phone'),
            tagID: result.get('tagID'),
            nationalID: result.get('nationalID'));

        //print(result.id);
        _saveUser(user);

        Navigator.of(context).pushReplacementNamed(Home.routeName);
      });
    });
  }

  Future<myUser.User> checkUserUpdates() async {
    final prefs = await SharedPreferences.getInstance();

    late myUser.User user;
    CollectionReference usersReference =
        FirebaseFirestore.instance.collection('Users');

    String uid = prefs.getString("uid") ?? "";

    await usersReference.doc(uid).get().then((result) {
      user = myUser.User(
          uid: result.id,
          email: result.get('email'),
          name: result.get('name'),
          phone: result.get('phone'),
          tagID: result.get('tagID'),
          nationalID: result.get('nationalID'));

      //print(result.id);
      _saveUser(user);
    });

    return user;
  }

  Future<void> checkUser(
      {required String nationalID, required BuildContext context}) async {
    await usersReference
        .where('nationalID', isEqualTo: nationalID)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        myUser.User user = myUser.User(
            uid: result.id,
            email: result.get('email'),
            name: result.get('name'),
            phone: result.get('phone'),
            tagID: result.get('tagID'),
            nationalID: result.get('nationalID'));

        _saveUser(user);
        print(result.id);

        Navigator.of(context).pushReplacementNamed(Home.routeName);
      });
    });
  }

  Future<void> updateUser(
      {required myUser.User user, required BuildContext context}) async {
    print(user.tagID);
    await usersReference.doc(user.uid).update({
      "name": user.name,
      "email": user.email,
      "phone": user.phone,
      "tagID": user.tagID,
      "nationalID": user.nationalID
    }).then((_) {
      getUser(email: user.email, context: context);
      //showSnackBar(context, "Profile updated");
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    });
  }

  Future<String> verifyPhone(
      {required String phone,
      required BuildContext context,
      required Function setData}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          } else {
            print(e.message);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          showSnackBar(context, "Verification Code sent on the phone number");
          setData(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return "Signed in";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<void> signInWithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));

      showSnackBar(context, "verified");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String tagID,
      required String nationalID,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      showSnackBar(context, "Signed in");
      register(
          name: name,
          email: email,
          phone: phone,
          tagID: tagID,
          nationalID: nationalID,
          context: context);
    } on auth.FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> createWallet({required String uid}) async {
    await walletsReference.add({
      'uid': uid,
      'balance': 0,
    }).then((value) {});
  }

  Future<void> addCard(
      {required String uid,
      required String cardNumber,
      required String expiryDate,
      required String name,
      required BuildContext context}) async {
    await cardsReference.add({
      'uid': uid,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'name': name,
    }).then((value) {
      Navigator.pop(
          context, MaterialPageRoute(builder: (_) => RechargeBalance()));
    });
  }

  Future<void> createSub(
      {required String uid,
      required String walletId,
      required String subId,
      required int price,
      required int balance,
      required BuildContext context}) async {
    var date = "${DateFormat.yMMMd().format(DateTime.now())}";
    var time = "${DateFormat.Hms().format(DateTime.now())}";
    print(subId);
    await subscriptionsReference.add({
      'uid': uid,
      'time': time,
      'date': date,
      'subId': subId,
      'price': price,
    }).then((value) {
      print("${value.id}");
      saveNotification(
          title: "New subscription",
          body: "New subscription created, price $price LE",
          uid: uid,
          walletId: walletId,
          price: price,
          balance: balance,
          context: context);
    });
  }

  Future<void> createTicket(
      {required String uid,
      required String walletId,
      required String noOfStations,
      required int price,
      required int balance,
      required BuildContext context}) async {
    var date = "${DateFormat.yMMMd().format(DateTime.now())}";
    var time = "${DateFormat.Hms().format(DateTime.now())}";

    await ticketsReference.add({
      'uid': uid,
      'time': time,
      'date': date,
      'noOfStations': noOfStations,
      'price': price,
    }).then((value) {
      print("${value.id}");
      saveNotification(
          title: "New ticket",
          body:
              "New ticket created, valid for $noOfStations stations, price $price LE",
          uid: uid,
          walletId: walletId,
          price: price,
          balance: balance,
          context: context);
    });
  }

  Future<void> saveNotification(
      {required String uid,
      required String title,
      required String body,
      required String walletId,
      required int price,
      required int balance,
      required BuildContext context}) async {
    await notificationsReference.add({
      'uid': uid,
      'title': title,
      'body': body,
    }).then((value) {
      NotificationService.showNotification(
          title: title, body: body, payload: "purchased");
      updateWallet(
          walletId: walletId, price: price, balance: balance, context: context);
    });
  }

  Future<void> checkTicket(
      {required String noOfStations,
      required String subId,
      required int price,
      required bool ticket,
      required BuildContext context}) async {
    var hasTicket = false;
    final prefs = await SharedPreferences.getInstance();

    String uid = prefs.getString("uid") ?? "";
    log(uid);

    await ticketsReference.where('uid', isEqualTo: uid).get().then((value) {
      value.docs.forEach((result) {
        hasTicket = true;
      });
      if (hasTicket) {
        showSnackBar(context, "You can't create two tickets in same time");
      } else {
        checkWallet(
            noOfStations: noOfStations,
            subId: subId,
            price: price,
            ticket: ticket,
            context: context);
      }
    });
  }

  Future<void> checkWallet(
      {required String noOfStations,
      required String subId,
      required int price,
      required bool ticket,
      required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();

    String uid = prefs.getString("uid") ?? "";

    await walletsReference.where('uid', isEqualTo: uid).get().then((value) {
      value.docs.forEach((result) {
        var balance = result.get('balance');

        if (balance >= price) {
          print("$balance");
          ticket
              ? createTicket(
                  uid: uid,
                  walletId: result.id,
                  noOfStations: noOfStations,
                  price: price,
                  balance: balance,
                  context: context)
              : createSub(
                  uid: uid,
                  walletId: result.id,
                  subId: subId,
                  price: price,
                  balance: balance,
                  context: context);
        } else {
          //showSnackBar(context, "Insufficient balance");
        }
      });
    });
  }

  Future<void> checkBalance(
      {required String uid,
      required String noOfStations,
      required String subId,
      required int price,
      required bool ticket,
      required BuildContext context}) async {
    await walletsReference.where('uid', isEqualTo: uid).get().then((value) {
      value.docs.forEach((result) {
        var balance = result.get('balance');

        if (balance >= price) {
          print("$balance");
          ticket
              ? createTicket(
                  uid: uid,
                  walletId: result.id,
                  noOfStations: noOfStations,
                  price: price,
                  balance: balance,
                  context: context)
              : createSub(
                  uid: uid,
                  walletId: result.id,
                  subId: subId,
                  price: price,
                  balance: balance,
                  context: context);
        } else {
          //showSnackBar(context, "Insufficient balance");
        }
      });
    });
  }

  Future<void> updateWallet(
      {required String walletId,
      required int price,
      required int balance,
      required BuildContext context}) async {
    await walletsReference.doc(walletId).update({
      "balance": balance - price,
    }).then((_) {
      //showSnackBar(context, "Profile updated");
      showConfirmation(context: context);
      //Navigator.of(context).pushReplacementNamed(Home.routeName);
    });
  }

  Future<void> rechargeWallet(
      {required String walletId,
      required int balance,
      required BuildContext context}) async {
    await walletsReference.doc(walletId).update({
      "balance": balance,
    }).then((_) {
      //showSnackBar(context, "Profile updated");

      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
    });

    showSnackBar(context, "Wallet charged");
  }

  Future<Wallet> getBalance() async {
    final prefs = await SharedPreferences.getInstance();

    String uid = prefs.getString("uid") ?? "";
    late Wallet wallet;

    CollectionReference walletsReference =
        FirebaseFirestore.instance.collection('Wallets');
    await walletsReference.where('uid', isEqualTo: uid).get().then((value) {
      value.docs.forEach((result) {
        wallet = Wallet(
            id: result.id,
            uid: result.get('uid'),
            balance: result.get('balance'));
      });
    });

    return wallet;
  }

  Future<List> getTicketPrices() async {
    CollectionReference ticketPricesReference =
        FirebaseFirestore.instance.collection('Tickets_Prices');
    List<Map<String, Object>> ticketPrices = <Map<String, Object>>[];

    await ticketPricesReference.orderBy("order").get().then((value) {
      value.docs.forEach((result) {
        //print("value: ${result.toString()}");
        ticketPrices.add({
          "noOfStations": result.get("noOfStations"),
          "price": result.get("price"),
          "name": result.get("name")
        });
        //ticketPrices.add({"price": result.get("price")});

        print(ticketPrices);
      });
    });

    return ticketPrices;
  }

  Future<List> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();

    String uid = prefs.getString("uid") ?? "";

    List<Map<String, Object>> notifications = <Map<String, Object>>[];

    await notificationsReference
        .where('uid', isEqualTo: uid)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        //print("value: ${result.toString()}");
        notifications.add({
          "title": result.get("title"),
          "body": result.get("body"),
        });
        //ticketPrices.add({"price": result.get("price")});

        print(notifications);
      });
    });

    return notifications;
  }

  Future<List> getStations(int line) async {
    List<Map<String, Object>> stations = <Map<String, Object>>[];

    await stationsReference
        .where('line', isEqualTo: line)
        .orderBy('Station ID')
        .get()
        .then((value) {
      value.docs.forEach((result) {
        //print("value: ${result.toString()}");
        stations.add({
          "Station ID": result.get("Station ID"),
          "name": result.get("name"),
          "line": result.get("line"),
        });
        //ticketPrices.add({"price": result.get("price")});
      });
    });

    print(stations);
    return stations;
  }

  Future<List> getSubscriptions() async {
    List<Map<String, Object>> subscriptionsPrices = <Map<String, Object>>[];
    CollectionReference monthlyReference = FirebaseFirestore.instance
        .collection('Subscriptions_prices')
        .doc('ZZ9xxdI0g0FkRbbnlvXl')
        .collection('Monthly');

    await monthlyReference.orderBy("order").get().then((value) {
      value.docs.forEach((result) {
        subscriptionsPrices.add({
          "subId": result.id,
          "destination": result.get("destination"),
          "price": result.get("price"),
          "tripPrice": result.get("tripPrice"),
          "discount": result.get("discount")
        });
        //ticketPrices.add({"price": result.get("price")});

        print(subscriptionsPrices);
      });
    });

    return subscriptionsPrices;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  void showConfirmation({required BuildContext context}) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Image.asset("assets/done.png"),
        );
      },
      animationType: DialogTransitionType.scale,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }
}
