# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
-keepclassmembers class fqcn.of.javascript.interface.for.webview {
   public *;
}

-optimizationpasses 5

#When not preverifing in a case-insensitive filing system, such as Windows.
#Because this tool unpacks your processed jars, you should then use:
-dontusemixedcaseclassnames

#Specifies not to ignore non-public library classes.
#As of version 4.5, this is the default setting
-dontskipnonpubliclibraryclasses

-dontskipnonpubliclibraryclassmembers

#Preverification is irrelevant for the dex compiler and the Dalvik VM, so we can switch it off with the -dontpreverify option.
-dontpreverify

#Specifies to write out some more information during processing.
#If the program terminates with an exception, this option will print out the entire stack trace,
#instead of just the exception message.
-verbose

#The -optimizations option disables some arithmetic simplifications that Dalvik 1.0 and 1.5 can't handle.
#Note that the Dalvik VM also can't handle aggressive overloading (of static fields).
#To understand or change this check http://proguard.sourceforge.net/index.html#/manual/optimizations.html
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

#To repackage classes on a single package
#-repackageclasses ''

#Uncomment if using annotations to keep them.
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable

-dontwarn retrofit.**
-dontwarn butterknife.**
-dontwarn okio.**
-dontwarn com.daimajia.**
-dontwarn butterknife.internal.**
-dontwarn com.google.maps.android.geojson.**
-dontwarn com.google.android.gms.**


# Hide warnings about references to newer platforms in the library
-dontwarn android.support.**
#-dontwarn android.net.http.**

#Keep classes that are referenced on the AndroidManifest
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService
-keep public class * extends java.lang.Exception

# don't process support library
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }
-keep class android.support.v7.** { *; }
-keep interface android.support.v7.** { *; }
#-keep class com.google.maps.android.geojson.** { *; }
#-keep interface com.google.maps.android.geojson.** { *; }
#-keep class android.net.http.** { *; }
#-keep interface android.net.http.** { *; }

-keep class retrofit.** { *; }
-keep class com.daimajia.** { *; }
-keep class butterknife.** { *; }
-keep class **$$ViewBinder { *; }
-keep class com.crashlytics.** { *; }
-keep class com.crashlytics.android.**


# Gson specific classes
-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
-keep class in.znack.znack.** { *; }

#To maintain custom components names that are used on layouts XML.
#Uncomment if having any problem with the approach below
#-keep public class custom.components.package.and.name.**

#To maintain custom components names that are used on layouts XML:
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}

-keepclasseswithmembernames class * {
    @butterknife.* <fields>;
}

-keepclasseswithmembernames class * {
    @butterknife.* <methods>;
}

-keepclasseswithmembers class * {
    @retrofit.http.* <methods>;
}


#Maintain java native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

#To avoid changing names of methods invoked on layout's onClick.
# Uncomment and add specific method names if using onClick on layouts
#-keepclassmembers class * {
# public void onClickButton(android.view.View);
#}


-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

#Maintain enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

#To keep parcelable classes (to serialize - deserialize objects to sent through Intents)
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

#Keep the R
-keepclassmembers class **.R$* {
    public static <fields>;
}


#This tells Proguard to assume Log.v and Log.d have no side effects
# (even though they do since they write to the logs) and thus can be removed during optimization:
-assumenosideeffects class android.util.Log {
    public static int v(...);
    public static int d(...);
}



##### Citrus SDK Config starts here....
# Proguard Rules for Facebook Conceal
# Keep our interfaces so they can be used by other ProGuard rules.
# See http://sourceforge.net/p/proguard/bugs/466/
-keep,allowobfuscation @interface com.facebook.crypto.proguard.annotations.DoNotStrip
-keep,allowobfuscation @interface com.facebook.crypto.proguard.annotations.KeepGettersAndSetters

# Do not strip any method/class that is annotated with @DoNotStrip
-keep @com.facebook.crypto.proguard.annotations.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.crypto.proguard.annotations.DoNotStrip *;
}

-keepclassmembers @com.facebook.crypto.proguard.annotations.KeepGettersAndSetters class * {
  void set*(***);
  *** get*();
}
#Core SDK Configuration
-keep class javax.inject.** { *; }
-keep class com.citrus.** {*;}
-keep class com.citruspay.citrusbrowser.** { *; }
#-keep class com.zl.reik.dilatingdotsprogressbar.DilatingDotDrawable { *; }
-keep class com.zl.reik.** { *; }