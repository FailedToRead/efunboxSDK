chcp 65001
::此脚本仅执行一次，不可多次执行
::【需要修改1】：github本地仓库，非maven存储库
set DEPLOY_PATH=G:\Maven\efunbox_sdk

D:
::创建本地仓库
md %DEPLOY_PATH%
cd %DEPLOY_PATH%

::将本地仓库与远程仓库关联
echo "# maven-repository" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/FailedToRead/efunboxSDK.git
git push -u origin master

::新建分支snapshot，并将新建的分支推送到远程仓库
git switch -c snapshot
git push --set-upstream origin snapshot

git switch -c release
git push --set-upstream origin release

pause
