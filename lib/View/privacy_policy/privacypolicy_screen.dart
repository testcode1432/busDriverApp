import 'package:caringio_student/hooks/commonWidgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  static String routeName = "/privacy_policy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: gradientAppBar(
          leadingWidget: const Icon(
            Icons.arrow_back,
            color: kTextWhite,
          ),
          leadingonpress: () {
            Navigator.pop(context);
          },
          text: "Privacy Policy",
          prefferdHeight: 60,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              kheight20,
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              kheight10,
              const Text(
                "By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to caringio.\nCaringio is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\nThe caring app stores and processes personal data that you have provided to us, to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the caring app won’t work properly or at all.   \n The app does use third-party services that declare their Terms and Conditions.\nLink to Terms and Conditions of third-party service providers used by the app:",
                style: TextStyle(fontSize: 16.0),
              ),
              const Row(children: [
                Text(
                  "\u2022",
                  style: TextStyle(fontSize: 30),
                ), //bullet text
                SizedBox(
                  width: 10,
                ), //space between bullet and text
                Expanded(
                  child: Text(
                    "Google Play Services",
                    style: TextStyle(fontSize: 16),
                  ), //text
                )
              ]),
              Text(
                "You should be aware that there are certain things that caringio will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but caringio cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.Along the same lines, caringio cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, caringio cannot accept responsibility.With respect to caringio’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Caringio accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems (and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Caringio does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you. We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.Your privacy is of utmost importance to us. We want to assure you that all sensitive data, including email addresses and phone numbers, is securely stored in our system. Only you, the user, have access to this information, and no developer or unauthorized party can access your data.We understand the importance of your privacy and want to be transparent about how we use camera access and Android ID in our application. These permissions are utilized solely for enhancing the functionality of our app in a secure and responsible manner. We want to assure you that your data will not be misused in any circumstance.Collection of various types of user information, their purposes, and the commitment to data security and responsible handling for the sole purpose of application functionality.",
                style: TextStyle(fontSize: 15.sp),
              ),
              kheight10,
              Text(
                "Personal Information We Collect",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "User information like EmailId, address, Contact information, academic information etc is being collected and solely used for the purpose of providing the core functionality of our application only.",
                style: TextStyle(fontSize: 16.sp),
              ),
              kheight10,
              Text(
                "How We Share Personal Information",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "At CARINGIO, we consider the information we collect from our customers to be a vital aspect of our business. We want to make it clear that we are not in the business of selling our customers' personal information to others and will strictly take care of data privacy.",
                style: TextStyle(fontSize: 16.sp),
              ),
              kheight10,
              Text(
                "How We Secure Information",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "Caringio conveys the commitment in protecting user information and maintaining a secure environment for storing the user information. Whole data is securely stored in private and firewall-protected database systems.",
                style: TextStyle(fontSize: 16.sp),
              ),
              kheight10,
              Text(
                "Children’s Personal Information",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "We don’t provide Offerings for usage by children. If you’re under 18, you may use the application only with the involvement of a parent or guardian.",
                style: TextStyle(fontSize: 16.sp),
              ),
              kheight10,
              Text(
                "Retention of Personal Information",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "We keep your personal information to enable your continued use of application, for as long as it is required in order to fulfil the relevant purposes described in this Privacy Notice, may be required as communicated to you. How long we retain specific personal information varies depending on the purpose for its use, and personal information will be erased in accordance with proper functioning of application.",
                style: TextStyle(fontSize: 16.sp),
              ),
              kheight10,
              Text(
                "Changes to This Terms and Conditions",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page. These terms and conditions are effective as of 2023-08-21",
                style: TextStyle(fontSize: 16.sp),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at admin@caringio.in. This Terms and Conditions page was generated by App Privacy Policy Generato',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    TextSpan(
                      text: ' admin@caringio.in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              kheight20,
              kheight20,
            ],
          ),
        ));
  }
}
