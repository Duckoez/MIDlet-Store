import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enumerations/palette_enumeration.dart';
import '../../../../core/enumerations/tag_enumeration.dart';
import '../../../../core/enumerations/typographies_enumeration.dart';

import '../../../library/search/search_handler.dart';
import '../../widgets/section_widget.dart';

import '../buttons_factory.dart';

part '../modals/components/categories_filter_component.dart';
part '../modals/components/publishers_filter_component.dart';

part '../modals/objects/filter_modal.dart';

/// A factory for creating [Widget] modals.
class Modals extends StatelessWidget {

  const Modals._internal({
    required this.applyFilters,
    required this.child,
    required this.clearFilters,
    required this.title,
  });

  /// The function for apply filters.
  /// 
  /// This function is used when the "Check" button is tapped.
  final void Function() applyFilters;

  /// The content of a modal.
  final Widget child;

  /// The function for clear the filter query.
  /// 
  /// This function is used when the "Clear" button is tapped.
  final void Function() clearFilters;

  /// The modal's title.
  /// 
  /// This title is shown on the modal header.
  final String title;

  /// The filter modal.
  /// 
  /// Used on the [Search] view to filter the search query.
  factory Modals.filter({
    required ValueNotifier<String?> publisherState,
    required ValueNotifier<List<String>> tagsState,
    required void Function() applyFilters,
    required void Function() clearFilters,
  }) {
    return Modals._internal(
      applyFilters: applyFilters,
      clearFilters: clearFilters,
      title: 'Filters',
      child: _Filter(
        publisherState: publisherState,
        tagsState: tagsState,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (BuildContext context) {
        return Column(
          children: <Widget> [
            Container(
              color: Palette.background.color,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      title.toUpperCase(),
                      style: Typographies.headline(Palette.elements).style,
                    ),
                    const Spacer(),
                    Button(
                      icon: Icons.clear_all_rounded,
                      onTap: () {
                        clearFilters();
                        context.pop();
                      },
                    ),
                    VerticalDivider(
                      color: Palette.transparent.color,
                      width: 7.5,
                    ),
                    Button(
                      icon: Icons.check_rounded,
                      onTap: () {
                        applyFilters();
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Palette.divider.color,
              height: 1,
              thickness: 1,
            ),
            Expanded(
              child: child,
            ),
          ],
        );
      },
      clipBehavior: Clip.hardEdge,
      enableDrag: false,
      onClosing: () {},
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      showDragHandle: false,
    );
  }
}