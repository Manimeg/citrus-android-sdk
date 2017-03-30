# Login User with Limited Access

You can initiate user login with Limited Access.

### Initialize CitrusLoginApi
```groovy
String emailId = "email@gmail.com";
String mobileNo = "9999999999";

CitrusLoginApi citrusLoginApi = new CitrusLoginApi.Builder(getActivity())
                          .mobile(mobileNo)
                          .email(emailId)
                          .accessType(AccessType.LIMITED)
                          .environment(Environment.SANDBOX)
                          .build();
```

### Initiate Login 
```groovy
citrusClient.doLogin(citrusLoginApi);
```

### Listening to different login events

```groovy
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

For further details please refer <a href="Unified%20Login%20API.md#unified-login-api-interface-document" target="_blank">here</a>.
