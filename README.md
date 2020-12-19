# App2Browser2AppDeeplink
This project helps to understand the Deeplinking where the app opens a link in external browser and on clicking a button in browser redirects back to the app. https://www.informit.com/articles/article.aspx?p=2301787


When a visitor to your website has iOS apps on her device, a little bit of coding can let you take advantage of that situation, starting her device's native apps for a better user experience. Wei-Meng Lee shows how to take advantage of these iOS capabilities. Her device doesn't have the appropriate app? Your site's programming can detect that sales opportunity, displaying a banner that lets her view your app on the Apple Store and (if desired) automatically and immediately install it.


In this article, I’ll show you how to launch native iOS apps from a URL on a web page and pass data to the app, as well as how to use the Smart App Banner feature (available in iOS 6 and later devices) to launch a specific app on the device (if it’s installed on the device) or redirect the user to the Apple Store to install the app (if it’s not already installed).

Launching Your App Via URL
Using Xcode, create a single-view application and name it SmartAppBanner. To allow your app to be launched using an URL, you’ll need to add a few entries to the Info.plist file, so let’s look at how to do that.

Select the Info.plist file in the project and add a new row. Name the new key CFBundleURLTypes and expand the newly added key. In item 0, add another key named CFBundleURLSchemes and set its Item 0 value to “smartappbanner”. Add one more key named CFBundleURLName. Set its value to “net.learn2develop.SmartAppBanner”. Figure 1 shows the keys that are added.
https://github.com/Abbiee/App2Browser2AppDeeplink/blob/main/lee7_fig01.jpg
With these new settings, you can open the app by using the smartappbanner:// scheme. CFBundleURLName is a unique identifier for the scheme.

NOTE
The identifier for the scheme doesn’t necessarily have to be the same as the bundle identifier for the application.

Deploy the application onto a real iOS device. The application can now be launched with an appropriate URL.

The next step is to create an HTML page to launch the app. Using a text editor, create an HTML file and name it MyApp.html. Populate the file as follows:

Without paramaters:
https://github.com/Abbiee/App2Browser2AppDeeplink/blob/main/index1.html
!DOCTYPE html>
<html>
<body>
<a href="smartappbanner://">Launch SmartAppBanner app</a><br/>
</body>
</html>

With parametres :
https://github.com/Abbiee/App2Browser2AppDeeplink/blob/main/index.html
!DOCTYPE html>
<html>
<body>
<a href="smartappbanner://&code=112233">Launch SmartAppBanner app</a><br/>
</body>
</html>
Save the file to a web server. For example, I have used 000webhost.com to paste my index.html in Public folder.

On the iOS device with the SmartAppBanner app installed, launch Safari by clicking a button inside our App and enter the URL in the button action. The URL looks like this:

https://irynasholosova.000webhostapp.com/

Once the page is loaded, click the Launch SmartAppBanner app link (see Figure 2). The SmartAppBanner app will now launch.

The redirect URI is captured in our application using the Appdelegate through :

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url
  options:(NSDictionary<NSString *,id> *)options  
