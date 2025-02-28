import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class LearnSMARTRAuthUser {
  LearnSMARTRAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LearnSMARTRAuthUser> learnSMARTRAuthUserSubject =
    BehaviorSubject.seeded(LearnSMARTRAuthUser(loggedIn: false));
Stream<LearnSMARTRAuthUser> learnSMARTRAuthUserStream() =>
    learnSMARTRAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
