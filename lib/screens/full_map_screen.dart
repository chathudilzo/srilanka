
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../classes/weather.dart';
import '../controllers/weather_controller.dart';


class Places {
  String name;
String description;
  String type;
  double lat;
  double long;
 

  Places({required this.name,
  required this.description,
  required this.type,
   required this.lat,
   required this.long});

  static List<Places> getPlacess() {
    return [
      Places(name: "Ampara",description: "Ampara is a charming district nestled in the Eastern Province of Sri Lanka. Known for its serene landscapes and vibrant culture, Ampara offers a unique blend of natural beauty and historical significance. With its picturesque beaches, lush greenery, and rich wildlife, Ampara is a haven for nature enthusiasts and adventure seekers. The district is also home to several ancient temples and religious sites that showcase the region's spiritual heritage. From exploring its pristine beaches to delving into its cultural heritage, Ampara promises an unforgettable journey.",type: "District", lat: 6.674, long: 81.221),
      Places(name: "Anuradhapura",description: "Anuradhapura, an ancient capital of Sri Lanka, is a living testament to the country's rich history and heritage. The city boasts an impressive collection of archaeological wonders, including towering dagobas (stupas), intricate carvings, and ancient monasteries. Steeped in Buddhism, Anuradhapura is a pilgrimage site and a place of spiritual reflection. Its sacred Bodhi Tree, believed to be a sapling of the original tree under which the Buddha attained enlightenment, draws devotees from around the world.",type: "", lat: 8.238, long: 80.716),
      Places(name: "Badulla",description: "Nestled amidst the lush hills of the Uva Province, Badulla is a tranquil town that offers a refreshing escape from urban life. Surrounded by tea plantations and mist-covered mountains, Badulla provides a serene environment for relaxation and rejuvenation. Its serene landscapes and cooler climate make it an ideal destination for nature lovers and trekkers seeking to explore the beautiful terrain.",type: "District", lat: 6.958, long: 81.198),
      Places(name: "Batticaloa",description: "Batticaloa, located on the eastern coast of Sri Lanka, is renowned for its pristine beaches and vibrant culture. The district's azure waters and golden sands make it a paradise for beach enthusiasts. Batticaloa's unique blend of Tamil and Muslim cultures is reflected in its architecture, cuisine, and festivals. Visitors can explore historical sites, such as the Kallady Bridge, which played a significant role during the country's colonial era.",type: "District", lat: 7.650, long: 81.450),
      Places(name: "Colombo",description: "As the bustling capital of Sri Lanka, Colombo is a vibrant metropolis that seamlessly combines tradition and modernity. From historic colonial architecture to modern skyscrapers, Colombo is a melting pot of cultures and influences. The city offers a range of experiences, from shopping in bustling markets to savoring diverse culinary delights. Galle Face Green, Viharamahadevi Park, and the National Museum are just a few of the city's attractions.",type: "District", lat: 6.922, long: 79.861),
      Places(name: "Galle",description: "Galle is a coastal gem known for its well-preserved colonial architecture and historic Galle Fort. This UNESCO World Heritage Site is a testament to the city's Dutch and Portuguese heritage. The fort's cobbled streets, charming boutiques, and vibrant cafés create a nostalgic ambiance. Galle's coastline is equally enticing, with inviting beaches and opportunities for water sports.",type: "District", lat: 6.118, long: 80.272),
      Places(name: "Gampaha",description: "Gampaha, a district located close to Colombo, offers a convenient escape into nature. The district is home to the stunning Henarathgoda Botanical Garden, which showcases a diverse range of plant species. Gampaha's tranquil surroundings and picturesque landscapes provide a peaceful retreat for those seeking respite from the city's hustle and bustle.",type: "District", lat: 6.828, long: 79.804),
      Places(name: "Hambantota",description: "Hambantota, situated in the southern part of Sri Lanka, is a district with a rich cultural heritage and natural beauty. The district is known for its agricultural landscapes and traditional way of life. Hambantota is also home to the Ruhuna National Park, where visitors can spot diverse wildlife, including elephants, leopards, and various bird species.",type: "District", lat: 6.139, long: 81.182),
      Places(name: "Jaffna",description: "Jaffna, located in the northernmost part of Sri Lanka, has a distinct culture and history shaped by its Tamil heritage. The Jaffna Peninsula offers a glimpse into the region's unique traditions, architecture, and cuisine. Visitors can explore ancient temples, pristine beaches, and vibrant markets that showcase the essence of Jaffna's identity.",type: "District", lat: 9.667, long: 80.000),
      Places(name: "Kalutara",description: "Kalutara, a coastal city, is renowned for its picturesque beaches and serene surroundings. The Kalutara Bodhiya, a sacred Buddhist site, stands as a symbol of the city's spiritual significance. The district's coastal beauty is complemented by the Kalu Ganga (Black River), which offers opportunities for boat rides and riverfront relaxation.",type: "District", lat: 6.667, long: 79.800),
      Places(name: "Kandy",description: "Nestled amid mist-covered hills, Kandy is a city steeped in history and spirituality. The city is home to the sacred Temple of the Tooth Relic (Sri Dalada Maligawa), a UNESCO World Heritage Site and a revered Buddhist shrine. Kandy's scenic beauty, including the serene Kandy Lake, makes it a sought-after destination for both cultural exploration and nature appreciation.",type: "District", lat: 7.250, long: 80.700),
      Places(name: "Kilinochchi",description: "Kilinochchi, located in the Northern Province, carries the remnants of a tumultuous past. Once a stronghold of conflict, the district is now on a journey of recovery and development. Visitors can learn about the area's history while witnessing the resilience and spirit of its people. Kilinochchi's lush landscapes and cultural landmarks offer insights into the region's transformation.",type: "District", lat: 8.917, long: 80.633),
      Places(name: "Kurunegala",description: "Kurunegala, situated in the North Western Province, boasts a rich history and a vibrant present. The city is known for its ancient rock fortress, Ethagala, which provides panoramic views of the surrounding landscapes. Kurunegala's bustling markets, historical sites, and tranquil lakes create a harmonious blend of experiences.",type: "District", lat: 7.278, long: 80.500),
      Places(name: "Mannar",description: "Mannar, located on an island off the northwestern coast, offers a serene escape from the mainstream tourist trail. The district's natural beauty, including its pristine beaches and abundant birdlife, makes it a paradise for nature enthusiasts. Mannar is also home to the historic Mannar Fort, which holds stories of colonial influences and maritime history.",type: "District", lat: 9.083, long: 79.900),
      Places(name: "Matara",description: "Matara, located along the southern coast, is a destination of both historical significance and coastal beauty. The city is known for its Dutch architecture, charming temples, and vibrant markets. Matara's beaches, such as Polhena Beach, attract surfers and beachgoers seeking relaxation and adventure.",type: "District", lat: 5.917, long: 80.500),
      Places(name: "Moneragala",description: "Moneragala, situated in the Uva Province, is a district characterized by its verdant landscapes and natural wonders. The district is home to the Udawalawe National Park, known for its diverse wildlife and elephant population. Moneragala's tranquil environment and close proximity to nature offer a serene escape for travelers.",type: "District", lat: 6.500, long: 81.000),
      Places(name: "Polonnaruwa",description: "Polonnaruwa, a UNESCO World Heritage Site, takes visitors on a journey back in time to the ancient Kingdom of Polonnaruwa. The district is dotted with well-preserved ruins, including ancient temples, palaces, and irrigation systems. Polonnaruwa's historical significance and architectural marvels make it a must-visit destination for history enthusiasts.",type: "District", lat: 8.117, long: 80.733),
      Places(name: "Ratnapura",description: "Ratnapura, known as the 'City of Gems,' is nestled in the heart of Sri Lanka's gem-producing region. The district's bustling gem markets and workshops offer a glimpse into the world of precious stones. Ratnapura's vibrant culture, gemological heritage, and natural beauty create a unique blend of experiences.",type: "District", lat: 6.583, long: 80.650),
      Places(name: "Trincomalee",description: "Trincomalee, located on the northeastern coast, boasts pristine beaches, azure waters, and a natural harbor. The district is known for its cultural diversity and historical significance, with sites such as the Koneswaram Temple and Fort Frederick. Trincomalee's coastal beauty and marine life make it a popular destination for beach lovers and divers.",type: "District", lat: 8.750, long: 81.222),
      Places(name: "Vavuniya",description: "Vavuniya, situated in the Northern Province, offers a unique blend of cultural heritage and natural charm. The district's landscape is dotted with ancient temples, reflecting its rich history and traditions. Vavuniya's serene surroundings and proximity to cultural sites provide a glimpse into the region's past.",type: "District", lat: 9.000, long: 80.583),
      Places(name: "Sigiriya",description: "Sigiriya, often referred to as the 'Lion Rock,' is an iconic UNESCO World Heritage Site. The district is dominated by the ancient rock fortress of Sigiriya, which offers panoramic views of the surrounding plains. Its intricate frescoes, landscaped gardens, and historical significance make it a fascinating destination for history and art enthusiasts.",type: "Historical", lat: 7.683, long: 80.792),
  Places(name: "Dambulla Cave Temple",description: "The Dambulla Cave Temple, also known as the Golden Temple, is a remarkable complex of rock cave temples adorned with intricate Buddhist art and sculptures. The temple's cultural and spiritual significance, along with its stunning cave interiors, attract pilgrims and tourists alike.",type: "Religious", lat: 7.900, long: 80.822),

  Places(name: "Galle Fort",description: "Galle Fort, situated in the city of Galle, is a historical treasure trove. The fort's colonial architecture, cobblestone streets, and charming boutiques create an enchanting atmosphere. Galle Fort's maritime history and cultural heritage make it a captivating destination for exploration.",type: "Historical", lat: 6.083, long: 80.272),
  Places(name: "Nuwara Eliya",description: "Nuwara Eliya, often referred to as 'Little England,' is a picturesque hill station nestled in the central highlands. The district's cool climate, lush tea plantations, and Victorian architecture transport visitors to a bygone era. Nuwara Eliya's scenic beauty and tea-related experiences make it a romantic and relaxing getaway.",type: "Natural", lat: 6.922, long: 79.861),
  Places(name: "Trincomalee",description: "",type: "Natural", lat: 8.750, long: 81.222),
  Places(name: "Jaffna",description: "Jaffna, with its vibrant Tamil culture and heritage, offers a unique travel experience. The district's distinct cuisine, traditional architecture, and colorful festivals showcase its cultural richness. Jaffna's poignant history, resilient spirit, and warm hospitality create an immersive and unforgettable journey.",type: "Natural", lat: 9.667, long: 80.000),
  Places(name: "Ella",description: "Ella, situated in the central highlands, is renowned for its breathtaking vistas and natural attractions. The district offers panoramic views from sites such as Ella Rock and Little Adam's Peak. Ella's trekking trails, waterfalls, and lush landscapes make it a paradise for outdoor enthusiasts.",type: "Natural", lat: 6.867, long: 81.117),
  Places(name: "Mirissa",description: "Mirissa, a coastal paradise, is known for its tranquil beaches, crystal-clear waters, and vibrant marine life. The district's relaxed ambiance and whale-watching opportunities attract travelers seeking a beach retreat. Mirissa's idyllic beaches and coastal charm make it an ideal destination for relaxation and adventure.",type: "Natural", lat: 5.917, long: 80.500),
  Places(name: "Bentota",description: "Bentota, located along the southwest coast, offers a blend of beachfront beauty and water-based activities. The district's pristine beaches, tranquil riverbanks, and water sports make it a haven for beachgoers and thrill-seekers alike. Bentota's coastal allure and diverse experiences create a well-rounded vacation destination.",type: "Natural", lat: 6.617, long: 80.333),
  Places(name: "Hikkaduwa",description: "Hikkaduwa, a lively coastal town, is famed for its vibrant nightlife, water sports, and marine biodiversity. The district's coral reefs and clear waters make it a popular destination for snorkeling and diving. Hikkaduwa's energetic atmosphere and coastal adventures make it a hotspot for beach lovers.",type: "Natural", lat: 6.700, long: 80.350),
  Places(name: "Tangalle",description: "Tangalle, located on the southern coast, offers a blend of secluded beaches, wildlife encounters, and cultural exploration. The district's pristine shores, such as Medaketiya Beach, provide a serene backdrop for relaxation. Tangalle's tranquility and natural beauty create a peaceful escape for travelers.",type: "Natural", lat: 6.217, long: 80.683),
  Places(name: "Yala National Park",description: "Nestled in the heart of Sri Lanka's natural splendor, Yala National Park stands as a testament to the diverse beauty of the island. This natural sanctuary harbors an array of remarkable creatures within its expansive landscapes. The park is renowned for its majestic leopards, graceful elephants, and an abundance of bird species. The rugged terrain, dotted with serene lakes and lush forests, creates an enchanting atmosphere for explorers and wildlife enthusiasts alike. The rhythmic sounds of nature in Yala's savannas and wetlands beckon visitors to immerse themselves in its untamed charm.",type: "Natural", lat: 6.167, long: 81.067),
  Places(name: "Udawalawe National Park",description: "Nature's grandeur finds its abode in Udawalawe National Park, where vast savannas and grasslands stretch as far as the eye can see. The park's open spaces serve as a haven for Sri Lanka's wild denizens, especially its elephant population. A safari through the park offers glimpses of these gentle giants in their natural habitat, while a symphony of bird calls echoes through the air. The landscape, rich with diverse ecosystems, showcases the harmonious coexistence of flora and fauna in this pristine corner of the world.",type: "", lat: 6.733, long: 80.850),
  Places(name: "Minneriya National Park",description: "Enveloped in nature's embrace, Minneriya National Park captures the essence of Sri Lanka's wild beauty. The park's centerpiece is the expansive Minneriya Tank, which plays host to a spectacular congregation of elephants during the dry season. This natural spectacle, known as 'The Gathering,' is a sight to behold as these majestic creatures gather to quench their thirst and socialize. Beyond the elephants, the park's lush forests and grasslands shelter a variety of wildlife, from spotted deer to elusive leopards. Each corner of Minneriya invites travelers to delve into the enchanting world of the island's wildlife.",type: "Natural", lat: 7.950, long: 81.167),
  Places(name: "Horton Plains National Park",description: "At the heights of Sri Lanka's central highlands lies Horton Plains National Park, a realm of misty valleys, rolling hills, and ethereal beauty. The park's iconic feature, World's End, offers panoramic views that stretch to the horizon, creating a sense of standing on the edge of the world. The haunting beauty of Baker's Falls and the diverse flora that blankets the plains add to the park's allure. It's a paradise for trekkers and nature enthusiasts who seek solace in the embrace of clouds and greenery.",type: "Natural", lat: 6.917, long: 80.883),
  Places(name: "Adam's Peak",description: "Rising above the clouds, Adam's Peak is a sacred site revered by multiple faiths. Also known as Sri Pada, this towering peak cradles a unique footprint-shaped depression that holds significance for Buddhists, Hindus, and Muslims. Pilgrims undertake the challenging ascent to witness the breathtaking sunrise from its summit. The journey itself is a tapestry of devotion and determination, with steps illuminated by lamps during the pilgrimage season. The spiritual aura of Adam's Peak, coupled with its awe-inspiring vistas, creates an experience that transcends the physical realm.",type: "Religious", lat: 6.950, long: 80.750),
  Places(name: "Lipton's Seat",description: "Perched atop the emerald hills of Haputale, Lipton's Seat offers a panoramic vista that's nothing short of magical. Named after Sir Thomas Lipton, this vantage point provides a breathtaking view of the surrounding tea plantations, valleys, and distant peaks. As the sun paints the landscape with golden hues, visitors are treated to a sensory spectacle that celebrates nature's artistry. The journey to Lipton's Seat is a voyage through terraced tea gardens and mist-laden landscapes, culminating in a view that ignites the soul with wonder.",type: "Natural", lat: 6.583, long: 80.650),
  Places(name: "Ravana Falls",description: "Cascading down in a veil of crystalline splendor, Ravana Falls captures the heart with its raw beauty. Named after the legendary King Ravana from the Ramayana epic, this waterfall is a symbol of Sri Lanka's rich mythology. The thunderous roar of the water plunging into the pool below creates an immersive experience, inviting travelers to marvel at nature's power. The falls are surrounded by lush greenery, creating a tranquil oasis that contrasts with the falls' dynamic energy.",type: "Natural", lat: 6.583, long: 80.650),
  Places(name: "Nine Arches Bridge",description: "An architectural marvel nestled amidst the hills of Ella, the Nine Arches Bridge is a testament to human ingenuity in harmony with nature's beauty. This picturesque stone bridge, adorned with arches that seem to defy gravity, spans a deep gorge enveloped in verdant green. Trains traversing the bridge create a charming scene that transports visitors to a bygone era. The bridge's elegant design and the breathtaking landscapes that embrace it make for a mesmerizing sight, perfect for capturing timeless memories.",type: "Historical", lat: 6.783, long: 80.883),
  Places(name: "Demodara Railway Station",description: "Stepping into Demodara Railway Station is like stepping into a storybook. This charming station is renowned for its iconic loop, where the railway lines form a loop as they navigate the hillside. The architecture evokes a sense of nostalgia, harking back to the colonial era. As the train makes its leisurely journey through the loop, visitors are treated to enchanting views of the surrounding hills and valleys. Demodara Railway Station encapsulates the romance of train travel and the enduring beauty of Sri Lanka's landscapes.",type: "Historical", lat: 6.783, long: 80.883),
  Places(name: "Pinnawala Elephant Orphanage",description: "A haven of compassion for gentle giants, the Pinnawala Elephant Orphanage offers a unique opportunity to connect with Sri Lanka's magnificent elephants. Established with the noble mission of caring for orphaned and injured elephants, the sanctuary provides a nurturing environment for these majestic creatures. Visitors can witness the elephants' daily routines, from bath time in the river to feeding sessions. This interaction fosters a deep appreciation for the conservation efforts dedicated to safeguarding these animals. The sanctuary's commitment to elephant welfare and education makes it a place of heartwarming encounters and meaningful connections.",type: "Natural", lat: 6.917, long: 80.883)
    ];
  }
}











