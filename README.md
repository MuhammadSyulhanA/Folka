# Equip Order

React Native App for waiter to take orders

## Installing

```bash
> git clone git@github.com:ianpogi5/equip-order.git
> cd equip-order
> npm install
```

## Running Android emulator

Make sure you've created an avd (Android Virtual Device). It can be found in Android Studio -> Tools -> AVD Manager.

Run `emulator -list-avds` in the command line to see the name of your avd.

In package.json, replace `Pixel_2_API_28` with your avd name.

Run below to start your emulator:

```bash
> npm run emulator
```

Wait util the emulator has fully booted then run the command below:

```bash
> npm start
```

It should open up a new window with Metro Bundler and then build the app and install in the emulator.

## Test Settings

1. Go to settings screen
2. Service URL: http://equipweb.biz/WebServicePDAProxy/
3. Terminal ID: 1
4. Point Of Sale ID: 1
5. Hit Save button
6. Hit Download Data button
7. Go back to login screen
8. ID: 1
9. PWD: 1
10. Click OK button

## Building Release APK

Follow [Building Release APK](docs/BUILD.md)

## Troubleshooting

### App could not connect to development server

Make sure Metro Bundler is running on another window. If it does not, run `npm run kill-port`. It will kill any network application running on port 8081. Run `npm start` again and it should start Metro Bundler.
