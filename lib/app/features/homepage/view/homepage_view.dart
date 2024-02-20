import 'package:bar/app/constants/box.dart';
import 'package:bar/app/constants/strings.dart';
import 'package:bar/app/features/homepage/viewmodels/homepage_viewmodel.dart';
import 'package:bar/app/features/homepage/widgets/bar.dart';
import 'package:bar/app/utils/helper/base_view.dart';
import 'package:bar/app/utils/theme_data/theme.dart';
import 'package:bar/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///[HomePageView] is Home Page Widget which shows up when the App is Loaded with Succesful Authorization.
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppStrings.greetings,style: TT.f16w600,),
            Box.box58,
            Consumer<HomePageViewModel>(builder: (_, provider, __) {
              return Bar(
                posArrow: provider.arrowPosition,
                items: provider.items,
              );
            }),
            Box.box58,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: CustomTextField(
                    controller: number,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              ///To check if user didnt fill the textfield. This should be handled by the form widget, when there is a
                              ///increase in validations but for just one if condition I didnt wanna complicate the code.
                              if(number.text.isEmpty){
                                return;
                              }
                              context
                                  .read<HomePageViewModel>()
                                  .setArrowPosition(int.parse(number.text));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: AppColors.primaryColor,
                              size: 50,
                            )),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
