#!/usr/bin/env python3

from datetime import datetime as dt
from setuptools import setup, find_packages
import ledfx.consts as const

PROJECT_PACKAGE_NAME = 'ledfx-dev'
PROJECT_VERSION = const.PROJECT_VERSION
PROJECT_LICENSE = 'The MIT License'
PROJECT_AUTHOR = 'Austin Hodges'
PROJECT_AUTHOR_EMAIL = 'ledfx.app@gmail.com'
PROJECT_URL = 'https://github.com/ahodges9/LedFx/tree/dev'

# Need to install numpy first
SETUP_REQUIRES = [
    'numpy>=1.13.3'
]

INSTALL_REQUIRES = [
    'numpy>=1.13.3',
    'voluptuous==0.11.1',
    'pyaudio>=0.2.11',
    'sacn==1.3',
    'aiohttp==3.3.2',
    'aiohttp_jinja2==1.0.0',
    'requests>=2.22.0',
	'pyyaml>=5.1',
    'aubio>=0.4.8',
    'zeroconf>=0.1.7',
    'pypiwin32>=223;platform_system=="Windows"'
]

setup(
    name=PROJECT_PACKAGE_NAME,
    version=PROJECT_VERSION,
    license = PROJECT_LICENSE,
    author=PROJECT_AUTHOR,
    author_email=PROJECT_AUTHOR_EMAIL,
    url=PROJECT_URL,
    project_urls={
        'Documentation': 'https://ledfx.readthedocs.io/en/docs/index.html',
        'Source': 'https://github.com/ahodges9/LedFx',
        'Discord': 'https://discord.gg/PqXMuthSNx'
    },
    install_requires=INSTALL_REQUIRES,
    setup_requires=SETUP_REQUIRES,
    python_requires=const.REQUIRED_PYTHON_STRING,
    include_package_data=True,
    # packages=find_packages(),
    zip_safe=True,
    entry_points={
        'console_scripts': [
            'ledfx = ledfx.__main__:main'
        ]
    },
    package_data={
        'ledfx_frontend': ['*'],
        '': ['*.npy']
    },

)
