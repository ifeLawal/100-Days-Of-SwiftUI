#  OpenWeather - Swift Application

## Technical
* iOs 17.4 | Swift 5.10
* SFSymbols
* [Openweather API](https://openweathermap.org/api)

## Overview

This is a multi view swift application that is built around the Model-View-ViewModel (MVVM) pattern. 3 reasons for going with the MVVM pattern over MVC or MVP were:
1. The separation of responsibilities is cleaner in MVVM patterns. The ViewModel manages data calls (asynchronous and synchronous) with simple self contained methods that can be called at key interactions within the View. With it being self contained methods, it allows for reusability in different views.
2. Code is more distributed in a MVVM pattern. I knew my views would be complex and by having the MVVM model I could split out the complexity across multiple view files and bring in view components based on data updates and change whole views based on user flow. I also split complexity across multiple ViewModels, one for the CitySearch and another for the Weather data. 
3. MVVM is more prevalent for swift applications especially with the change to views being Struct datatypes over the classic UIKit class structure. 

### Learned and Challenges

* I learned how to link asynchronous calls with try awaits and task calls within views.
    * This was a challenge to get right both in terms of setting it up so the API calls could be isolated and set up right on how it would be used within the views.
* I learned how to use sheets to showcase new views for the search bar as well as using NavigationStacks to move between bigger view pages
    * This was a challenge to get right because moving between the NavigationStacks and making an asynchronous call ended up including the need to add states for the API call to add in loading, success, and failure states.
* I learned how to create views and include observable objects to populate the view with data.
* I learned about gradient fills which work well with ZStacks for creating great background color. Then using HStacks and VStacks to layer text, buttons, and other visual elements onto the page.
* I learned about extensions for defining methods that can be added to defined classes (used a lot in this project for formatting).
* I learned about protocols which can act as an interface for classes, aka defining how the class should work so it can subclassed and defined in one way, while allowing for overrides of the class in tests or other scenarios where you may need to change how the functionality works in a different way.
* I learned about switch statements and enums which allow for case based decision making.


## TODOs:

* Configurations
    * Localization for Fahrenheit vs Celsius
* More testing
    * I was able to get some working tests for the ViewModel but would want to get more coverage and also put in UI testing as well
* Accessibility:
    * Vision: Testing the flows using the voice over options to make sure it reads the options smoothly and having an option for larger text.
    * Mobility: Testing the app with voice control to tap, swipe, and type to make sure someone with limited mobility can still interact.
* Incorporate https://open-meteo.com/en/features to include forecasts of rain


### How to run locally

Download the project as a zip:

```
// Go to https://github.com/ifeLawal/100-Days-Of-SwiftUI
// Find the "<> Code" button and click on it, select download zip
// Open in xcode by going to 100-Days-Of-SwiftUI/big-projects/Weather
```

or clone the project using github:
```bash
// Go to the directory you want to clone
git clone https://github.com/ifeLawal/100-Days-Of-SwiftUI.git
// Open in xcode by going to 100-Days-Of-SwiftUI/big-projects/Weather
```
Once it is open in Xcode (or your development environment of choice) go to the ContentView.swift to see the preview of the Application. You can go  to WeatherApp and press the xcode play button to start the application. Run in simulator (or real device) of iPhone 15 and up. 
