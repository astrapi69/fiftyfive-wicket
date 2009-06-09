#!/bin/sh
if test "$XX_SKIP_TEST" == "1"
then
    exit
fi

export XX_SKIP_TEST=1
echo "Cleaning"
mvn -B -q clean
cd ..
echo "Installing archetype"
mvn -B -q -Dmaven.test.skip=true \
    install && \
cd wicket-archetype/target && \
echo "Generating sample project" && \
mvn -q -B archetype:generate \
    -DarchetypeGroupId=com.55minutes \
    -DarchetypeArtifactId=fiftyfive-wicket-archetype \
    -DarchetypeVersion=1.1-SNAPSHOT \
    -DgroupId=com.55minutes \
    -DartifactId=test-project \
    -Dversion=1.0.1-SNAPSHOT \
    -Dpackage=fiftyfive.test \
    -Dproject_name=Test && \
cd test-project && \
echo "Testing sample project" && \
mvn -B test
