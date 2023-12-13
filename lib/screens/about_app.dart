import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Widget githubButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: ElevatedButton(
          onPressed: () async {
            HapticFeedback.mediumImpact();
            var url = Uri(
              scheme: 'https',
              host: 'praneshpyarashrestha.com.np',
              // path: '/miracleanupam/ADKosh',
            );
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            );
          },
          child: FaIcon(
            FontAwesomeIcons.dev,
            size: 25,
          )),
    );
  }

  Widget RateUsButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: ElevatedButton(
          onPressed: () async {
            LaunchReview.launch(androidAppId: "com.praneshtechapps.sabdasagar");
            // HapticFeedback.mediumImpact();
            // var url = Uri(
            //   scheme: 'https',
            //   host: 'praneshpyarashrestha.com.np',
            //   // path: '/miracleanupam/ADKosh',
            // );
            // await launchUrl(
            //   url,
            //   mode: LaunchMode.externalApplication,
            // );
          },
          child: Icon(
              // FontAwesomeIcons.revi,
              Icons.reviews
              // size: 25,

              )),
    );
  }

  Widget homeButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: ElevatedButton(
          onPressed: () async {
            HapticFeedback.mediumImpact();
            var url = Uri(
                scheme: 'https',
                host: 'praneshtechapps1.blogspot.com',
                path: '/2023/11/privacy-policy-sabda-sagar.html');
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            );
          },
          child: FaIcon(
            FontAwesomeIcons.question,
            size: 25,
          )),
    );
  }

  Widget scrollableBody(context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                // Icon(Icons.arrow_back_ios),
                Text(
                  'शब्द सागर',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            Divider(),
            Text(
              '२००,००० भन्दा बढी शब्दहरूको विशाल संग्रहबाट नै शुरु गरेको यो एप्लिकेसनले नेपाली भाषामा शब्दहरूको अर्थ, उपयोग, र व्याकरणिक श्रेणीहरू तथा अन्य विशेषताहरूसहित अनौपचारिक र साहसिक रूपमा परिचित गराउँछ।',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'पहिले बजारमा भएका आ्याप हरुमा मैले चाहेका धेरै सुविधाहरु नभएकोले आफैंले यो आ्याप बनाउने जमर्को गरेको हुँ । ',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              // 'यहाँ केहि त्रुटिहरु भेट्टाउनु भयो भने गिटहबमा वा मेरो वेबसाइट मार्फत सम्पर्क गर्नुहोला । आ्यापलाई अझ राम्रो बनाउन चाहानुहुन्छ भने गिटहबमा Pull Request पठाउनु होला ।',
              '',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Divider(),
            Text(
              'मुख्य विशेषताहरू निम्नलिखित छन्:',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '''
  १. विस्तृत शब्द तालिका:
     - २००,००० भन्दा बढी नेपाली शब्दहरूको विस्तृत तालिका प्राप्त गर्नुहोस्।

  २. खोज र पर्याय:
     - शब्दहरूलाई खोज्नुहोस् र विस्तृत पर्यायहरू र अर्थहरू प्राप्त गर्नुहोस्।

  ३. खोज+ विशेषता:
     - निश्चित अक्षरमा भित्र खोजी गरी शब्दहरू प्राप्त गर्नका लागि खोज+ विशेषता प्रदान गरिएको छ।

  ४. विविध शब्द उत्पन्न गर्नुहोस्:
     - नयाँ शब्दहरू सिक्नका लागि शब्दहरू विविधमा उत्पन्न गर्नुहोस्, शब्दसंग्रहलाई वृद्धि गर्दै।


  ५. फेभरेट शब्दहरू:
     - तपाईंको मनपरेका शब्दहरूलाई पसंदीदा चिन्हिएर शब्दसंग्रह बनाउनुहोस् र छलफल गर्नका लागि पुनरावलोकन गर्नुहोस्।

  ६. व्याकरणिक श्रेणीहरू:
     - शब्दहरूको व्याकरणिक श्रेणीहरूलाई अन्वेषण गर्नुहोस्, भाषा संरचनाको ठूलो बुझाइ गराउने।

  ७. अफलाइन पहुँच:
     - शब्दकोषलाई अफलाइनमा पहुँच गर्नुहोस्, जुन अधिकांश जडानको साथै अनुपलब्धता भएको क्षेत्रमा पनि उपलब्ध छ।

  ८. उपयोगकर्ता-मित्रपूर्ण इन्टरफेस:
     - मिलनसर र अनुप्रयोगकर्ता-मित्रपूर्ण डिजाइनमा मनोबल र अनुभवका लागि उपयोगकर्ता-मित्रपूर्ण डिजाइन गरिएको छ।

  ९. भाषा सुधार:
     - नियमित अध्ययन र अनुसन्धानका माध्यमबाट आफ्नो नेपाली भाषाको कौशल बढाउनुहोस्।

  १०. व्यक्तिगत अनुकूलन:
      - तपाईंको प्राथमिकतामा अनुसार सेटिङहरूलाई अनुकूलन गर्नुहोस्।
  ''',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(child: scrollableBody(context)),
              Column(
                children: [
                  Text('Version: 1.0.2'),
                  Text('Pranesh Tech Apps'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [RateUsButton(), homeButton(), githubButton()],
                  )
                ],
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [githubButton(), homeButton()],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
