### 📝 影片重點筆記：零信任 (Zero Trust)

#### 1. 什麼是零信任？

* **傳統網路問題：** 許多網路一旦通過防火牆，內部網路就相對開放，允許用戶或惡意軟體在系統間移動，缺乏安全檢查 [[00:02](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=2)]。
* **零信任核心概念：** 零信任模型要求您每次要存取特定資源時，**必須進行身份驗證或證明自己** [[00:30](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=30)]。
* **適用範圍：** 適用於網路上的每個裝置、每個正在運行的程序以及每個使用者 [[00:36](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=36)]。
* **原則：** 顧名思義，**不信任任何事物**，所有事物都需接受某種安全檢查 [[00:44](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=44)]。
* **實施方法：**
    * 在登入過程中使用多重身份驗證 (MFA) [[00:52](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=52)]。
    * 對儲存和網路傳輸的資料進行加密 [[00:59](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=59)]。
    * 新增系統權限或額外的防火牆和安全策略 [[01:03](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=63)]。

#### 2. 分離功能層面 (Functional Planes)

為了實施零信任，我們可以將安全設備拆分成更小的功能組件，通常稱為**操作功能層面**：

| 層面名稱 (Plane) | 職責與功能 | 舉例 |
| :--- | :--- | :--- |
| **資料層面 (Data Plane)** | 執行**實際安全處理**的部分，負責即時處理資料、影格和封包的移動 [[01:43](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=103)]。 | 處理轉發、網路位址轉譯 (NAT)、路由等，將資料從網路某部分移動到另一部分 [[02:08](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=128)]。 |
| **控制層面 (Control Plane)** | **管理**資料層面中所有發生的動作，包括配置策略或規則 [[02:13](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=133)]。 | 配置防火牆規則、路由表、網路位址轉譯的處理方式等 [[02:30](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=150)]。 |
| **應用：** | 這種分離適用於實體裝置、虛擬裝置（如虛擬交換器/防火牆）和雲端安全控制 [[03:29](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=209)]。 | |

#### 3. 實施零信任的策略與控制

* **適應性身份 (Adaptive Identity)：**
    * 根據**身份驗證過程中所收集到的其他資訊**來套用安全控制 [[03:51](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=231)]。
    * **檢查變數：** 請求的來源位置（例如 IP 位址顯示在中國，但請求者聲稱在美國）、用戶與組織的關係（員工/承包商）、實體位置、連線類型等 [[04:14](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=254)]。
    * **決策：** 系統會自動決定是否需要更強的身份驗證 [[04:59](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=299)]。
* **進入點限制 (Limit Entry Points)：**
    * 限制只有在建築物內或透過 VPN 連接的人才能進入網路 [[05:07](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=307)]。
* **策略驅動式存取控制 (Policy Driven Access Control)：**
    * 結合所有資料點，建立策略來決定應使用何種身份驗證程序 [[05:25](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=325)]。

#### 4. 安全區域 (Security Zones) 與隱含信任

* **目的：** 通過將網路劃分為不同區域，來界定使用者連線的來源與目的地 [[05:46](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=346)]。
* **區域分類：**
    * **非信任區域 (Untrusted Network)** 連接到 **信任區域 (Trusted Network)**。
    * 內部網路 (Internal Network) 或外部網路 (External Network) [[06:13](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=373)]。
    * 可以進一步細分為特定部門或 VPN 連線組 [[06:26](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=386)]。
* **策略範例：**
    * 若有人從非信任區域嘗試與信任區域的裝置通訊，自動**拒絕存取** [[06:37](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=397)]。
    * **隱含信任 (Implicit Trust)：** 如果使用者在辦公室的信任區域，存取資料中心內部區域的伺服器，您可以設定策略讓這部分通訊**隱含地受到信任** [[06:50](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=410)]。

#### 5. 政策執行點 (Policy Enforcement Point, PEP)

* **功能：** 負責在路徑上**執行**安全策略 [[07:20](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=440)]。
* **作用：** 它是網路流量的守門人，所有流量都必須通過它，以便決定是否允許或拒絕 [[07:45](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=465)]。
* **主體 (Subjects)：** 指的是最終用戶、系統上運行的程序或使用的應用程式 [[07:37](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=457)]。

#### 6. 零信任模型的協同運作 (PEP, PDP, PA)

| 組件名稱 | 職責與功能 |
| :--- | :--- |
| **政策執行點 (PEP)** | **執行者：** 收集流量資訊，並將其傳送給策略管理員 [[08:13](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=493)]。 |
| **政策決策點 (PDP)** | **決策者：** 負責檢查身份驗證，並根據**預先定義的安全策略**做出允許、拒絕或撤銷的決定 [[08:21](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=501)]。 |
| **政策管理員 (PA)** | **溝通者：** 將 PDP 的決定傳達給 PEP，可能包括建立存取權杖或憑證 [[08:50](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=530)]。 |

整個零信任模型流程為：主體從非信任區域發出請求 → 經由 **PEP** → **PA** → **PDP** 做出決定 → **PA** 將結果傳回 **PEP** → **PEP** 根據決定允許或拒絕存取信任區域的企業資源 [[09:14](http://www.youtube.com/watch?v=zC_Pndpg8-c&t=554)]。


http://googleusercontent.com/youtube_content/4
