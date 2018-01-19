#!/bin/sh

# Driver script for Selenium server, launched by selenium.service
# Converted from the old upstart script

env DISPLAY=:99
exec java -jar /usr/local/lib/selenium-server-standalone.jar
