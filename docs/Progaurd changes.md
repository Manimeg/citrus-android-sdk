<b> Pro-Guard Changes </b>

#Add Following pro-guard rules for SDK

    -keep class com.citrus.** { *; } 
    -keep class com.citruspay.citrusbrowser.** { *; }
    -keep class com.google.** { *; }
    -keepattributes *Annotation*

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

