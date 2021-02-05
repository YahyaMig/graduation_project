import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/custom_card.dart';
import 'package:graduation_project_2/components/custome_text_field.dart';
import 'package:graduation_project_2/constants.dart';

class AddLinkScreen extends StatefulWidget {
  static String id = 'addLinkScreen';
  @override
  _AddLinkScreenState createState() => _AddLinkScreenState();
}

class _AddLinkScreenState extends State<AddLinkScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Background(
          mainImage: true,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Text(
                    'Add Links',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro'),
                  ),
                ),
                SizedBox(
                  height: 130.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10.0),
                  child: CustomCard(
                    child: kTextField(
                      onChanged: (value) {
                        kUser.multiMediaLinks.youtubeLink = value;
                      },
                      hintText: 'YouTube Link',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: CustomCard(
                    child: kTextField(
                      onChanged: (value) {
                        kUser.multiMediaLinks.dropboxLink = value;
                      },
                      hintText: 'DropBox Link',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: CustomCard(
                    child: kTextField(
                      onChanged: (value) {
                        kUser.multiMediaLinks.zoomLink = value;
                      },
                      hintText: 'Zoom Link',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () async {
                      Map<String, dynamic> data = {
                        "user_id": kUser.userID,
                        "youtube": kUser.multiMediaLinks.getYoutubeLink(),
                        "dropbox": kUser.multiMediaLinks.getDropBox(),
                        "zoom": kUser.multiMediaLinks.getZoom(),
                      };
                      dynamic response = await invokeAPI('add_link', data);
                      if (response['status_code'] == 200) {
                        showAlertDialog(
                            context, 'Added Successfully!', 'Links are added!');
                      } else {
                        showAlertDialog(
                            context, 'ERROR', 'Something went wrong!');
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(
                          colors: [
                            Color.fromARGB(255, 50, 220, 255),
                            Color.fromARGB(255, 0, 110, 255)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
