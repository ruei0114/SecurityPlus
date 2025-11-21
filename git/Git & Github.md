
# <font color = "8080c0">Git</font>
- 版本控制系統
- 類似遊戲存檔功能
- 共同開發(同步問題)
# <font color = "8080c0">Github</font>
- 類似 google drive
- 遠端 hosting, 方便大家使用(或自己使用)
---
# <font color = "8080c0">使用</font>
### local
####  <font color = "efb730">git init</font>
- <font color = "c2e3f4">初始化一個新的 Git repository</font>
- directory 中創建一個隱藏的子目錄 '.git'，並在裡面保存所有Git版本控制所需要的資料
#### <font color = "efb730">git status</font>
- <font color = "c2e3f4">查看目前工作目錄的狀態</font>
- <font color = "3aa690">Untracked files</font>
	- 這些是Git還不知道的檔案(新建/修改)，還沒有被加入到Git的版本控制中
	- e.g. 新增檔案 hello.txt
- <font color = "3aa690">Changes not staged for commit</font>
	- 檔案編輯後未 commit
- <font color = "3aa690"> Changes to be committed</font>
	- after [[#<font color = "efb730">git add</font>|git add]]
#### <font color = "efb730">git add</font>
- <font color = "c2e3f4">將檔案加入到暫存區 (git 可以 track)(staged)</font> 
```
- git add <檔案名稱>
- git add .
```

#### <font color = "efb730">git commit</font>
- <font color = "c2e3f4">暫存區永久性地保存到repository (存檔)</font>
- ```git commit```
- ```git commit -m "內容"```

#### <font color = "efb730">git log</font>
- <font color = "c2e3f4">看到所有 commit 的紀錄</font>

#### <font color = "efb730">git reset</font>
1. <font color = "c2e3f4">可以視為 git add 的逆向 (staged to unstaged)</font>
	- ```git reset -- <檔案名稱>```
2. <font color = "c2e3f4">undo commit</font>
	- ```git reset --soft HEAD~1```
	    ```git reset --soft HEAD~<幾個 commit 前>```

#### <font color = "efb730">git checkout</font>
1. <font color = "c2e3f4">discard changes (go to last commit)</font>
	- 必須 unstaged
	- ```git checkout -- <檔案名稱>```
- <font color = "c2e3f4">建立新的 branch</font>
	- ```git checkout -b <branch name>```
### remote connect [[#<font color = "8080c0">Github</font>|Github]]
#### <font color = "efb730">git remote add</font>
- <font color = "c2e3f4">連結 remote repository 與 local repository</font>
- ```git remote add <自訂名稱> <remote repository URL>```
-  ```git remote add origin https://github.com/ruei0114/test.git```

#### <font color = "efb730">git remote</font>
- <font color = "c2e3f4">列出所有 remote repository</font>

#### <font color = "efb730">git push </font>
- <font color = "c2e3f4">將 commit 都 push 到 remote repository</font>
- ```git push -u <remote repository> <branch>```
- e.g. ```git push -u origin master```

gittest

#### <font color = "efb730">git ssh key </font>
[設定 Github SSH 金鑰 feat. Github SSH、HTTPS 的差異 - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天](https://ithelp.ithome.com.tw/articles/10205988)

[Generating a new SSH key and adding it to the ssh-agent - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

