# flutter_skills_test

Flutter Application to test basic flutter understanding

## Getting Started

Before you start with the application have a look at what flutter is.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Pre-requisite
 
- [Install Flutter and Dart](https://flutter.dev/docs/get-started/install) 
- Choose and Install the IDE for Flutter
    - [Android Studio](https://flutter.dev/docs/get-started/editor?tab=androidstudio)
    - [VS Code](https://flutter.dev/docs/get-started/editor?tab=vscode)

## Clone and Run

Clone this project in your local directory and do `flutter run`.

Below are the two existing screens that you will see once you run the app.

[Screen 1](https://ibb.co/PMvW3n5)

[Screen 2](https://ibb.co/hKNZJMf)

## Requirements

We are here to test your skills in flutter, so you are required to make your changes to [Screen 2](https://ibb.co/hKNZJMf).

[Screen 2](https://ibb.co/hKNZJMf) is a vehicle catalog screen where user can come and see the vehicle pricing and model.

### Step 1: Screen Design

- Navigate from [Screen 1](https://ibb.co/PMvW3n5) to  [Screen 2](https://ibb.co/hKNZJMf) by clicking the button **Show Vehicles**

- Please refer to the [Wireframe](https://ibb.co/2y7SZDQ) to get the idea of how the screen should look like

- Replace the body of scaffold widget of [Screen 2](https://ibb.co/hKNZJMf) (**screens/vehicles.dart**) with your implementation.

        `body: Center(
          child: Text('No Vehicles Found!!', style: TextStyle(fontSize: 30.0))
        )`

- For setting up the vehicle image, you can either make an empty colored box or use any image or icon.

    If you like to use a static image use this [reference](https://flutter.dev/docs/development/ui/assets-and-images)

### Step 2: Static data wireing

- The model class **Vehicle** is already created for you in (**model/Vehicle.dart**).

- The model class also contains a pre-filled static list with 4 vehicle defined. You can use that as your data.

- Each field in model class **Vehicle** corresponds to a field in wireframe of [Screen 2](https://ibb.co/2y7SZDQ)

### Step 3: Buttons

- It is mandatory to complete step 1 before moving on with step 3.

- The [Icon Buttons](https://ibb.co/gwwVm5M) when clicked should show up the next and previous vehicles respectively.

- On clicking the [Edit Button](https://ibb.co/MGD8SYr) you should give the flexibility to edit the data.

- On clicking the [Delete Button](https://ibb.co/MNmMNf1) the vehicle should not be shown.

- If the user deletes all the vehicles he should see **'No Vehicles Found!!'**

### Step 4: API wireing (Optional)

- It is mandatory to complete step 2 before moving on with step 4.

- In this step the data of the vehicles, we can get it from an API

- The data can fetched using `GET` call from endpoing `https://myfakeapi.com/api/cars/`. This returns 1000 Vehicles details but you are required to show just **first 10**. For further details on the API refer the link [MyFakeAPI](https://myfakeapi.com/)

- Do the implementation of the below function in (**services/vehicle_service.dart**). And call the function when you want to load the data.

        `static Future<Vehicle> fetchVehicles() async {
          //Your Code to fetch vehicles
        }`

### Step 5: Submit

After you have completed the above steps, you can generate the .apk file using this [reference](https://flutter.dev/docs/deployment/android)

It is not mandatory to sign the apk.

Also while doing the above steps, if you find anything from existing code needs to be changed, Please feel free to do so.
