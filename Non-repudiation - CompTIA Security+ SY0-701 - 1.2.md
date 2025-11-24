> [!info] LINK & TAG
> [Non-repudiation - CompTIA Security+ SY0-701 - 1.2](https://www.youtube.com/watch?v=XxnCxPEllMg&list=PLG49S3nxzAnl4QDVqK-hOnoqcSKEIDDuv&index=4)
> [[Hashing]]
> #securityPlus 

# ✅ **情境 1：用 MAC（需要共享密鑰）**
Proof of integrity
像 HMAC-SHA256，是發送端與接收端共享同一把密鑰。

### 流程

1. Sender 產生：  
    `MAC = HMAC(key, message)`
    
2. Sender 把 **message + MAC** 傳給 Receiver
    
3. Receiver 收到訊息後自己也計算一次：  
    `HMAC(key, message)`
    
4. 比對是否和收到的 MAC 一樣。
    

### 🔒 為什麼攻擊者不能偽造？

因為 MAC 的生成需要 **雙方共享的密鑰**，攻擊者沒有密鑰就做不出正確的 MAC。

---

# ✅ **情境 2：用數位簽章（非對稱加密）**
Proof of origin
如果 Sender 和 Receiver 沒有共享密鑰，就要使用數位簽章。

### 流程

1. Sender 用 **私鑰** 對訊息的 **hash** 做簽章：  
    `signature = Sign(SK_private, hash(message))`
    
2. Sender 傳：  
    **message + signature**
    
3. Receiver 用 Sender 的 **公鑰** 驗證：  
    `Verify(PK_public, message, signature)`
    
4. 驗證成功 → 表示：
    
    - 訊息沒被改（Integrity）
        
    - 真的是 Sender 發的（Authentication / Non-repudiation）
        

### 🔒 為什麼 hash 可以信任？

因為 hash 是被 Sender 的私鑰「簽」過的。  
攻擊者就算改訊息，也做不出匹配的簽章。