class FullMap extends StatefulWidget {
   FullMap({super.key});

  @override
  State<FullMap> createState() => _FullMapState();
}

class _FullMapState extends State<FullMap> {
WeatherController wController=Get.find();
late GoogleMapController mapController;
List <Places> Placess=[];
LatLng? _userLocation;
double distance=0;
LatLng destination=LatLng(7.877, 80.7003);
Set<Marker>markers={};
TextEditingController _userLocationController=TextEditingController();

int index=0;

  void _onMapCreated(GoogleMapController controller) {
    
   
      _userLocationController.text='Colombo';
      mapController = controller;
    
    

    
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkers();
  }

  _setMarkers() async {
    Placess=Places.getPlacess();
    
    for(int i=0;i<Placess.length;i++){
      final place=Placess[i];
      await _loadMarkerIcon(place.type);
      markers.add(Marker(
        icon: _customMarkerIcon!,
        onTap: () {
          wController.getLocationWeather(place.lat,place.long);
          setState(() {
            index=i;
            
          });
        },
        
        markerId: MarkerId(place.name),
      position: LatLng(place.lat,place.long),
      
      infoWindow: InfoWindow(title: place.name,
      snippet: place.long.toString())
      ));
    }
  }

BitmapDescriptor? _customMarkerIcon;

