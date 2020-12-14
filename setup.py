

import os
import sys

assert "ASCDS_INSTALL" in os.environ, "Please run this after CIAO has been setup"


scripts = ["image_tempmap","make_mkwarf_map","multi_spec"]
params = [ x+".par" for x in scripts]
docs = [ x+".xml" for x in scripts if os.path.exists(x+".xml")]


from distutils.core import setup
setup( name='TemperatureMaps',
        version='4.13.0',
        description='Temperature maps scripts',
        author='Kenny Glotfelty',
        author_email='glotfeltyk@si.edu',
        url='https://github.com/kglotfelty/TemperatureMaps/',
        scripts = scripts,
        data_files = [ ("param", params ), ("share/doc/xml", docs ) ]
        )

