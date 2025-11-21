### `BaseSystem.ts` 分析
#### **類別結構**
- **`BaseSystem`** 是一個抽象類：
  - **屬性**：
    - `protected items: BookInfo[] = []`：儲存處理後的書目數據，預設為空陣列。
    - `protected updateMessage: string`：儲存更新訊息，由建構函數設定。
  - **建構函數**：
    - `constructor(updateMessage: string)`：初始化 `updateMessage`。
  - **方法**：
    - `abstract process(prevItems: BookInfo[])`：抽象方法，子類必須實作。
    - `getItems(): BookInfo[]`：返回 `items`。
    - `getUpdateMessage(): string`：返回 `updateMessage`。

---

### FilterSystem 代碼分析

#### **功能概述**

- FilterSystem 繼承自 BaseSystem，是一個用於過濾書目數據的系統。
- 它根據設定的 filterWord（過濾關鍵字）從輸入的 BookInfo[] 中篩選出標題（title）匹配的項目。
- 支援大小寫忽略選項（ignoreCase）。

#### **主要屬性和方法**

1. **屬性**：
    - filterWord: string：儲存過濾用的關鍵字，預設為空字符串。
    - ignoreCase: boolean：決定是否忽略大小寫，預設為 false。
    - items：從 BaseSystem 繼承，儲存處理後的結果（推測為 BookInfo[] 類型）。
2. **方法**：
    - setFilterWord(filterWord: string)：設定過濾關鍵字。
    - getFilterWord(): string：獲取當前的過濾關鍵字。
    - setIgnoreCase(ignoreCase: boolean)：設定是否忽略大小寫。
    - isIgnoreCase(): boolean：檢查是否忽略大小寫。
    - async process(prevItems: BookInfo[])：核心方法，根據 filterWord 過濾輸入的書目列表，並將結果儲存到 this.items。
3. **過濾邏輯**：
    - 使用正則表達式（RegExp）進行匹配。
    - 如果 ignoreCase 為 true，則正則表達式使用 'i' 旗標（忽略大小寫）。
    - 過濾條件：檢查每本書的 title 是否匹配 filterWord。

#### **假設**

- BookInfo 是一個外部定義的類型（從 @externals/simple-db 導入），至少包含 title: string 屬性。
- BaseSystem 提供了一些基礎功能，例如 items 屬性用於儲存處理結果。

---

#### **對 `FilterSystem` 的影響**
- **`FilterSystem` 的實現**（已提供）：
  - 繼承 `BaseSystem`，建構函數傳入 `"Filter Update"`。
  - `process` 方法是異步的（`async`），並直接操作 `this.items`。
  - 使用 `getItems()` 存取結果，而不是直接訪問 `items`（符合封裝原則）。
- **異常處理**：
  - `BaseSystem` 未定義對 `null` 或無效輸入的行為，`FilterSystem` 的 `process` 需自行處理。
  - 若 `prevItems` 為 `null`，可能導致 `filter` 方法拋出異常，需測試此情況。

#### **測試調整方向**
- **保留核心測試**：過濾功能（大小寫敏感/忽略、空輸入等）。
- **新增測試**：檢查 `getUpdateMessage()` 和 `getItems()`。
- **異常處理**：明確測試 `null` 輸入的行為（假設拋出錯誤）。
- **一致性**：確保與 `BaseSystem` 的介面互動正確。

---

### 重新設計的 `FilterSystem.test.ts`
以下是基於 `BaseSystem.ts` 和 `FilterSystem.ts` 的完整測試案例：

