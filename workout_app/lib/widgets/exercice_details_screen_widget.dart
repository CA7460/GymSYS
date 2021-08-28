import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_app/utilities/database_helper.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/widgets/appbar.dart';
import 'package:workout_app/services/services.dart';
import 'package:workout_app/models/details.dart';
import 'package:workout_app/models/expansion_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciceDetailsScreenWidget extends StatelessWidget {
  final Exercice _exercice;
  ExerciceDetailsScreenWidget(this._exercice);

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const sidePadding = 18.0;
    final imageWidth = screenWidth - (sidePadding * 2);
    final AdatpativeAppBar categoryAppBar = AdatpativeAppBar(_exercice.name);

    List<ExpansionItem> expansionItems;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: categoryAppBar,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/background/background_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Expanded(
            child: Container(
              color: Color(0xad3a4155),
              padding: EdgeInsets.only(
                  top: sidePadding, left: sidePadding, right: sidePadding),
              child: FutureBuilder(
                future: _loadDetailsFromDatabase(_exercice.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Object? donneesDetails = snapshot.data;
                    List<Details> detailsList = donneesDetails as List<Details>;
                    Details details = detailsList[0];

                    expansionItems = <ExpansionItem>[
                      ExpansionItem(
                          header: "Description",
                          content: details.longDescription),
                      if (details.muscles != "")
                        ExpansionItem(
                            header: "Muscles Solicités",
                            content: details.muscles),
                      if (details.execution != "")
                        ExpansionItem(
                            header: "Exécution de l'exercice",
                            content: details.execution),
                    ];

                    var url = details.youtubeLink;

                    YoutubePlayerController _controller =
                        YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
                      flags: YoutubePlayerFlags(
                        autoPlay: true,
                        mute: true,
                        disableDragSeek: false,
                        loop: true,
                        isLive: false,
                      ),
                    );

                    return Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: imageWidth,
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: YoutubePlayer(
                                    controller: _controller,
                                    liveUIColor: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: sidePadding,
                          ),
                          Expanded(
                            child: ExpansionDetails(expansionItems),
                          ),
                        ],
                      ),
                    );
                    //),
                    //);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Details>> _loadDetailsFromDatabase(int id) async {
    await databaseHelper.initializeDatabase();
    List<Details> detailsListMap = await databaseHelper.getDetailsForExercice(id);
    return detailsListMap;
  }
}

class ExpansionDetails extends StatefulWidget {
  final List<ExpansionItem> expansionItems;
  const ExpansionDetails(this.expansionItems, {Key? key}) : super(key: key);

  @override
  _ExpansionDetailsState createState() => _ExpansionDetailsState();
}

class _ExpansionDetailsState extends State<ExpansionDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(color: Colors.black, thickness: 0, height: 8),
      shrinkWrap: true,
      itemCount: widget.expansionItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionPanelList(
          animationDuration: Duration(milliseconds: 600),
          elevation: 1,
          children: [
            ExpansionPanel(
              backgroundColor: Colors.white.withOpacity(0.75),
              body: Container(
                padding:
                    EdgeInsets.only(top: 0, left: 14, right: 10, bottom: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipOval(
                      child: CircleAvatar(
                        child: Image.asset(
                          'assets/images/expansion/dumbell_icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.expansionItems[index].content,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          letterSpacing: 0.3,
                          height: 1.3),
                    ),
                  ],
                ),
              ),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.expansionItems[index].header,
                    style: TextStyle(
                      //color: itemData[index].colorsItem,
                      fontSize: 18,
                    ),
                  ),
                );
              },
              isExpanded: widget.expansionItems[index].expanded,
            ),
          ],
          expansionCallback: (int item, bool status) {
            setState(() {
              widget.expansionItems[index].expanded =
                  !widget.expansionItems[index].expanded;
              for (int i = 0; i < widget.expansionItems.length; i++) {
                if (i != index) widget.expansionItems[i].expanded = false;
              }
            });
          },
        );
      },
    );
  }
}
