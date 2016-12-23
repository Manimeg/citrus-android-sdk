# Citrus Payments Android LazyPay SDK

* This document details the merchant's Android App integration with Citrus Payment LazyPay SDK.

This is an optional feature and may be skipped if LazyPay not needed. This SDK adds about 100 KB to your app size (with Proguard applied)

gradle configuration -
#### Update Top-level build.gradle.
    buildscript {
        repositories {
            mavenCentral()
            jcenter()
        }
          dependencies {
            ...
          }
        ...
    }
    
    allprojects {
        repositories {
            maven { url "http://dl.bintray.com/developer/maven" }
            mavenCentral()
            jcenter() 
        }
    }
    
### Update your app module’s build.gradle - 
    // to add the optional LazyPay SDK
    compile ( 'com.citruspay.lazypay:lazypay-sdk:0.9-beta' ) {
        // exclude the core payment SDK that comes with the LazyPay SDK
        exclude group: 'com.citruspay.sdk', module: 'payment-sdk'
        }
    // & add the core payment SDK version of your choice. Better to select most recent version. Should be atleast 4.1.1
    compile 'com.citruspay.sdk:payment-sdk:4.1.1'

<b> This SDK has following flows:  </b>
<ol type="1">
<li>InEligible User</li>
<li>Unregistered User OR Credit Card flow</li>
<li>Registered User OR OTP flow</li>
<li>Repeat User OR Auto Debit flow</li>
</ol

</br>
<ol type="1">
<li><b>InEligible User:</b>
</br>The SDK first checks whether User / Merchant combination is eligible for LazyPay. If not eligible, User is not allowed to make a payment & he cannot proceed further.</br>Remaining flows are for eligible User only - </li>

<li><b>Unregistered User OR Credit Card flow:</b>
</br>When User is transacting LazyPay for the first time, he will be redirected to the Credit Card flow, where he has to enter the Credit Card details & make PG payment. After Credit Card payment is successful, User becomes a Registered User.</li>

<li><b>Registered User OR OTP flow:</b>
</br>When a Registered User makes a LazyPay payment, he is redirected to the OTP flow. In OTP flow, the User is sent an OTP on his mobile. User has to enter the OTP & complete the payment. After the OTP payment is complete, User becomes a Repeat User.</li>
<li><b>Repeat User OR Auto Debit flow:</b>
</br>When a Repeat user makes a LazyPay payment, he is redirected to the Auto Debit flow. In this flow, no OTP will be asked & directly payment will be processed, unless the user is signed out from LazyPay</li>
</ol>

<p>Accordingly, the LazyPay SDK contains 3 screens:</p>
<ol type="1">
  <li><b>The Welcome Screen</b> which is like a splash screen.</br>On clicking the 'LazyPay Now' button on the Welcome screen, the eligibility is checked.</br>If user is ineligible, an error message is shown & he cannot proceed further.</br>If User is eligible, SDK detects if user is qualified for Auto-Debit i.e. if user is a Repeat user.
        <ul>
          <li>If User is a Repeat-User, the payment is immediately processed. There is no seperate UI screen for this type of payment</li>
          <li>If User is not a Repeat User, the payment is only 'initiated', but not completed at this stage.</li>
        </ul>
User can go back from this screen. No transaction is initiated if user goes back from here.</li>
  <li><b>The Credit Card Screen</b> - represents the Credit Card flow</br>After initiating payment, if user is unregistered, Credit Card screen is shown. User has to enter the card details & proceed for payment.</li>
  <li> <b>The OTP Screen</b> - represents the OTP flow</br>After initiating payment, if user is Registered User, then the OTP screen is shown. User has to enter the OTP received on his mobile & proceed for payment. User can also re-generate the OTP for some limited number of times, decided by the server.</li>
  </ol>
  <b>Note:</b> 
  <ul>
  <li>If user presses the back button from Credit-Card or OTP screen, the transaction will have to be 'cancelled' & updated on the backend, since payment was initiated, although not completed.</li>
  <li>Merchant doesn't have to navigate to any of the UI, as it is handled by the LazyPay SDK.</li>
  </ul>
  
