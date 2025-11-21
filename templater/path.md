<%*
const rawPath = await tp.system.prompt("請輸入 Windows 路徑（例如：C:\\Users\\你\\...）");

// 替換 \ 為 /，並在前面加上 file:///
const fileUrl = "file:///" + rawPath.replace(/\\/g, "/");

// 取得檔名作為顯示文字
const parts = rawPath.split("\\");
const fileName = parts[parts.length - 1];

tR = `[${fileName}](${fileUrl})`;
%>
