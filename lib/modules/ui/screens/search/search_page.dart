import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/search/parts/search_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const routeName = "search/screen";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late String searchText = '';

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Expanded(
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = _searchController.text;
              });
            },
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              hintText: 'Search...',
              fillColor: lightWhite,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgIcon(
                  iconName: AppIcons.close,
                  color: grey,
                  size: 24,
                  function: () {
                    _searchController.clear();
                    setState(() {});
                  },
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgIcon(
                  iconName: AppIcons.searchIcon,
                  color: grey,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Expanded(
        child: SearchList(
          searchName: searchText,
        ),
      ),
    );
  }
}
