### Bug 1
![[Pasted image 20250302155525.png]]
1. Bug 位置
	- SelectMode.cs
	- multiple select 時，未完全在選取範圍內的 object 會在判定錯誤的狀況下被選取到
2. Solution
	- 184 行`Point p2 = new Point(selectedArea.X + selectedArea.Width, selectedArea.X + selectedArea.Height);` 修改為 `Point p2 = new Point(selectedArea.X + selectedArea.Width, selectedArea.Y + selectedArea.Height);`
---
### Bug2
![[Pasted image 20250302165456.png]]
1. Bug 位置
	- CompositionObject.cs
	- composite object 被拖曳移動時，只有 group 的選取框移動， group 內的物件沒有跟隨移動
2. Solution
	- 在 CompositionObject.cs 中新增並 override `Move` method
---
### Bug3
![[Pasted image 20250302171518.png]]
1. Bug 位置
	- Shape.cs
	- combination line 進行 delete 時程式會 crach ，且無法刪除
2. Solution
	- 在 Shape.cs 中發現 `DestroyAllCombinations` 會進入無窮迴圈
	- 加上 `Combinations.RemoveAt(0);` 讓 `Combinations.Count` 能順利減少