 Future<void>_loadMarkerIcon(String type) async {
    final ImageConfiguration config = ImageConfiguration(size: Size(20, 20));

    BitmapDescriptor? customMarkerIcon= await BitmapDescriptor.fromAssetImage(
      config,
      type=='Natural'?'assets/natureicon.jpg':type=='Historical'?'assets/historicalicon.jpg':type=='WaterFall'?'assets/waterfallicon.jpg':type=='Religious'?'assets/relegiousicon.jpg':'assets/gov.jpg', // Replace with your image asset path
    );
    setState(() {
      _customMarkerIcon=customMarkerIcon;
    });
  }

String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Stack(
                children:[
                  Container(
                    decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.amber,
                               ) ,
                                 child:
                                       GoogleMap(
                                       initialCameraPosition:CameraPosition(
                                         target:destination,
                                         zoom: 8),
                                         onMapCreated:_onMapCreated,
                                         markers:markers
                                        
                                         ),
                                 width:width*0.7,
                                 height: height,
                                                 
                    )       
                               
                  ]
          ),
          Container( width: width*0.28,
                              height: height,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 8, 8, 29)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(Placess[index].name,textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.none, fontSize: 28,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 252, 252, 252),),)
                                        ,Card(color: Color.fromARGB(255, 255, 255, 255),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(Placess[index].description,style: TextStyle(fontSize: 20),),
                                          ),
                                        ),
                                        SizedBox(
                width: MediaQuery.of(context).size.width*0.2 ,
                height: MediaQuery.of(context).size.height * 0.2,
                child: GetBuilder<WeatherController>(builder: (controller) {
                  if (controller.clwIsLoading) {
                    return LoadingAnimationWidget.beat(color: Colors.blue, size: 30);
                  } else {
                    Weather? weather = controller.currentWeather;
                    if (weather != null) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(weather.place.toString(), style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold)),
                            Text(weather.weatherIcon.toString(), style: TextStyle(fontSize: 40)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(weather.temperature?.toStringAsFixed(0) ?? 'N/A', style: TextStyle(color:weather.temperature!>30?Color.fromARGB(255, 228, 150, 6):weather.temperature!<20?Color.fromARGB(255, 13, 228, 228):Color.fromARGB(255, 19, 231, 26),fontSize: 30,fontWeight: FontWeight.bold)),
                                Text('°C',style: TextStyle(color:Colors.white,fontSize: 25))
                              ],
                            ),
                            Text(weather.condition.toString(), style: TextStyle(color: Colors.white)),
                            //Text(weather.message.toString(), style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      );
                    } else {
                      return Text(
                        'Weather data not available.',
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  }
                }),
              ),  
                                      ],
                                    ),
                                  ),
                                ),
                          ),
                             
          ),                              
        ],
      ),
    );
  }
}