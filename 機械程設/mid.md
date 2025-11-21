### 記帳應用：Flask 與 SQLite 的實作

---

### 專案整體架構說明
- 接下來介紹我的專案架構，分為三個部分。
	- 首先是後端，負責處理輸入輸出資料的處理和計算，我**使用 Flask 來管理伺服器和資料庫的互動**，例如處理表單資料和查詢。
	- 接著是前端，也就是網頁畫面的展示 UI 和負責處理使用者互動的功能。使**用 HTML、CSS 和 JavaScript 設計使用者介面**，例如表單輸入和動態顯示過濾結果。
	- 最後是資料庫，我**用 SQLite 來儲存和檢索財務資料**，SQLite 是使用上比較簡單的資料庫系統，所以我選擇使用 SQLite 來保存資料。這三個部分互相配合，完成記帳功能。

---

### 程式執行流程
- 這頁講解程式的執行流程。
	1. 使用者透過瀏覽器啟動應用程式，進入記帳頁面。
	2. 使用者在表單中輸入財務資料，例如品項、日期和金額，然後提交。
	3. Flask 會處理這些資料，存進 SQLite 資料庫。
	4. 使用者可以輸入過濾條件來分類並檢視特定資料，目前只有日期選擇。
	5. 最露程式會從資料庫檢索符合條件的資料，並按金額排序後顯示出來。
- **Demo**

---

### Class Diagram
1. Class BaseApp 
	- attribute : 
		- `app: Flask` - 用於建立 Flask app instance，提供基礎的框架功能。
	- method :
		- `__init__()` - 初始化 Flask ，設定 app 屬性，為後續 routing 和伺服器執行做準備。
		- `run()` - 啟動 Flask 伺服器。
2. •Class DataProcessor
	- method : 
		- `sort_by_amount` 接收財務資料清單，按金額（amount）欄位排序後回傳
3. class FinanceApp(BaseApp)
	- attribute :
		- •`processor: DataProcessor` - DataProcessor instance，在 `apply_filter` 中處理資料排序功能。
	- method :
		- •`__init__()` - 初始化，設定 DataProcessor instance，定義需要用到的 router，啟動伺服器
		- `_register_routes()` - private method，定義所有 router，這些 router 負責 app 的頁面顯示與功能 API ，包括首頁 (/), 儲存數據 (/save_data) 和過濾數據 (/apply_filter)。
		- **主要功能**
			- `DailyExpenseLog()` - 主畫面顯示
			- `save_data()` - 處理 /save_data 這個 router 的 POST 請求，使用 validate_form 裝飾器檢查每筆輸入資料是否為空，將表單數據存入資料庫。
			- apply_filter() - 處理 /apply_filter 這個 router 的 POST 請求，根據日期過濾財務資料，透過 processor 按金額排序後，回傳需要顯示的資料。
		- **staticmethod**
			- `validate_form(func)` - 作為 decorator ，檢查資料
			- `get_form_data()` - 取得使用者輸入資料
			- `save_to_database()` - 將資料儲存到 SQLite 資料庫，檢查重複並處理異常
			- check_duplicate(cur, item, date, inOut, category, amount) - 在`save_to_database()` 中檢查資料庫中是否有重複的財務記錄，避免重複插入。
			- `make_response(status, message=None)` - 生成並回傳 JSON ，顯示資料儲存狀態(成功或異常)

---

### Class 滿足的要求
- class 設計符合要求的部分

---

### 語法技巧滿足的要求
- try/except，處理資料庫可能的連線錯誤


