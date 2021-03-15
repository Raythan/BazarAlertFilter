import 'package:web_scraper/web_scraper.dart';

// final webScraper = WebScraper('https://pub.dev/packages/web_scraper');

void initChaptersTitleScrap() async {
  final rawUrl = 'https://pub.dev/packages/web_scraper';
  final webScraper = WebScraper('https://pub.dev');
  final endpoint = rawUrl.replaceAll('https://pub.dev', '');
  if (await webScraper.loadWebPage(endpoint)) {
    final titleElements = webScraper.getElement(
        'div.detail-wrapper > div.detail-body '
        '> div.detail-tabs '
        '> div.detail-container '
        '> div.detail-tabs-content '
        '> section.tab-content '
        '> table > tbody > tr > td ',
        []);
    print(titleElements);
    final titleList = <String>[];
    titleElements.forEach((element) {
      final title = element['title'];
      titleList.add('$title');
    });
    print(titleList);
    // if (mounted)
    //   setState(() {
    //     this.titleList = titleList;
    //   });
  } else {
    print('Cannot load url');
  }
}