<p><b> Implementation for LazyPay </b></p>
<p>Merchant first needs to instantiate & initialize the <code>CitrusClient</code> as mentioned in the payment SDK section <a href="InitSDK.md" target="_blank">Initiate Citrus SDK</a>.
</br>After initializing, merchant can start the LazyPay process. Note that it is not compulsory for the end user to be logged inside the core payment SDK. LazyPay can work with or without the user being signed in. LazyPay user can be different than the user signed in the payment SDK.</br></br>The package <code>com.citruspay.lazypay.common</code> contains public classes requried for Merchant to integrate LazyPay.
Merchant App requires a </code>LazyPayConfig</code> Object to be configured before starting LazyPay. This <code>LazyPayConfig</code> contains following objects:</p>
<ol type="1">
  <li><code>Amount</code> -> represents the transaction Amount</li>
  <li><code>CitrusUser</code> - represents the User interested for LazyPay transaction - contains the User's name + contact details + address details.</li>
  <li><code>Callback &#60;TransactionResponse&#62; lpTransactionCallback</code> - represents the callback for returning success / fail / cancelled details of transaction</li>
  <li><code>ProductSkuDetail</code> which represents the Product in which the user is interested to buy. This object contains <code>ProductAttributes</code> & <code>Sku[]</code></li>
  <li><code>BillUrl</code> or <code>PaymentBill</code> - URL of the Bill Generator which the LazyPay SDK will use to get the Bill from the merchant backend, OR the PaymentBill itself</li>
</ol>


</br></br>Merchant needs to call <code>LazyPay.initiatePayment( context, lazyPayConfig )</code> for starting the LazyPay Process.
If <code>LazyPayConfig</code> is not configured properly, this methods throws an <code>LazyPayException</code> containing the appropriate error message. Examples where LazyPayException will be thrown - 
<ul>
  <li><code>CitrusUser</code> or it's details like email / mobile / address are null</li>
  <li><code>CitrusClient</code> is not initialized with merchant keys. For more details, refer section <a href="InitSDK.md" target="_blank">Initiate Citrus SDK</a> </li>
  <li><code>Amount</code> is null or invalid</li>
  <li><code>BillURL</code> and <code>PaymentBill</code> are both either null or not null. Only one is needed.</li>
  <li>Callback for <code>TransactionResponse</code> is null</li>
  <li><code>ProductSkuDetail</code> is null or empty</li>
  <li><code>context</code> is null</li>
</ul>

</br>Merchant needs to implement the success / error callback methods of <code>Callback &#60;TransactionResponse&#62;</code> to receive the transaction details.
</br></br>
* <b> Signing out from LazyPay </b>  -
</br>As mentioned above, when a Repeat user (say User1) makes a LazyPay payment, he is redirected to the Auto Debit flow. In this flow, no OTP will be asked & directly payment will be processed. But in the following cases -
<ol>
  <li>User1 explicity signs out from LazyPay, OR</li>
  <li>Another user say (User2) uses LazyPay to make a transaction from the same app, OR</li>
  <li>App data is cleaned by the user,</li>
 </ol>
the User1 won't be directed to the Auto Debit flow. Instead he'll be redirected to the OTP flow. The case 2 above is automatic signing out User1 from LazyPay.
</br>The API to sign out the User from LazyPay is - <code>LazyPay.signOutFromLazyPay( Context )</code>

* <b> Destroying LazyPay session </b>
</br>A good practise, is to destroy the LazyPay session & free the memory held by the LazyPay SDK. The API to do that is - <code>LazyPay.destroy( )</code>

* <b> Proguard changes for LazyPay (if requried) </b></p>
Add the following lines to your proguard config file </br>
<code>-keep class com.citruspay.lazypay.``** { *; }``</code> </br>
<code>-keep interface com.citruspay.lazypay.``** { *; } ``</code> </br>
