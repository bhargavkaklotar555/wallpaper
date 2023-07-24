import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/wallpaper_api_provider.dart';
import '../../modals/myRoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset("assets/images/text.png"),
        ),
        backgroundColor: Color(0xff0F0E1C),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Consumer<APIControllers>(
          builder: (context, provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  onSubmitted: (val) {
                    provider.search(val: val);
                    print("data : $val");
                  },
                  decoration: InputDecoration(
                    hintText: "search",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyRoutes.wallpaper_detail_page,
                            arguments: provider.data[index],
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            provider.data[index]['largeImageURL'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      backgroundColor: Color(0xff0F0E1C),
    );
  }
}
