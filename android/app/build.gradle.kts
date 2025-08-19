plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "dev.putuwaw.soul_doctor"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "dev.putuwaw.soul_doctor"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "app"

    productFlavors {
        create("development") {
            dimension = "app"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            manifestPlaceholders["app_name"] = "[DEV] Soul Doctor"
            resValue("string", "app_name", "[DEV] Soul Doctor")
        }

        create("stagging") {
            dimension = "app"
            applicationIdSuffix = ".stage"
            versionNameSuffix = "-stage"
            manifestPlaceholders["app_name"] = "[STAGE] Soul Doctor"
            resValue("string", "app_name", "[STAGE] Soul Doctor")
        }

        create("production") {
            dimension = "app"
            applicationIdSuffix = ".production"
            versionNameSuffix = "-production"
            manifestPlaceholders["app_name"] = "Soul Doctor"
            resValue("string", "app_name", "Soul Doctor")
        }
    }
}

flutter {
    source = "../.."
}
