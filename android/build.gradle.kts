buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // ✅ Firebase plugin to enable google-services.json support
        classpath("com.google.gms:google-services:4.4.0")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 🔧 Optional: Set a custom build directory (you already had this)
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}

// 🧼 Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
