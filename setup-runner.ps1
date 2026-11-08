$ErrorActionPreference = 'Stop'
Set-Location C:\
Write-Host '=== Step 1/4: 下载 runner ==='
if (-not (Test-Path 'C:\runner.zip')) {
  Invoke-WebRequest -Uri 'https://github.com/actions/runner/releases/latest/download/actions-runner-win-x64-latest.zip' -OutFile 'C:\runner.zip'
}
Write-Host '=== Step 2/4: 解压 ==='
if (-not (Test-Path 'C:\actions-runner\config.cmd')) {
  Expand-Archive -Path 'C:\runner.zip' -DestinationPath 'C:\actions-runner' -Force
}
Write-Host '=== Step 3/4: 注册 ==='
Set-Location 'C:\actions-runner'
.\config.cmd --unattended --url 'https://github.com/asdfxvgsbb/xiaodan-train' --token 'COGFNHNOMDETF6FUK6WYGITK6BS6S' --name 'my-cloud-server' --work 'C:\actions-runner\_work'
Write-Host '=== Step 4/4: 启动 (看到 Listening for Jobs 即成功) ==='
.\run.cmd