```javascript
import { FilterSystem } from './FilterSystem';
import { TestBookInfo } from '../_test_/TestingData'; // 假設路徑

describe('FilterSystem', () => {
    let filterSystem: FilterSystem;

    beforeEach(() => {
        filterSystem = new FilterSystem();
        jest.resetAllMocks(); // 重置 Mock，保持測試獨立
    });

    // 測試建構函數與 getUpdateMessage
    test('should initialize with correct update message', () => {
        expect(filterSystem.getUpdateMessage()).toBe('Filter Update');
    });

    // 測試 setFilterWord 和 getFilterWord
    test('should set and get filter word correctly', () => {
        filterSystem.setFilterWord('Java');
        expect(filterSystem.getFilterWord()).toBe('Java');
    });

    // 測試 setIgnoreCase 和 isIgnoreCase
    test('should set and get ignoreCase correctly', () => {
        filterSystem.setIgnoreCase(true);
        expect(filterSystem.isIgnoreCase()).toBe(true);
        filterSystem.setIgnoreCase(false);
        expect(filterSystem.isIgnoreCase()).toBe(false);
    });

    // 測試正常過濾（大小寫敏感）
    test('should filter books by keyword', async () => {
        filterSystem.setFilterWord('Java');
        await filterSystem.process(TestBookInfo);
        const expected = TestBookInfo.filter((book) => /Java/.test(book.title));
        expect(filterSystem.getItems()).toEqual(expected); // 使用 getItems()
    });

    // 測試忽略大小寫
    test('should filter books ignoring case when ignoreCase is true', async () => {
        filterSystem.setFilterWord('java');
        filterSystem.setIgnoreCase(true);
        await filterSystem.process(TestBookInfo);
        const expected = TestBookInfo.filter((book) => /java/i.test(book.title));
        expect(filterSystem.getItems()).toEqual(expected);
    });

    // 測試無匹配結果
    test('should return empty array when no matches', async () => {
        filterSystem.setFilterWord('Ruby');
        await filterSystem.process(TestBookInfo);
        expect(filterSystem.getItems()).toEqual([]);
    });

    // 測試空關鍵字
    test('should return empty array with empty filter word', async () => {
        filterSystem.setFilterWord('');
        await filterSystem.process(TestBookInfo);
        expect(filterSystem.getItems()).toEqual([]);
    });

    // 測試空輸入陣列
    test('should handle empty input array', async () => {
        filterSystem.setFilterWord('Java');
        await filterSystem.process([]);
        expect(filterSystem.getItems()).toEqual([]);
    });

    // 測試 null 輸入
    test('should throw error for null input', async () => {
        filterSystem.setFilterWord('Java');
        await expect(filterSystem.process(null as any)).rejects.toThrow(TypeError); // 預期拋出異常
    });
});
```

---

### 測試案例說明
#### **調整與新增**
1. **建構函數測試**：
   - 新增 `getUpdateMessage` 測試，驗證 `"Filter Update"` 是否正確初始化。
2. **Getter/Setter 測試**：
   - 測試 `setFilterWord`/`getFilterWord` 和 `setIgnoreCase`/`isIgnoreCase`，確保屬性管理正確。
3. **使用 `getItems()`**：
   - 所有測試中，使用 `filterSystem.getItems()` 取代直接訪問 `items`，符合 `BaseSystem` 的封裝設計。
4. **異常處理**：
   - `null` 輸入測試假設拋出 `TypeError`，因為 `prevItems.filter` 在 `null` 上執行會失敗。
   - 若 `BaseSystem` 或 `FilterSystem` 有其他異常處理邏輯，需調整斷言。

#### **覆蓋分支**
- **正常過濾**：大小寫敏感和忽略大小寫。
- **邊界情況**：空關鍵字、空輸入、無匹配。
- **異常情況**：`null` 輸入。
- **`BaseSystem` 功能**：`getUpdateMessage` 和 `getItems` 的使用。

#### **與原始程式碼的關係**
- 原始的 `FilterSystem.test.ts`（`expect(1).toEqual(1)`）是一個占位符，已被完全替換，因為新測試滿足 "题目 1" 的要求。

---

### 為何調整
1. **`BaseSystem` 的抽象性**：
   - `process` 是異步實現，測試中使用 `await` 保持一致。
   - `items` 是 `protected`，必須通過 `getItems()` 存取。
2. **異常行為明確化**：
   - `FilterSystem` 未顯式處理 `null`，但 `prevItems.filter` 會拋出異常，測試反映此行為。
3. **範例啟發**：
   - 參考 `ErrorCatchExample.test.ts`，測試異常分支。
   - 參考 `TestingData.ts`，使用 `TestBookInfo`。

---

### 結論
這個重新設計的 `FilterSystem.test.ts`：
- 與 `BaseSystem.ts` 完全相容，測試所有功能和分支。
- 使用 `TestBookInfo` 作為標準輸入，符合文件建議。
- 覆蓋 "题目 1" 的要求（所有分支），包括 `BaseSystem` 的介面使用。

如果需要進一步調整（例如確認 `null` 的具體異常訊息，或新增其他測試案例），請告訴我！