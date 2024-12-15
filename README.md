# fam

## Overview
This repository contains the Flutter assignment that implements the AAL3 flutter intern assignment. Follow the instructions below to clone, set up, and run the project.

## Prerequisites
1. Flutter SDK
2. Android Studio or VS Code (with Flutter and Dart plugins)
3. Git
4. A physical/emulator device with Flutter-compatible configuration

## Getting Started
1. Clone the repository
   git clone https://github.com/your-username/your-repo-name.git

2. Navigate into the project directory:
   cd your-repo-name

## Install dependencies
Run the below command to install the required dependencies
  flutter pub get

## Run the application
1. Connect a physical device or a start an emulator
2. Run the app with the below command
   flutter run

## Project structure
1. lib folder contains all the code for the flutter app. Inside the lib folder
     a. data: Contains service class to interact with the db / api.
              Contains repo class that abstracts functions from service class.

     b. domain
         Contains the card model, and different design card models such as HC9, HC3 etc, as given in the assignment.
         Contains card bloc, that emits states according to the user events. Data is rendered on the screen from the api using this bloc.
         Contains BigCardCubit, that manages state for the visibility of the Big Display Card (HC3). Also uses shared preferences to persist the managed state.

     c. presentation
         Contains reusable components for different design cards, such as Hc1Card, Hc3Card, etc as given in the assignment.
         Contains contextual card, that acts as a stand alone container and renders different cards according to different designs, such as HC1, HC3 etc.
         Contains card_view.dart that renders all the cards.
         Contains utils that has utility functions, such as hexToColor, angleToRadian etc. Also contains asset paths

     d. endpoints
         Contains endpoints for api calls.
         Only base url added for the given assignment.

## Features Implemented
  1. Animated card with action buttons.
  2. Persistent state using shared_preferences.
  3. Dynamic theming based on backend data.
  4. Redirection to url links on tap.


## Apk for android
  Google drive link for apk - https://drive.google.com/file/d/1IVmEGmuY7vb6krO-hcWTAlfcst93hXNU/view?usp=sharing

## Working preview
Below is the working preview of the app in the emulator with all the implemented features mentioned above.
Google drive link for working preview - https://drive.google.com/file/d/1gYjBrjw9obaEgEMdlaxK7PYRBupj2yTy/view?usp=sharing

![image](https://github.com/user-attachments/assets/3608f66c-28e8-4a02-bbed-ae7ecb3212bc)

![image](https://github.com/user-attachments/assets/149a3c56-d838-423e-bb3b-907e7c2e6eb1)

![image](https://github.com/user-attachments/assets/4066a155-9e47-4897-9e5c-be3f5c89630d)







