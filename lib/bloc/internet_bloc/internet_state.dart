//states are emmited
abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetLostState extends InternetState {}

class InternetGainedState extends InternetState {}

// if all the classes are empty then we can also use enum, used in cubit for instance
