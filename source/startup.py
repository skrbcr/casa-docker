import sys
import os
try:
    sys.path.append(os.path.expanduser('~') + '/analysis_scripts')
    sys.path.append('/github/home/analysis_scripts')
except Exception as e:
    pass
import analysisUtils as au
