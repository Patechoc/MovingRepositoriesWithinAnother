#!/bin/sh
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 subprojectName mainRepo subprojectRepo" >&2
  echo "example: $0 mapNorway https://github.com/mapWorld https://github.com/mapNorge" >&2
  exit 1
fi

subprojNewName=$1
nameRepoMainproj=$2
nameRepoSubproj=$3


#nameRepoMainproj=https://github.com/Patechoc/TALKS.git 
#nameRepoSubproj=https://github.com/Patechoc/2011-03-18_CTCCseminar_CompChem_for_SyntheticBiology.git
#subprojNewName=2011-03-18_CTCCseminar_CompChem_for_SyntheticBiology

currentDir=`echo $PWD`
echo "current dir: "$currentDir

git clone $nameRepoMainproj mainproj 
git clone $nameRepoSubproj subproj_tmp

mainprojPath=$currentDir/mainproj
subprojPath=$currentDir/subproj_tmp


cd $subprojPath
echo "mkdir -p .${subprojNewName};mv * .${subprojNewName};mv .${subprojNewName} ${subprojNewName}" > ~/run.sh
git filter-branch -f --prune-empty --tree-filter 'bash ~/run.sh' -- --all



##git filter-branch -f --prune-empty --tree-filter 'mkdir -p .sub;mv * .sub;mv .sub sub' -- --all
git gc --aggressive

## We can now merge subproj into mainproj
cd $mainprojPath
git remote add subproj $subprojPath

git fetch subproj 
git merge subproj/master

git remote rm subproj
git gc --aggressive
### git push origin master

rm -rf $subprojPath

echo "Check the content of your local merged repositories here: ",$mainprojPath
echo "Feel free to push it now:\n git push"

