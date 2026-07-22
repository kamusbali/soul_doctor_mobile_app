fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios setup_match

```sh
[bundle exec] fastlane ios setup_match
```

Create and store App Store certificates and profiles

### ios development

```sh
[bundle exec] fastlane ios development
```

Build unsigned iOS development application

### ios staging

```sh
[bundle exec] fastlane ios staging
```

Build signed iOS staging application

### ios deploy_staging

```sh
[bundle exec] fastlane ios deploy_staging
```

Build and upload iOS staging application to TestFlight

### ios release

```sh
[bundle exec] fastlane ios release
```

Build signed iOS production candidate

### ios production

```sh
[bundle exec] fastlane ios production
```

Build and upload iOS production application

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
