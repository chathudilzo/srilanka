##Tourism Web App
This is a web application built for promoting tourism in Sri Lanka. The app provides information about tourist destinations, festivals, news, weather, and more.  

https://github.com/chathudilzo/srilanka/assets/93638679/15b8bcd0-7cef-4f55-b029-83d637d2e03f

https://github.com/chathudilzo/srilanka/assets/93638679/f4591972-cf71-4863-a694-9fea88d677c2

https://github.com/chathudilzo/srilanka/assets/93638679/2476951e-10bb-4776-acb0-98a6ded0e5a9

https://github.com/chathudilzo/srilanka/assets/93638679/cbb79436-8d2a-4020-ad05-5e368e742519



##Features  
View tourist destinations and their details.  
Explore upcoming festivals in Sri Lanka.  
Get the latest news related to tourism.  
Check the current weather conditions.  
User authentication with Google Sign-In.  
User profiles to track preferences and quiz scores.  
Integration with Firebase for data storage.  
Technologies Used  
Frontend: Flutter for Web  
Backend: Node.js  
Database: Firebase Firestore    


##APIs:  
Google Maps API for retrieving map data.  
Weather API for fetching weather conditions.  
News API for getting tourism-related news.  

Setup  
Clone the repository:  

git clone https://github.com/your-username/tourism-web-app.git  
Install dependencies:  

cd tourism-web-app  
flutter pub get  
cd server  
npm install  

Start the Node.js server for fetching Google Map and Weather data:  
  
cd server  
npm start  

Run the Flutter web app (disable web security for CORS):  
  
flutter run -d chrome --web-browser-flag "--disable-web-security"  


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
