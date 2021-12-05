import ast
import os

class Utility(object):
    ROBOT_LIBRARY_VERSION = 0.1
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def is_threshold_perc_warning(self,threshold, current,lower, upper):
        if(lower < 0):
            adjustment = lower * -1
        else:
            adjustment = lower
        thresholdMin = lower + adjustment *(threshold/100)
        thresholdMax = upper-upper*(threshold/100)
        if(current < thresholdMin or current >= thresholdMax):
            return True
        else:
            return False

    def is_threshold_abs_warning(self,threshold, current,lower, upper):
        thresholdMin = lower + threshold
        thresholdMax = upper - threshold
        if(current < thresholdMin or current >= thresholdMax):
            return True
        else:
            return False
