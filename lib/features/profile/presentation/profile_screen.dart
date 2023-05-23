import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/profile/presentation/widgets/profile_widget.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = sl<SharedPreferences>().getString(SharedKeys.name) ?? '';
  String image = sl<SharedPreferences>().getString(SharedKeys.image) ?? '';
  final email = sl<SharedPreferences>().getString(SharedKeys.authEmail) ?? '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CachedNetworkImage(
                imageUrl: image,
                placeholder: (_, url) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.4),
                      highlightColor: Colors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
                imageBuilder: (_, imageProvider) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              Text(
                name,
                style: AppTextStyles.s19W400(),
              ),
              const SizedBox(height: 5),
              Text(
                email,
                style: AppTextStyles.s19W400(),
              ),
              const SizedBox(height: 18),
              ProfileWidget(
                title: 'История заказов',
                icon: Icons.history,
                onTap: () {
                  context.router.push(const HistoryRoute());
                },
              ),
              ProfileWidget(
                title: 'О компании "Manty nomer 1"',
                icon: Icons.abc,
                onTap: () {
                  context.router.push(const AboutCompanyRoute());
                },
              ),
              ProfileWidget(
                title: 'Сменить язык',
                icon: Icons.language_outlined,
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Тема',
                icon: Icons.color_lens_outlined,
                onTap: () async {
                
                },
              ),
              ProfileWidget(
                title: 'Редактировать профиль',
                icon: Icons.person_2_outlined,
                onTap: () async {
                  await context.router.push(
                    EditProfileRoute(
                      image: image,
                      name: name,
                    ),
                  );
                  setState(
                    () {
                      name =
                          sl<SharedPreferences>().getString(SharedKeys.name) ??
                              '';
                      image =
                          sl<SharedPreferences>().getString(SharedKeys.image) ??
                              '';
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
