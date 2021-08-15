# Math-App

### Pods
Currently, we use pods for firebase logins and without it the code will fail to run due to its usage in the code. Here’s how to install this dependency
 
1. Open terminal (directory does not matter)
2. run this command: sudo gem install cocoapods
    - if this does not work try the following steps:
    - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    - brew cleanup -d -v
    - brew install cocoapods
    - brew link cocoapods
    - (thanks mathias)
3. move to do the directory of your project through this command: cd /Your/Path/Here/Math-App
4. run this command: Pod install
5. Within the Math-App folder, there should be a new item called Test3.xcworkspace. Only open this to run and edit the app on XCode

_Note that there are some features that XCode does not allow to be run on a simulator_
_(saving a screenshot to your camera roll) and there are some features that cannot be run on an iPad._
_This is both either due to safety concerns or due to not having access to the premium version (which is so stupid). So you can attribute some errors to this._



