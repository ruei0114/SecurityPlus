# 自動同步 Cybersecurity 資料夾到 public repo
# remote: public
# branch: main

Write-Host "=== Obsidian Public Sync 開始 ===`n"

# 取得當前 Repo 路徑
$repoPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoPath

# 檢查是否為 git repo
if (-not (Test-Path ".git")) {
    Write-Host "❌ 錯誤：此資料夾不是 Git repository。"
    exit 1
}

# 顯示目前的 remote
Write-Host "目前 remotes:"
git remote -v

Write-Host "`n檢查 public remote..."
$remotes = git remote
if ($remotes -notcontains "public") {
    Write-Host "❌ 找不到 remote 'public'，請先執行："
    Write-Host "git remote add public <public_repo_url>"
    exit 1
}

# 顯示目前狀態
Write-Host "`n檢查變更..."
$status = git status --porcelain

if ($status) {
    Write-Host "⚠ 偵測到尚未 commit 的變更，是否自動 commit？ (Y/N)"
    $choice = Read-Host

    if ($choice -eq "Y") {
        git add .
        git commit -m "Auto-commit before public sync"
        Write-Host "📝 已自動 commit"
    } else {
        Write-Host "❌ 中止同步，請先手動 commit。"
        exit 1
    }
}

# 開始 push subtree
Write-Host "`n🚀 開始同步 Cybersecurity -> public repo (main)..."
git subtree push --prefix=Cybersecurity public main

if ($LASTEXITCODE -ne 0) {
    Write-Host "`n❌ 同步失敗，請檢查錯誤訊息。"
    exit 1
}

Write-Host "`n✅ 同步完成！Cybersecurity 已更新到 public repo main 分支。"
Write-Host "=== 完成 ==="
