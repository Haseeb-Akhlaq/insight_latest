import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBar extends StatefulWidget {
  final String? title;
  const TopBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  launchInstagram() async {
    var url = 'https://www.instagram.com/zuka_kherodinashvili/';

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 42,
              width: 44,
              child: SvgPicture.asset(
                'assets/images/lo.svg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15),
            AutoSizeText(
              widget.title!,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'pop-med',
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            launchInstagram();
          },
          child: Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/images/insta.png'),
          ),
        ),
      ],
    );
  }
}
