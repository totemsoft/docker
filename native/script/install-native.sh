#!/bin/bash

# based on OS
if [ $(uname) == "Linux" ]; then
  echo ">>> $(uname)"
  # Oracle Linux
  #sudo yum install gcc glibc-devel zlib-devel
  # Ubuntu Linux
  #sudo apt-get install build-essential libz-dev zlib1g-dev
  # other Linux distributions
  #sudo dnf install gcc glibc-devel zlib-devel libstdc++-static
elif [ $(uname) == "Darwin" ]; then
  echo ">>> $(uname)"
  #xcode-select --install
  echo $(xcode-select --version)
  # https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.0.0.2/graalvm-ce-java11-darwin-amd64-22.0.0.2.tar.gz
  #sudo xattr -r -d com.apple.quarantine path/to/graalvm/folder/
else
  echo ">>> $(uname)"
fi

#export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-22.0.0.2/Contents/Home
echo "$($GRAALVM_HOME/bin/java -version)"

$GRAALVM_HOME/bin/gu list
$GRAALVM_HOME/bin/gu install native-image
$GRAALVM_HOME/bin/gu list

#mvn package -Pnative -DskipTests
