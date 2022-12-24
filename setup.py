from setuptools import setup
import nimporter

with open("pypi.md", "r") as f:
    md = f.read()

setup(
    name='intenc',
    version='0.1.0',
    description='Integer encoding',
    long_description=md,
    long_description_content_type="text/markdown",
    author='thatrandomperson5',
    url='https://github.com/thatrandomperson5/BOE',
    license="MIT",
    classifiers=["Development Status :: 4 - Beta"],
    keywords=["encoding", "integer", "bit", "byte"],
    platforms=["linux", "macosx"],   
    packages=['intenc'],
    ext_modules=nimporter.build_nim_extensions(danger=True)
)
