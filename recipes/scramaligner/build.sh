#!/bin/bash


# Build Go app
export GOPATH="${SRC_DIR}/gopath"
export PATH="$GOPATH/bin:$PATH"
go build -o "${PREFIX}/bin/scramAligner" .

# Install Python scripts
# Install adaptTrim
pushd scramScripts/adaptTrim/src
${PYTHON} -m pip3 install . --no-deps --ignore-installed --no-cache-dir -vvv
popd

# Install scram2Plot
pushd scramScripts/scram2Plot/src
${PYTHON} -m pip3 install . --no-deps --ignore-installed --no-cache-dir -vvv
popd

# Make Python scripts executable and move them to the bin folder
find scramScripts -type f -name "*.py" -exec chmod +x {} \;
find scramScripts -type f -name "*.py" -exec cp {} "${PREFIX}/bin/" \;