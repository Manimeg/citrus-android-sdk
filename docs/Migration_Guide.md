<b>Updating to SDK version 4.x.x from previous version</b>
* SDK Version 4.x.x  is major release where Network layer of SDK has been changed from Retrofit to Volley.
* SDK size reduced by 17%
* Removed One Tap Payment Support.
* If you are upgrading SDK to 4.x.x following dependencies should be removed from your build.gradle

  <b>for Retrofit 1.9</b>
  
        compile 'com.squareup.retrofit:retrofit:1.9.0' 
        compile 'com.squareup.okhttp:okhttp:2.3.0' 
        compile 'com.squareup.okhttp:okhttp-urlconnection:2.3.0'
        compile 'com.squareup.okio:okio:1.3.0' 
        compile 'com.orhanobut:logger:1.8' 
        compile 'com.facebook.conceal:conceal:1.0.1@aar'
  
   <b>for Retrofit 2.0</b>
   
        compile('com.squareup.retrofit:retrofit:2.0.0-beta2') { 
            exclude module: 'okhttp'
        }
   
        compile 'com.squareup.okhttp:okhttp:2.5.0' 
        compile 'com.squareup.retrofit:converter-gson:2.0.0-beta2' 
        compile 'com.squareup.okhttp:logging-interceptor:2.6.0' //to enable logging 
        compile 'com.squareup.okhttp:okhttp-urlconnection:2.3.0' 
        compile 'com.squareup.okio:okio:1.3.0' 
        compile 'com.orhanobut:logger:1.8'
        compile 'com.facebook.conceal:conceal:1.0.1@aar'
        
* We have also changed domain name from *citrus* to **citruspay**. Please make sure you are copying following dependency 
  and is used in your build.gradle instead of just changing version.

```groovy
	compile 'com.citruspay.sdk:payment-sdk:4.1.1'
```

<b>Note</b>

* Remove these library's only if you have added those for earlier version of Citrus SDK.
* In case if any of above library is used in your app as well, keep that library in build.gradle.
* Following are the librarys and versions internally used in 4.0.0 version(no need to add in your build.gradle. Taken care by   Citrus SDK compile dependency).

<table border="1" width="100%">
   <col width="20">
   <col width="20">
    <col width="60">

  <tr align="center">
    <th>Library Name</th>
    <th>Library Version</th>
    <th>Compile Dependency</th>
  </tr>
  <tr align="center">
    <th>appcompat-v7</th>
    <th>23.1.0</th>
    <th>compile 'com.android.support:appcompat-v7:23.0.1'</th>
  </tr>
  <tr align="center">
    <th>logger</th>
    <th>1.8</th>
    <th>compile 'com.orhanobut:logger:1.8'</th>
  </tr>
  <tr align="center">
    <th>volley</th>
    <th>1.0.0</th>
    <th>compile 'com.android.volley:volley:1.0.0'</th>
  </tr>
   <tr align="center">
    <th>gson</th>
    <th>2.6.2</th>
    <th>compile 'com.google.code.gson:gson:2.6.2'</th>
  </tr>
</table> 
* If your app uses any of above library you can exclude module from Citrus SDK.


<b>Volley Changes</b>

  If your app also uses volley library, you can exclude volley from Citrus SDK. Add following compile dependency to your build gradle
```groovy
 compile ('com.citruspay.sdk:payment-sdk:4.1.1@aar') {
 transitive = true; exclude module: 'volley'
 }
```
<hr /> 
<h1> How to get Cards and Netbanking Icons?</h1>
<b>NetBanking Option/Saved NetBanking Option Resource Accessability</b>
 * SDK Version 4.0.1 and before
 ```groovy
   netbankingOption.getOptionIcon(context);
 ```
 
 * SDK Version 4.1.1 
 ```groovy
   netbankingOption.getBitmap(new BitmapCallBack() {
	@Override
	public void onBitmapReceived(Bitmap bitmap) {
		//set bitmap to your respective view
	}

	@Override
	public void onBitmapFailed(Bitmap bitmap) {
		//SDK returns defalut netbanking bitmap.
	}
    });
 ```
 
<b>Card Option/Saved Card Option Resource Accessability</b>
 * SDK Version 4.0.1 and before
 ```groovy
   paymentOption.getOptionIcon(context); 
   //paymentOption is object of either Credit/Debit or Saved Credit/Debit Card.
 ```
 
 * SDK Version 4.1.1 
 ```groovy
   //paymentOption is object of either Credit/Debit or Saved Credit/Debit Card. 	
   ((CardOption)paymentOption).getBitmap(new BitmapCallBack() {
	@Override
	public void onBitmapReceived(Bitmap bitmap) {
		//set bitmap to your respective view
	}

	@Override
	public void onBitmapFailed(Bitmap bitmap) {
		//SDK returns defalut card bitmap
	}
    });
 ```
 
<hr />  
<h1>How to make payment using Saved Cards?</h1>
 * SDK Version 4.0.1 and before
   For Credit Card  
   
 ```groovy
   CreditCardOption creditCardOption = new CreditCardOption(token, cvv);
 ```
 
    For Debit Card 
    
 ```groovy
   DebitCardOption creditCardOption = new DebitCardOption(token, cvv);
 ```
 
 * SDK Version 4.1.1
   For Credit Card  	
   
 ```groovy
   CreditCardOption creditCardOption = new CreditCardOption(token, cardscheme, cvv);
   //where cardscheme is cardscheme received from PaymentOption of WalletList.
 ```
 
    For Debit Card  	
    
 ```groovy
   DebitCardOption creditCardOption = new DebitCardOption(token, cardscheme, cvv);
   //where cardscheme is cardscheme received from PaymentOption of WalletList.
 ```

 
 
 



  
