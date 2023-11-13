import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_input_field.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.placeholder,
    required this.trailingTapped,
    required this.onFieldSubmitted,
  });

  final void Function() trailingTapped;
  final void Function(String) onFieldSubmitted;
  final String placeholder;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppInputField(
        controller: _searchController,
        placeholder: widget.placeholder,
        leading: const Icon(Icons.search),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) => widget.onFieldSubmitted(value),
        trailing: const Icon(Icons.close),
        trailingTapped: () {
          _searchController.clear();
          widget.trailingTapped();
        });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
