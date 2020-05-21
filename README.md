# Version and build number update.
 This is a script that increase the version and the build number using  the number of commits.

## Actions:
**1. Add the update_build_number.sh to your proyect.**
This scrip it's configure to count the number of commits of your current project that add this number to the end of the version (X.Z.number_of_commits) and also change the build with this number.

**2. In the Build Phases of you project add a "New  Run Script Phase"**
Whit this the update_build_number.sh will be exsecuted the the proyect it's build.
```sh
#Script to increase the build number using the number of commits.
${SRCROOT}/update_build_number.sh
```
The result should be like this:
![script_xcode](https://github.com/jmhdevelop/version-and-build-number-update/blob/master/script_xcode.png)

**3. Version and build number.**
Make sure the only numbers you change manually in the version (X.Z.Y) are X and Z because Y it's the number that going to be changed automatically. In the case of the build number you dont need to do nothing.

Should look something like this:
![version_build_number](https://github.com/jmhdevelop/version-and-build-number-update/blob/master/version_build_number.png)

## Note.
If you like you can set the build number to 1 because of the number of commits it's a unique number a it's always change. You don't necessarily needs to increased the build number if you like.
