#!/bin/bash

echo 'Start to build on branch ' ${1} '#' ${2} 
echo 'Travis build number ' ${3} ', my build number ' ${4}

javac HelloWorld.java

mv *.class $BUILD_ARTIFACTS_FOLDER


