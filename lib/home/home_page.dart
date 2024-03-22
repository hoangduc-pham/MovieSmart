import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: [
                    Image.asset(
                      'assets/images/Movie.png',
                    ),
                    Image.asset(
                      'assets/images/Movie2.png',
                    ),
                    Image.asset(
                      'assets/images/Movie3.png',
                    ),
                    Image.asset(
                      'assets/images/Movie4.png',
                    ),
                  ],
                  options: CarouselOptions(
                    // Cấu hình các tùy chọn của CarouselSlider ở đây
                    aspectRatio: 10/11,
                    // Tỷ lệ khung hình
                    autoPlay: true,
                    // Tự động chuyển ảnh
                    enlargeCenterPage: true,
                    // Phóng to ảnh ở giữa
                    enableInfiniteScroll: true,
                    // Cho phép cuộn vô hạn
                    autoPlayCurve: Curves.fastOutSlowIn,
                    // Kiểu hiệu ứng khi tự động chuyển ảnh
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    // Thời lượng chuyển ảnh
                    viewportFraction: 0.8, // Phần trăm chiều rộng màn hình mà ảnh chiếm
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   right: 0,
                //   child: Slider(
                //     // Thêm Slider nếu cần
                //     value: 1,
                //     min: 0,
                //     max: 11,
                //     onChanged: (value) {},
                //   ),
                // ),
              ],
            ),
            Text('Popular Movie',style: TextStyle(color: Colors.white,decoration: TextDecoration.none,fontSize: 16),),
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(15),
                              child: SizedBox.fromSize(
                                  child:  Image.asset(
                                    'assets/images/MV${index}.png',
                                  ),),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
          ],
        ),
      ),
    );
  }
}
