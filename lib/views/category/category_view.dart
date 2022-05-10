import 'package:my_shop/constants/asset_constants.dart';
import 'package:my_shop/shared/styles.dart';
import 'package:my_shop/viewmodels/category_viewmodel.dart';
import 'package:my_shop/views/category/product_category_grid_list.dart';
import 'package:my_shop/widgets/dumb/customized_app_bar.dart';
import 'package:my_shop/widgets/dumb/loading_indicator.dart';
import 'package:my_shop/widgets/dumb/page_error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  final int id;
  final String title;

  const CategoryView({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return ViewModelBuilder<CategoryViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.onModelReady(id),
      viewModelBuilder: () => CategoryViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: appWhiteColor,
        body: Column(
          children: [
            CustomizedAppBar(
              title: title,
              leading: AssetConstants.backArrowBlack,
              leadingOnTap: () {
                Navigator.of(context).pop();
              },
              trailing: AssetConstants.filterBlack,
              trailingOnTap: () {},
            ),
            const SizedBox(height: 13),
            Expanded(
              child: model.hasError
                  ? const PageErrorIndicator()
                  : model.isLoading
                      ? const LoadingIndicator()
                      : model.products.isEmpty
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: Text(
                                  'No products found',
                                  style: paragraph1,
                                ),
                              ),
                            )
                          : const ProductCategoryGridList(),
            ),
          ],
        ),
      ),
    );
  }
}
