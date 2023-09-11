import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective_mobile_test/controller/hotel_controller.dart';
import 'package:flutter/material.dart';

class HotelView extends StatefulWidget {
  const HotelView({super.key});

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  final HotelController _controller = HotelController();
  int _currentImageIndex = 0;
  List<String> _imagesList = [];
  List<String> _peculiaritiesList = [];
  int _rating = 0;
  String _name = "";
  String _address = "";
  int _minimalPrice = 0;
  String _priceFor = "";
  String _description = "";

  void _getImages() async {
    List<String> imagesList = await _controller.getImages();
    setState(() {
      _imagesList = imagesList;
    });
  }

  void _getRating() async {
    int rating = await _controller.getRating();
    setState(() {
      _rating = rating;
    });
  }

  void _getName() async {
    String name = await _controller.getName();
    setState(() {
      _name = name;
    });
  }

  void _getAddress() async {
    String address = await _controller.getAddress();
    setState(() {
      _address = address;
    });
  }

  void _getMinimalPrice() async {
    int minimalPrice = await _controller.getMinimalPrice();
    setState(() {
      _minimalPrice = minimalPrice;
    });
  }

  void _getForWhat() async {
    String priceFor = await _controller.getForWhat();
    setState(() {
      _priceFor = priceFor.toLowerCase();
    });
  }

  void _getPeculiarities() async {
    List<String> peculiaritiesList = await _controller.getPeculiarities();
    setState(() {
      _peculiaritiesList = peculiaritiesList;
    });
  }

  void _getDescription() async {
    String description = await _controller.getDescription();
    setState(() {
      _description = description;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _getImages();
      _getRating();
      _getName();
      _getAddress();
      _getMinimalPrice();
      _getForWhat();
      _getPeculiarities();
      _getDescription();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отель'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        initialPage: _currentImageIndex,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeInOut,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                      items: _imagesList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 16, right: 253),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xFFFFC700).withOpacity(0.2)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFA800),
                              size: 15,
                            ),
                            Text(
                              "$_rating Превосходно",
                              style: const TextStyle(
                                  color: Color(0xFFFFA800),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          "Steigenberger Makadi",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          _address,
                          style: const TextStyle(
                            color: Color(0xFF0D72FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "от $_minimalPrice ₽",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                _priceFor,
                                style: const TextStyle(
                                  color: Color(0xFF828796),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Об отеле",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(
                            _peculiaritiesList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFBFBFC),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Text(
                                    _peculiaritiesList[index],
                                    style: const TextStyle(
                                        color: Color(0xFF828796),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          _description,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "SFProDisplay"),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
