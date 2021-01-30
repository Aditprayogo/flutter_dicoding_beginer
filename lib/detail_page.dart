import 'package:flutter/material.dart';
import 'package:flutter_submission_pemula/util/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final String danceName;
  final String dancePlaceOfOrigin;
  final String danceDescription;
  final String danceImage;
  final List<String> danceImages;
  final int danceHeroIndex;

  const DetailPage(
      {Key key,
      this.danceName,
      this.dancePlaceOfOrigin,
      this.danceDescription,
      this.danceImage,
      this.danceImages,
      this.danceHeroIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Hero(
                  tag: "danceImage $danceHeroIndex",
                  child: Image.network(danceImage),
                ),
                SafeArea(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: mMargin),
              child: Hero(
                tag: "danceName $danceHeroIndex",
                child: Text(
                  danceName,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: Hero(
                tag: "danceFrom $danceHeroIndex",
                child: Text(
                  "From $dancePlaceOfOrigin",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(mPadding),
              child: Container(
                padding: EdgeInsets.all(mSmallPadding),
                decoration: BoxDecoration(
                    color: mGreyCard,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: mMargin, left: mMargin),
                      child: Text(
                        "Description : ",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: mMargin, left: mMargin, right: mMargin),
                      child: Text(
                        danceDescription,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 150,
                margin: EdgeInsets.only(left: mMargin, right: mMargin),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: danceImages.map((image) {
                    return Padding(
                      padding: EdgeInsets.all(mSmallPadding),
                      child: ClipRRect(
                        child: Image.network(image),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }).toList(),
                )),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
