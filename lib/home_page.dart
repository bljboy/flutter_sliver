import 'package:flutter/material.dart';
import 'package:flutter_sliver2/detailpage.dart';
import 'package:flutter_sliver2/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "Travel Blog",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
          Expanded(
            flex: 2,
            child: TravelWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: MostPopularWidget(),
          )
        ],
      ),
    );
  }
}

class MostPopularWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        var bean = posts[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return DetailPage(bean);
            }));
          },
          child: Hero(
            tag: bean.imageUrl2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      bean.imageUrl2,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 15,
                  child: Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.author,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          "View all",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: posts.length,
    );
  }
}

class TravelWidget extends StatelessWidget {
  // List<TravelBean> _list = TraveBean.generateTraveBean();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.9),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        var bean = posts[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return DetailPage(bean);
            }));
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    posts[index].imageUrl,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 15,
                child: Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        posts[index].author,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
