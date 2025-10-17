import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  final String? uri =
      "https://static.vecteezy.com/system/resources/previews/026/418/808/non_2x/man-head-user-profile-character-free-png.png";

  static const List<Map<String, dynamic>> skillsData = [
    {
      "name": "Python",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1200px-Python-logo-notext.svg.png",
    },
    {
      "name": "Swift",
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5968/5968371.png",
    },
    {
      "name": "MySQL",
      "imageUrl":
          "https://toppng.com/uploads/preview/mysql-logo-png-image-11660514413jvwkcjh4av.png",
    },
    {
      "name": "XD",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Adobe_XD_CC_icon.svg/2101px-Adobe_XD_CC_icon.svg.png",
    },
    {
      "name": "Figma",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Figma-logo.svg/1667px-Figma-logo.svg.png",
    },
  ];

  static const List<Map<String, dynamic>> experienceData = [
    {
      "startDate": "2022 March",
      "endDate": "2023 June",
      "title": "Swift Content Creator",
      "company": "CharCode",
    },
    {
      "startDate": "2021 February",
      "endDate": "2022 March",
      "title": "App Developer",
      "company": "JC Studio",
    },
    {
      "startDate": "2020 January",
      "endDate": "2021 January",
      "title": "React Developer",
      "company": "Epam Systems",
    },
    {
      "startDate": "2018 January",
      "endDate": "2020 January",
      "title": "Freelancer",
      "company": "Workana",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                ProfileInfoSection(uri: uri),
                SkillsSection(items: skillsData),
                ExperienceSection(items: experienceData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfoSection extends StatefulWidget {
  final String? uri;

  const ProfileInfoSection({super.key, this.uri});

  @override
  State<ProfileInfoSection> createState() => _ProfileInfoSectionState();
}

class _ProfileInfoSectionState extends State<ProfileInfoSection> {
  void onClickContactButton() async {
    final uri = Uri.parse(
      "https://www.linkedin.com/in/omar-arenas-fullstack-developer/",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("No pudo navegar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child:
                    (widget.uri != null) &&
                            (widget.uri is String) &&
                            widget.uri!.isNotEmpty
                        ? Image.network(widget.uri!, fit: BoxFit.cover)
                        : Icon(Icons.account_circle, size: 200),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    "Omar Arenas",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Mobile Developer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Lorem id amet sint duis aute laboris labore elit. Laborum anim nostrud consequat adipisicing consequat ea consectetur. Anim quis Lorem pariatur consequat voluptate. Quis sunt laboris laboris consectetur aliqua irure ipsum id ea.",
          maxLines: 5,
        ),
        SizedBox(height: 30),
        FractionallySizedBox(
          widthFactor: 1,
          child: ElevatedButton(
            onPressed: () => onClickContactButton(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(163, 132, 93, 1),
            ),
            child: Text(
              "Contact Me",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class SkillsSection extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const SkillsSection({super.key, required this.items});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "Skills",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: widget.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var currentItem = widget.items[index];
              return SizedBox(
                width: 80,
                child: Column(
                  spacing: 10,
                  children: [
                    Image.network(
                      currentItem["imageUrl"],
                      width: 60,
                      height: 60,
                    ),
                    Text(
                      currentItem["name"],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 25),
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const ExperienceSection({super.key, required this.items});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            "Experience",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: ListView.separated(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var currentItem = widget.items[index];
                return ExperienceItem(
                  startDate: currentItem["startDate"],
                  endDate: currentItem["endDate"],
                  title: currentItem["title"],
                  company: currentItem["company"],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatefulWidget {
  final String startDate;
  final String endDate;
  final String title;
  final String company;

  const ExperienceItem({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.company,
  });

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        constraints: BoxConstraints(minHeight: 90),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.startDate} - ${widget.endDate}",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(141, 141, 141, 1),
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              widget.company,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
