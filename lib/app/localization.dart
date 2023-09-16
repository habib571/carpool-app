import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'app.title': 'RIDE TALK',
      'app.done' : 'Done',
      'app.home' : 'Home',
      'app.office' : 'Office',
      'app.notification' : 'Notification',
      'app.myFav' : 'My Favorites',

      // Intro Page Text
      'intro.skip': 'Skip',
      'intro.welcome': 'Welcome back! ',
      'intro.login': 'Log in.',
      'intro.neighbours': 'Carpool with neighbours',
      'intro.split': 'Split cost, Share fun',
      'intro.splitSave': 'Save your cost by splitting seats and\nhave fun with co-ryders',
      'intro.trackRide': 'Track Your Ride',
      'intro.knowDrive': 'Know your driver in advance and be\nable to view current location',
      'intro.neighboursContent': 'Find neighbours from your area and \ncarpool with them',

      // Login Page Text
      'login.welcome' : 'Welcome Back!',
      'login.pleaseLogin': 'Please login to your account',
      'login.email' : 'Email',
      'login.password' : 'Password',
      'login.login' : 'Login',
      'login.rememberMe' : 'Remember me',
      'login.forgotPass' : 'Forgot Password?',
      'login.notAMember' : 'Not a member yet? ',
      'login.or' : 'or ',

      // SignUp Page Text
      'signUp.createProfile': 'Create Profile',
      'signUp.createProfileText': 'Please create your profile',
      'signUp.signUp': 'Sign Up',
      'signUp.name': 'Name',
      'signUp.signIn': 'Sign In',

      // Check Email page Text
      'checkEmail.title': 'Check Your Email',
      'checkEmail.continue': 'Continue',
      'checkEmail.Des1': 'We send an email to ',
      'checkEmail.Des2': ' with instruction to reset your password',

      // Mobile Verification Page Text
      'mobile.enterPhone': 'Enter Phone Number',
      'mobile.enterMobile': 'Enter your mobile number to \nenable 2 step verification',
      'mobile.hint': 'Mobile Number',
      'mobile.verify': 'Verify',
      'mobile.receiveSms': 'Don’t Receive SMS? ',
      'mobile.resendCode': 'Resend Code',

      // Verify Otp Phone Page Text
      'verify.title': 'Verify Phone Number',
      'verify.content': 'Check your SMS messages. We have sent you a PIN at ',

      // Gender Page Text
      'gender.title': 'Select Gender',
      'gender.content': 'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Eros, aenean fringilla\nornare ',

      // Enable Location Page Text
      'enable.title': 'Enable Location',
      'enable.desc': 'Choose your location to start find the\nrequest around you',
      'enable.access': 'Allow Access',
      'enable.skip': 'Skip for now',

      // Forgot Pass Page Text
      'forgot.title': 'Forgot Password',
      'forgot.desc': 'Enter your email and we will send you a\n link toy reset your password',
      'forgot.send': 'Send',

      // Home Page Text
      'home.leaveFrom': 'Leaving from',
      'home.goTo': 'Going to',
      'home.today': 'Today',
      'home.passenger': 'Passengers',
      'home.find': 'Find',
      'home.useRide': 'Use a Ride Code',

      // Chat Page Text
      'chat.title': 'Chat',
      'chat.search': 'Search',

      // Chat Details Page text
      'chatDetails.type': 'Type Here',
      'chatDetails.videoChat': 'Video Chat',
      'chatDetails.callAgain': 'Tap to call again',

      // Share Ride Page Text
      'ride.avgDur': 'Avarage duration: ',
      'ride.co-Passenger': 'Your co-passenger for today',
      'ride.review': 'Rider’s Review',
      'ride.cancelRide': 'Cancel ride',
      'ride.DoNotCancel': 'Don’t cancel ride',
      'ride.cancelRideTitle': 'Are you sure to \ncancel the ride?',

      // Wallet Page Text
      'wallet.title': 'Wallet',
      'wallet.balance': 'balance',
      'wallet.add': 'add',
      'wallet.ridePayment': 'Ride Payment',
      'wallet.amountStatus': 'Amount deducted',

      // Profile Page Text
      'profile.title': 'Profile',
      'profile.applyPromo': 'Apply Promo code',
      'profile.rideDetails': 'My Ride Details',
      'profile.refer': 'Refer & Earn',
      'profile.payment': 'Payment Method',
      'profile.terms': 'Terms of Services',
      'profile.setting': 'Settings',
      'profile.logout': 'Log Out',

      // Date Selection Page Text
      'date.title': 'When Are\nYou Going?',
      'date.setDate': 'Set Date',

      // Seat Selection Page Text
      'seat.title': 'Number Seats \nYou Need?',
      'seat.random': 'Random Seat',
      'seat.confirm': 'Confirm',
      'seat.choosy': 'Are you choosey?',
      'seat.content': 'Choose a specific place \nwhere you want to sit',

      // Booking Page Text
      'booking.title': 'Booking Submitted',
      'booking.content': 'Your request was submitted successfully. To check your booking status, check my ride tab on booking status',

      // Payment Page Text
      'payment.title': 'Payment',
      'payment.content': 'Choose desired vehicle type. We offer cars suitable \nfor most every day needs',
      'payment.method': 'Payment Method',
      'payment.cash': 'Cash',

      // Promo Card Page Text
      'promo.title': 'Add Promo Code',
      'promo.enterPromoCode': 'Enter your promo code',
      'promo.apply': 'Apply',
      'promo.get': 'Get',
      'promo.button': 'Use this code',

      // Driver Profile Page Text
      'driveProfile.title': 'Driver Profile',
      'driveProfile.complete': 'COMPLETED',
      'driveProfile.vehicle': 'MY VEHICLE',
      'driveProfile.report': 'Report this member',

      // Ride Details Page Text
      'ride.title': 'My Rides',
      'ride.current': 'Current Ride',
      'ride.history': 'Ride History',
      'ride.ongoing': 'Ongoing',
      'ride.cancel': 'Cancel ride(\$',
      'ride.fee': ' fee)',
      'ride.wantCancel': 'Are you want to cancel this ride? \nA \$',
      'ride.feeApply': 'fee applies',

      // Refer Page Text
      'refer.referral': 'YOUR REFERRAL CODE',
      'refer.content': 'Share the referral code with your friends and family members and get 100% cashback on first ride.',

      // Terms Page Text
      'terms.title': 'Terms of Service',
      'terms.subTitle': 'Contrary popular belief',
      'terms.paragraph1': 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined',
      'terms.paragraph2': 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,',
      'terms.paragraph3': 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of',

      // Profile Settings Page Text
      'settings.traffic': 'Traffic on the map',
      'settings.cache': 'Clear Cache',
      'settings.showDriver': 'Show driver where I am',

      // Edit Profile Page Text
      'edit.title': 'Edit Profile',
      'edit.dob': 'Date of birth',
      'edit.phone': 'Phone',
      'edit.mail': 'Mail',
      'edit.update': 'Update',

      // Search Sheet Page Text
      'search.destination': 'Enter Destination',
      'search.pickMap': 'Pick on map',

      // Search Page Text
      'search.request': 'Request a ride',

      // My Favorites Page Text
      'fav.other': 'OTHER PLACES',

      // Order Confirm Page Text
      'order.title': 'Order\nConfirmation',
      'order.continuePayment': 'Continue to payment',
      'order.totalPrice': 'Total price ',
      'order.passenger': ' Passenger',

      // Ride Rating Page Text
      'rating.ride': 'Ride Finished',
      'rating.title': 'How was your ride?',
      'rating.experience': 'Rate your experience',
      'rating.drag': 'Drag',
      'rating.complement': 'Give a compliment',
      'rating.service': 'Great Service',
      'rating.car': 'Great Car',
      'rating.route': 'Fast Route',
      'rating.addComment': 'Add a comment',

      // Notification Page Text
      'notification.complete': 'Complete',
      'notification.rejected': 'Rejected',
      'notification.canceled': 'Canceled',

      'auth.signInButton': 'Sign In',
      'auth.signUpButton': 'Sign Up',
      'settings.title': 'Settings',
      'settings.language': 'Language',
      'settings.theme': 'Theme',
      'settings.signOut': 'Sign Out',
      'settings.dark': 'Dark',
      'settings.light': 'Light',
      'settings.system': 'System',
    },
    'fr': {
      'auth.signInButton': 'S\'identifier',
      'auth.signUpButton': 'S\'inscrire',
      'settings.title': 'Paramètres',
      'settings.language': 'Langue',
      'settings.theme': 'Thème',
      'settings.signOut': 'Se déconnecter',
      'settings.dark': 'Sombre',
      'settings.light': 'Lumière',
      'settings.system': 'Système',
    },
  };
}
