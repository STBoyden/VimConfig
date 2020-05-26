import os
import sys


languages = {
    "c"       : "cmake",
    "cpp"     : "cmake",
    "python"  : "python3",
}

def help(  ):
    print(
"""
Usage: make_proj.py [PROJECT_NAME] [LANGUAGE]
"""
    )

def main(  ):
    args = sys.argv[ 1: ]
    
    if args == [ ]:
        help(  )
        return

    project_name = args[ 0 ]
    language = args[ 1 ]


main(  ) 
