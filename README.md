# aws-travis-ci-template

This is a template to mimic Trend Micro internal CI service in Github. To take advantage of travis CI and archive build artifacts in S3.

## CI Environment Setup

With Travis CI, you could manage your CI infrastructure with your source code. Hence Travis CI provides pretty flexible capability to customize the build as well as supported languages.

You should refer to the following information to setup your build environment first.

[Getting started](https://docs.travis-ci.com/user/getting-started/)

[Customizing the build](https://docs.travis-ci.com/user/customizing-the-build/)

[Installing Dependencies](https://docs.travis-ci.com/user/installing-dependencies/)

## Testing Environment Setup (optional)

With Travis CI, you could automate your source code. Hence Travis CI provides pretty flexible capability to customize automation as well as supported testing framework.

You should refer to the following information to setup your automation environment.

[Setting up Services and Databases](https://docs.travis-ci.com/user/database-setup/)

## Secure Signkey

As build artifacts will be delivered to customers, the package should be signed to ensure integrity. However, it's not safe to keep sign key in Github repo.

This is the way I resolve the concern, and keep encrypted sign key in repo. The sign key will be decrypted at step `before_install`.

[Encrypting files](https://docs.travis-ci.com/user/encrypting-files/)

## Upload Build Artifacts to S3

Since Travis CI is isolated environment, and the build artifacts will be destroyed once the process complete.

Hence I leverage AWS S3 to upload build artifacts, and encrypt AWS credential in .travis.yml.

[S3 Deployment](https://docs.travis-ci.com/user/deployment/s3)

[Encrypting Sensitive Data](https://docs.travis-ci.com/user/encryption-keys/)

## FAQ

### How to reset specific build number?

In this template I add 1000 to Travis build number `$TRAVIS_BUILD_NUMBER`. If you would like to fully control build number, off the top of my head is keeping build information in S3 as well. You may retrieve the last build information at step `before_script`, and update build information at step `after_success`.

### How to build beta and production build with different settings?

If you manage your source code in different branch, you may take `$TRAVIS_BRANCH` as parameter to control the flow of build script.
