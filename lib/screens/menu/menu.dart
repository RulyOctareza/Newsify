import 'package:flutter/material.dart';
import 'package:newsify/screens/menu/menu_widget.dart';
import 'package:newsify/static/custom/text_button_widget.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class Menu extends StatelessWidget {
  final String? name;

  const Menu({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    String name = 'Adibagus ganet';

    return Scaffold(
      backgroundColor: green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 25,
            bottom: 35,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: IconButton(
                      icon: Icon(Icons.close_rounded, size: 24),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 74,
                      width: 74,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image_person.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    name,
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 26,
                      color: darkGreen,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              MenuWidget(title: 'Home', color: darkGreen, ontap: () {}),
              MenuWidget(ontap: () {}, title: 'Saved', color: darkGreen),
              MenuWidget(ontap: () {}, title: 'Settings', color: darkGreen),
              Spacer(),

              TextButtonWidget(onPressed: () {}, title: 'About Us'),
              TextButtonWidget(onPressed: () {}, title: 'Contact Us'),
              TextButtonWidget(
                onPressed: () {},
                title: 'Rate us on Play Store',
              ),
              TextButtonWidget(onPressed: () {}, title: 'Write a Feedback'),
            ],
          ),
        ),
      ),
    );
  }
}
