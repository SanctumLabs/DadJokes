# Building

We typically develop against the latest stable version of xcode.

## 1. Clone
Clone the repo to a working directory:

```bash
git clone https://github.com/SanctumLabs/DadJokes.git
```
## 2. Dependencies & Project Generation
Execute the following commands in a terminal instance that's currently pointing to the working folder. 

This step will install the required dependencies and generate and Xcode project and workspace. 

> Our philosophy is to not ship the Xcode project files to avoid merge conflicts when working in a team. So the following commands will generate a working Xcode project based on the configurations set in project.yml. You can read more [here](https://github.com/yonaskolb/XcodeGen)


```bash
bundle config set --local path 'vendor/bundle'
bundle install
bundle exec fastlane setup
pod install 
```

Once these steps have completed successfully, you can proceed to open the Dadjokes.xcworkspace file or simply execute the following command in the working folder
```bash
xed . 
 ```