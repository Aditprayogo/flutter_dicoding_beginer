import 'package:flutter/material.dart';
import 'package:flutter_submission_pemula/detail_page.dart';
import 'package:flutter_submission_pemula/model/traditional_dance_data.dart';
import 'package:flutter_submission_pemula/util/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  final String name;

  const MainPage({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(mPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello $name",
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Traditional Dance From Indonesia",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: traditionalDanceList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //do something
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailPage(
                                  danceName: traditionalDanceList[index].name,
                                  dancePlaceOfOrigin:
                                      traditionalDanceList[index].placeOfOrigin,
                                  danceDescription:
                                      traditionalDanceList[index].description,
                                  danceImage: traditionalDanceList[index].image,
                                  danceImages:
                                      traditionalDanceList[index].images,
                                  danceHeroIndex: index,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(mMedPadding),
                          margin: EdgeInsets.only(bottom: mMargin),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Hero(
                                        tag: "danceImage $index",
                                        child: Image.network(
                                          traditionalDanceList[index].image,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: "danceName $index",
                                          child: Text(
                                            traditionalDanceList[index].name,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Hero(
                                          tag: "danceFrom $index",
                                          child: Text(
                                            "From ${traditionalDanceList[index].placeOfOrigin}",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
