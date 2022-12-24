from setuptools import setup
import nimporter

setup(
    name='intenc',
    version='0.1.0',
    description='Integer encoding',
    author='thatrandomperson5',
    url='https://github.com/thatrandomperson5/BOE',
    packages=['intenc'],
    ext_modules=nimporter.build_nim_extensions(danger=True)
)
