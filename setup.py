from setuptools import setup
import nimporter

setup(
    name='intenc',
    version='0.1.0',
    description='Integer encoding',
    author='thatrandomperson5',
    url='https://github.com/thatrandomperson5/BOE',
    packages=['intenc'],
    package_data={'': ['*.nim*']}, 
    setup_requires = [
        "choosenim_install",
    ],
    install_requires=[
        'nimporter',                
    ],
    ext_modules=nimporter.build_nim_extensions(danger=True)
)
