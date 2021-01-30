import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final String danceName;
  final String dancePlaceOfOrigin;
  final String danceDescription;
  final String danceImage;
  final List<String> danceImages;

  const DetailPage(
      {Key key,
      this.danceName,
      this.dancePlaceOfOrigin,
      this.danceDescription,
      this.danceImage,
      this.danceImages})
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
                Image.network(danceImage),
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
              margin: EdgeInsets.only(top: 16),
              child: Text(
                danceName,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                "From $dancePlaceOfOrigin",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        "Description : ",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
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
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: danceImages.map((image) {
                    return Padding(
                      padding: EdgeInsets.all(4),
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
