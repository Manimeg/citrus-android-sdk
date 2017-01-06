# Citrus Payments Android SDK

Welcome to the open-source Android SDK Documentation of Citrus Payments Solution!
#### Update your project’s build.gradle
```groovy
compile 'com.citruspay.sdk:payment-sdk:4.1.2'
```


#### [Migration from older version to Version 4.x.x](docs/Migration_Guide.md)

#### [Release Notes](docs/Version%20History.md)
    
___
<h5>Introduction</h5>
___
* This document details the merchant's <b>Android App</b> integration with Citrus Payment gateway.There is a difference between <b>Normal(PG) Payment</b> and <b>Wallet Payment</b>!
* <b>Normal</b> payment requires only <b>email</b> and <b>mobile</b>. Citrus User account will be created by using only mobile or both email & mobile number combination. We call it as <b><i>Limited Access</i></b>. Once user is logged in with Limited Access, card can be saved against his account, saved cards can be fetched against his account.
* <b>Wallet</b> Payment requires the user to be logged in with <b><i>Full Access </i></b>. Once the user is logged in with  <b><i>Full Access </i></b> the user can pay using his wallet balance as well saved cards in the account.

This is enhanced [version](docs/Version%20History.md) of SDK V2 wherein you can implement your App with features such as:

* Unified Login Api with native login screen
* Pay using Credit Card/Debit Card & Netbanking 
* Pay Using Citrus Cash - user can make a payment using Citrus Cash account if he has sufficient amount for payment. 
* Get Citrus Cash balance
* Load Money – money can be loaded to user’s account using CC/DC/NB option.
* Save Cards and Bank options to user account for faster checkout
* Fetch Saved cards of user
* Delete Cards
* Send Money
* Withdraw your Money

<h5>Few more points on SDK V3</h5>
___
   * SDK response time optimization-  over 5x faster response compared to V2
   * Everything is Object now. No more JSON parsing required.
   * Integrated Flash, a unique way to make payments on mobile.
   * Support for Citrus Wallet.
   * Less Integration Time Required.
   * Zero click payment using Citrus Cash.

<h2> Prerequisites </h2>
* <a href="docs/Prerequisite.md" target="_blank">Before you Start</a>

<h2>Lets Start...</h2>

<b>Initiation</b>
* <a href="docs/InitSDK.md" target="_blank">Initiate Citrus SDK</a>
* <a href="docs/enable%20logs%20.md" target="_blank">How to enable logs </a>

<b> Implementation for User creation and management </b>

* <a href="docs/isUserSignedIn.md" target="_blank">See if the User is logged/Signed in   </a>
* <a href="docs/login_with_limited_access.md" target="_blank">Login User with Limited Access</a>
* <a href="docs/login_with_full_access.md" target="_blank">Login User with Full Access</a>
* <a href="docs/Logout.md" target="_blank">Logout the User </a>

<b> Get Payment Options</b>
 
* <a href="docs/Fetch%20payment%20options.md" target="_blank">Fetch Normal(PG) Payment Options </a>(Required while making a <b>Normal</b> payment)
* <a href="docs/fetch%20load%20money%20options.md" target="_blank">Fetch Load Money Payment Options </a>(Required during <b>Adding/Loading</b> Money to Wallet)

<b>Wallet</b>

* <a href="docs/Get%20Balance.md" target="_blank">Get Citrus Cash balance </a>(<b>Note:</b> User should be <b>Signed In</b> for this Implementation)
* <a href="docs/Load%20Money.md" target="_blank">Add Money/Load Money into Citrus Account </a>
* <a href="docs/Load%20using%20Saved%20Card%20&%20Net%20bank.md" target="_blank">Add Money/Load Money into Citrus Account using Saved cards </a>


<b>Payment</b>

* <a href="docs/CC%20%2CDC%20%2CNB%20Direct%20Payment.md" target="_blank">Pay using Credit/Debit Card & Net Banking</a>
* <a href="docs/Get%20Wallet.md" target="_blank">Get Wallet</a> (It fetches all Saved Cards and Bank options of the User's account)
* <a href="docs/Pay%20Using%20Saved%20Cards%20and%20Bank.md" target="_blank">Pay using Saved Cards and Net banking</a>
* <a href="docs/Pay%20using%20Citrus%20Cash.md" target="_blank">Pay using Citrus Cash</a> (<b>Note:</b> User should be <b>Signed In</b> for this Implementation)
* <a href="docs/masterpass.md" target="_blank">Pay using MasterPass</a>


#####Dynamic Pricing Offer Coupons and Surcharge
* [How to use dynamic pricing ?](https://github.com/citruspay/citrus-android-sdk/blob/master/docs/dynamic_pricing_coupons.md)

<b>AutoLoad</b>
* <a href="docs/AutoLoad.md" target="_blank">Auto Load</a>

<b>How to save Cards option and Banks</b>
* <a href="docs/Save%20payment%20option.md" target="_blank">Save Debit/Credit Card and Net banking</a>

<b>LazyPay</b>
* <a href="docs/lazyPay.md" target="_blank">LazyPay</a>

<b>Others...</b>
* <a href="docs/Send%20Money.md" target="_blank">Send Money To Your Friend</a>
* <a href="docs/Withdraw.md" target="_blank">Withdraw Money to Your Account</a>

<b>SDK Features</b>
* <a href="docs/SDK%20UI%20Items.md" target="_blank">SDK UI Items</a>
* <a href="docs/Payment-using-JSON-Bill.md
" target="_blank">Payment Using JSON Bill/Post Bill URL</a> 
* <a href="docs/Additonal%20Parameters%20in%20Bill%20URL.md" target="_blank">Pass Additional Parameters via Bill URL</a>
* <a href="docs/Load%20money%20redirect%20url.md" target="_blank">Load Money Redirect URL</a>
* <a href="docs/user_details_in_payment.md" target="_blank">How to pass user details in Payment?</a>
* <a href="docs/Delete%20Card.md
" target="_blank">Delete saved Card</a>

<b>* <a href="docs/Sample%20App%20with%20merchant%20keys.md" target="_blank">Sample App with your keys and url</a></b>


___
<h5>How to Go Live...</h5>

* <a href="docs/Backend%20Files%20Changes.md" target="_blank">Changes inside Bill Generator and Returl Url Files</a>
* <a href="docs/Go%20Live.md" target="_blank">Keys and Environment inside citrusClient.init</a>
* <a href="docs/Progaurd%20changes.md" target="_blank">Progaurd changes</a>(If required)

___


