import 'package:flutter/material.dart';
import 'package:news_app/generated/assets.dart';
import 'package:news_app/pages/news_detail/controller.dart';
import 'package:get/get.dart';

class NewsDetail extends GetView<NewsController> {
  const NewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (value) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 32, // Smaller icon size
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xff30393C).withOpacity(0.5)),
                  ),
                  padding: EdgeInsets.zero, // No padding to keep it tight
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      print('Bookmark');
                    },
                    icon: const Icon(
                      Icons.bookmark_border,
                      size: 32, // Smaller icon size
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(const Color(0xff30393C).withOpacity(0.5)),
                    ),
                    padding: EdgeInsets.zero, // No padding to keep it tight
                  ),
                  IconButton(
                    onPressed: () {
                      print('More');
                    },
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 32, // Smaller icon size
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(const Color(0xff30393C).withOpacity(0.5)),
                    ),
                    padding: EdgeInsets.zero, // No padding to keep it tight
                  ),
                ],
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: Size(0, AppBar().preferredSize.height),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(8.0),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'CNN News American',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    Assets.imagesNorraYumi,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "For the first time in six months, Jurgen Klopp might have broken from his new-found "
                    "tradition of watching football matches with his feet up somewhere sunny, bottle of b"
                    "eer in hand, enjoying the game without a care in the world.This was a meeting of his o"
                    "ld club, a team which will remain in his heart for life, and his new charges. To much d"
                    "isgust in Germany – Klopp will soon become head of global football at Red Bull and thus h"
                    "ave an influence on strategy at RB Leipzig, RB Salzburg among others.He would have hardly b"
                    "een pacing up and down in his living room gesticulating akin to his famed touchline antics a"
                    "t Anfield but one imagines this fiercely-contested, high-octane battle – in keeping with the "
                    "Red Bull theme – at least set the senses roaring again.That means the Dutchman is the first m"
                    "anager in Liverpool history to win 11 of his first 12 – bettering Sir Kenny Dalglish\'s start "
                    "– which is not bad considering Slot sent a warning to the Reds title rivals on the eve of the "
                    "game by saying they had seen nothing yet.'We should be proud because so many great teams have"
                    " worn this shirt and so many great managers have been at the club,' said Slot. 'So to achieve "
                    "something that hasn't been done before is almost impossible and always nice.But there is som"
                    "ething that is much nicer than records and you know what I mean by that – trophies.This displ"
                    "ay was not perfect, mind, though Nunez, Cody Gakpo and Virgil van Dijk all came within inches "
                    "of adding goals. Peter Gulacsi, who was in Liverpool\'s academy and also played for Hull among "
                    "others, put in an inspired performance to keep the scores down.This trip to Leipzig, a charm"
                    "ing city with Eastern Bloc vibes, represented what might well have been Slot\'s toughest test"
                    " yet as Liverpool boss. Marco Rose\'s team are unbeaten in the German Bundesliga and behind l"
                    "eaders Bayern Munich on goal difference alone.They started well, too, and had multiple early c"
                    "hances. Lois Openda nearly charged through on goal only to be stumped by tough defending from "
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    "Ibrahima Konate – once of this parish with four seasons at Leipzig – then Amadou Haidara saw a"
                    " powerful shot saved.Producers of goalkeeper blooper reels would have been excited minutes la"
                    "ter when Caoimhin Kelleher nearly gifted Leipzig the lead. The Irishman charged off his line, "
                    "misjudged the bounce of the ball and his attempted headed clearance was weak and did not clear the danger.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Get.isDarkMode ? Colors.white : Colors.black
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
