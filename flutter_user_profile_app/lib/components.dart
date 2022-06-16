import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconWidget extends StatefulWidget {
  const SocialIconWidget({
    Key? key,
    required this.icon,
    required this.url,
    required this.isLightThemeEnabled,
  }) : super(key: key);

  final IconData icon;
  final String url;
  final bool isLightThemeEnabled;

  @override
  State<SocialIconWidget> createState() => _SocialIconWidgetState();
}

class _SocialIconWidgetState extends State<SocialIconWidget> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        onTap: () {
          _launchUrl(url: Uri.parse(widget.url));
        },
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Column(
          children: [
            Icon(widget.icon,
                color: isHover
                    ? Colors.deepPurpleAccent
                    : (widget.isLightThemeEnabled
                        ? Colors.black
                        : Colors.white),
                size: isHover ? 33 : 30),
            AnimatedContainer(
                curve: Curves.linear,
                margin: const EdgeInsets.only(top: 8),
                duration: const Duration(milliseconds: 400),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    color:
                        isHover ? Colors.deepPurpleAccent : Colors.transparent,
                    borderRadius: isHover ? BorderRadius.circular(100) : null)),
          ],
        ));
  }

  void _launchUrl({required url}) async {
    if (!await launchUrl(url)) {
      throw const SnackBar(content: Text("We Can't Open this Url"));
    }
  }
}

class BottomSideIcons extends StatelessWidget {
  const BottomSideIcons({
    Key? key,
    required this.isLightThemeEnabled,
  }) : super(key: key);
  final bool isLightThemeEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SocialIconWidget(
          icon: FeatherIcons.instagram,
          url: "your instagram link",
          isLightThemeEnabled: isLightThemeEnabled,
        ),
        const SizedBox(
          width: 10,
        ),
        SocialIconWidget(
          icon: FeatherIcons.youtube,
          url: "your youtube link",
          isLightThemeEnabled: isLightThemeEnabled,
        ),
        const SizedBox(
          width: 10,
        ),
        SocialIconWidget(
          icon: FeatherIcons.github,
          url: "your youtube github",
          isLightThemeEnabled: isLightThemeEnabled,
        ),
        const SizedBox(
          width: 10,
        ),
        SocialIconWidget(
          icon: FeatherIcons.coffee,
          url: "your Donate link",
          isLightThemeEnabled: isLightThemeEnabled,
        ),
        const SizedBox(
          width: 10,
        ),
        SocialIconWidget(
          icon: FeatherIcons.mail,
          url: "your Email link",
          isLightThemeEnabled: isLightThemeEnabled,
        ),
      ],
    );
  }
}
