# Unified Login API Interface Document


Citrus SDK now provides the unified apis for login purpose. 
You need to provide email, mobile or both to SDK and SDK will try to login the user.
SDK also provides different callback methods which you can use to know when the user is logged in successfully.

You can also specify the type of access required i.e. FULL and LIMITED. 
If the Full access is required then SDK will present with the login screen and 
asks user to enter the password or auto-read the otp and login the user.
    
If limited access is required then SDK will login the user with limited access and give callback to merchant (No login screen will be displayed).
   

## Initiate User Login

#####Initialize CitrusLoginApi.

``` groovy
String emailId = "email@gmail.com";
String mobileNo = "9999999999";
AccessType accessType = AccessType.FULL;

CitrusLoginApi citrusLoginApi = new CitrusLoginApi.Builder(getActivity())
					      .mobile(mobileNo)
					      .email(emailId)
					      .accessType(accessType)
					      .build();
```

#####Initiate login process.

``` groovy
citrusClient.doLogin(citrusLoginApi);
```


#####Listening to different login events

``` groovy
citrusLoginApi.setListener(new CitrusLoginApi.CitrusLoginApiListener() {
    @Override
    public void onLoginSuccess() {
	// The user is logged in now. You may proceed to payment screen.
    }

    @Override
    public void onError(CitrusError error) {
		    // Show some error to the user.
    }

    @Override
    public void onLoginCancelled() {
		    // If the user has cancelled the login, you can ask user to login again.
    }
});

```

##Override SDK’s default login screen.
SDK by default displays it's own login screen, however 
you can override the default behavior by overriding CitrusLoginApi.LoginProcessor.

``` groovy
citrusLoginApi.setLoginProcessor(new CitrusLoginApi.LoginProcessor(getActivity()) {
      @Override
      public void onShowLoginScreen(FindUserResponse findUserResponse, CitrusLoginApi citrusLoginApi) {
          // Display your own login screen.
      }
      
      /**
         * This is called when the password or otp entered is incorrect. Override this when you want to
         * display error message on login screen.
         *
         * @param passwordType
         * @param error
         */
	@Override
	public void onLoginError(PasswordType passwordType, CitrusError error) {

	}

      @Override
      public PasswordType getPasswordType() {
        // Return the type of password i.e. MOTP (mobile otp), PASSWORD (text password) or EOTP (email otp).
        // Return the correct password type entered by the user.
        return passwordType;
      }

      @Override
      public String getPasswordOrOTP() {
          // Return the actual password or OTP entered by the user.
          return password;
      }
});
```
Once the user enters the password and clicks on the login button on your screen call.

```groovy
  citrusClient.proceed(findUserResponse);
```
