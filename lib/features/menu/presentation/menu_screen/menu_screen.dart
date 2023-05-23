import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/enums/screen_size.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/recipes_layout.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item_wrapper.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_screen/blocs/get_products_cubit/get_products_cubit.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/widgets/app_error_text.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:manty_nomer_1/widgets/custom_app_bar.dart';

@RoutePage()
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetProductsCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Меню'),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (UserScrollNotification notification) {
            if (notification.direction == ScrollDirection.forward ||
                notification.direction == ScrollDirection.reverse) {
              scrollDirectionNotifier.value = notification.direction;
            }
            return true;
          },
          child: BlocBuilder<GetProductsCubit, GetProductsState>(
            builder: (context, state) {
              return state.when(
                loading: () => const AppIndicator(),
                error: (error) => AppErrorText(error: error),
                success: (model) => GridView.builder(
                  padding: EdgeInsets.only(
                    left: ScreenSize.of(context).isLarge ? 5 : 3.5,
                    right: ScreenSize.of(context).isLarge ? 5 : 3.5,
                    top: 10,
                    bottom: MediaQuery.of(context).padding.bottom + 20,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        RecipesLayout.of(context).gridCrossAxisCount,
                    childAspectRatio:
                        RecipesLayout.of(context).gridChildAspectRatio,
                  ),
                  itemCount: model.length,
                  cacheExtent: 0,
                  itemBuilder: (context, i) {
                    return ValueListenableBuilder(
                      valueListenable: scrollDirectionNotifier,
                      child: MenuListItem(model[i]),
                      builder:
                          (context, ScrollDirection scrollDirection, child) {
                        return MenuListItemWrapper(
                          scrollDirection: scrollDirection,
                          child: child!,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
