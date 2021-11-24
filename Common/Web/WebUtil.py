
import robot.api.logger
import robot.utils.asserts
import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from robot.libraries.BuiltIn import BuiltIn

class Utility:

    ROBOT_LIBRARY_VERSION = 0.1
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def get_localappdata(self):
        return os.getenv('LOCALAPPDATA')


