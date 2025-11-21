## virtualbox ubuntu
[解決VirtualBox無法雙向複製貼上. 最近在VirtualBox安裝Ubuntu 18.04.4… | by Oliver Hua 花雲鴻 | 花哥的奇幻旅程 | Medium](https://medium.com/%E8%8A%B1%E5%93%A5%E7%9A%84%E5%A5%87%E5%B9%BB%E6%97%85%E7%A8%8B/%E8%A7%A3%E6%B1%BAvirtualbox%E7%84%A1%E6%B3%95%E9%9B%99%E5%90%91%E8%A4%87%E8%A3%BD%E8%B2%BC%E4%B8%8A-1554d5a81da0)

## VScode
[【 Tools 】Ubuntu 安裝 Visual Studio Code (learningsky.io)](https://learningsky.io/tools-ubuntu-install-visual-studio-code/)

## Node.js NPM installation
[How to Install Node.js and NPM on Ubuntu 24.04 (ubuntushell.com)](https://ubuntushell.com/install-nodejs-and-npm-on-ubuntu/)

## Github SSH key
[Generating a new SSH key and adding it to the ssh-agent - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux)
```shell
$ ssh-keygen -t ed25519 -C "your_email@example.com"
> Generating public/private ALGORITHM key pair.
> Enter a file in which to save the key (/home/YOU/.ssh/id_ALGORITHM):[Press enter]
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]
```

[Adding a new SSH key to your GitHub account - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
```shell
$ cat ~/.ssh/id_ed25519.pub
# Then select and copy the contents of the id_ed25519.pub file
# displayed in the terminal to your clipboard
```

ssh-agent
```shell
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```
```shell
ssh-add ~/.ssh/id_ed25519
```

## Tidal SDK
```
npm install -g pnpm
```