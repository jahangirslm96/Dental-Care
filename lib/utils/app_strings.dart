class AppStrings {

  AppStrings._();

  // Define your static strings here
  static const String welcome = "Welcome to the App!";
  static const String login = "Login to your account";
  static const String signup = "Sign up to get started";
  static const String email = "Email Address";
  static const String password = "Password";


  static const String registerAsPatient = "Register as a Patient";
  static const String patientDetails = "Patient Details:";
  static const String accountInformation = "Account Information:";
  static const String alreadyHaveAccount = "Already have an account?";
  static const String logIn = "     Log In";
  static const String logInSuccessful = "Login Successful";
  static const String userInformation = "User Information";

  // ** Dashboard Screen Strings ** //
  static const String currentState = "Current State:";
  static const String searchByDoctor = "Search by Doctor...";
  static const String services = "Services";

  // ** Appointment Screen Strings ** //
  static const String appointmentDate = "Appointment date";
  static const String status = "Status";
  static const String action = "Action";
  static const String appointmentID = "Appointment ID";
  static const String paymentMethodPleaseSelect = "Please select from one of your previous card for payment:";

  // ** Payment Method Screen Strings ** //
  static const String yourSavedCards = "Your saved cards";
  static const String paymentDetails = "Payment Details";
  static const String processPayment = "Process Payment";
  static const String addNewCard = "Add New Card";

  // ** Card Details Screen Strings ** //
  static const String totalAmount = "Total Amount";
  static const String personalInformation = "Personal Information";
  static const String paymentMethods = "Payment Methods";
  static const String creditOrDebit = "Credit or Debit";

  // ** Privacy Policy Screen Strings ** //
  static const String introduction = "Introduction";
  static const String uhcsText = "Umbrella Health Care Systems";
  static const String introductionPrivacyPolicy = "Umbrella Health Care Systems (“Umbrella,” “we,” “our,” or “us”) respects the privacy of your information. This Privacy Policy is designed to assist you in understanding how we collect, use and safeguard the information you provide to us in using our website (“www.umbrellamd.com”) and the services provided through our Site (“Services”).\nFrom time to time, we may change this Privacy Policy. If we do, we will post an amended version on this webpage. Please review this Privacy Policy periodically.";
  static const String collectingAndUsingInformation = "Collecting and Using Information";
  static const String collectingAndUsingInformationSubTitle = "Personally Identifiable Information We Collect Online";
  static const String collectingAndUsingInformationDescriptiveText = "We collect Personally Identifiable Information from you through your use of the Site and Services. “Personally Identifiable Information” is individually identifiable information about an individual consumer that we collect online and that we maintain in an accessible form. We collect the following types of Personally Identifiable Information:";
  static const String privacyPolicy = "Privacy policy";

  // ** All Sessions Screen Strings ** //
  static const String sessionID = "Session ID";
  static const String cost = "Cost";
  static const String datee = "Date : ";
  static const String endTime = "End Time : ";
  static const String startTime = "Start Time : ";
  static const String providerNote  = "Provider Note :";
  static const String diagnosis  = "Diagnosis :";

  // ** Online Intake Specialist Screen Strings ** //
  static const String initialPrice  = "Initial Price: ";
  static const String followUpPrice  = "Follow-up Price: ";


  // ** Medical Profile Screen Strings ** //
  static const String editMedicalHistory  = "Edit Medical\nHistory";
  static const String allYourMedical  = "All your medical details are here";
  static const String addMedicalConditions  = "Add Medical Conditions";
  static const String addFamilyDetails  = "Add Family Details";



  // You can also have methods if you need dynamic text generation
  static String greeting(String username) {
    return "Hello, $username!";
  }
}



