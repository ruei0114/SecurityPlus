```cpp
#include <iostream>  
#include <queue>  
#include <unordered_map>  
#include <string>  
using namespace std;  
  
class TreeNode{  
public:  
    string data;  
    TreeNode* left;  
    TreeNode* right;  
    TreeNode(string data, TreeNode* left, TreeNode* right){  
        this->data = data;  
        this->left = left;  
        this->right = right;  
    }  
};  
  
class Tree{  
private:  
    TreeNode* root;  
    unordered_map<string, string> m;  
    int counter;  
    int cntCpy;  
public:  
    Tree(TreeNode* root, unordered_map<string, string> m, int counter){  
        this->root = root;  
        this->m = m;  
        this->counter = counter;  
        this->cntCpy = counter;  
    }  
  
    TreeNode* createTree(string route){  
        if (!m.count(route))  
            return nullptr;  
        else{  
            counter--;  //計算node數量，與map size不同表示有node接不上 -> 建不起樹(not complete)  
            root = new TreeNode(m[route], createTree(route + "L"), createTree(route + "R"));  
            return root;  
        }  
    }  
  
    bool isComplete(){  
        if (counter != 0){  
            cout << "not complete\n";  
            return false;        }  
        return true;  
    }  
  
    queue<TreeNode*> q;  
    void levelOrder() {  
        if(root)  
            q.push(root);  
        while(!q.empty()){  
            int Size = q.size();  
            for (int i=0; i<Size; i++){  
                TreeNode* Node = q.front();  
                if(Node->left)  
                    q.push(Node->left);  
                if(Node->right)  
                    q.push(Node->right);  
                if (cntCpy == 1)  
                    cout << Node->data;  
                else                    cout << Node->data << " ";  
                cntCpy--;  
                q.pop();  
            }  
        }  
        cout << endl;  
    }  
};  
  
unordered_map<string, string> m;  
bool complete = true;  
  
int main(){  
    int cnt;  
    cin >> cnt; //幾筆測資  
    for (int i=0; i<cnt; i++){  
        m.clear();  
        string str="";  
        while (cin >> str and str != "()"){ //輸入測資 遇到()結束  
            string value = str.substr(1, str.find(',')-1);  //分割字串  
            string route = str.substr(str.find(',')+1, str.find(')')-str.find(',')-1);  //分割字串  
            if (m.count(route)) //路徑重複 => not complete                complete = false;  
            else                m.insert({route, value});  
        }  
        if (!complete)  
            cout << "not complete\n";  
        else{  
            TreeNode* root = nullptr;  //tree root  
            Tree tree(root, m, m.size());   //(root, map, mapsize)  
            tree.createTree("");  
            if(complete and tree.isComplete()){  
                tree.levelOrder();  
            }  
        }  
    }  
}
```

---

## Trees on the level

樹狀結構在電腦科學的許多領域中都相當重要。本問題牽涉到建立樹及走訪樹。

給你一二元樹，你的任務是寫一個程式來列印依「階層（level-order）」走訪的結果。在本問題中，二元樹的每個節點含有一個正整數，並且節點的數目最少1個，最多256個。

在「階層」走訪中，依階層從低到高，同階層從左到右的次序來列印。例如以下的二元樹階層走訪的結果為：5, 4, 8, 11, 13, 4, 7, 2, 1

![[tree-modified.png]]

在本問題中，二元樹以節點來表示。每個節點以一對(n,s)來表示。n代表此節點的值，s為一字串，代表從根節點到達此節點的路徑。其中L代表往左，R代表往右。所以在上方的圖中內容為13的節點其表示法為(13,RL)，而內容為2的節點其表示法為(2,LLR)，而根節點為(5,)。

Input

輸入含有多組測試資料。每組測試資料為若干節點的集合。各節點間以white space（包含空白、換列等字元）分隔。注意：在各節點內（也就是左刮號到又刮號之間）不會有white space。當遇到一()的節點，代表該組測試資料結束。請參考Sample Input。

Output

對每一組測試資料，如果輸入的節點可以正常的構成一二元樹的話，請輸出按「階層」走訪的結果。如果輸入的節點無法正常的構成一二元樹的話，也就是說有某些該有的節點沒有給，或重複給（同一路徑有2個節點），請輸出not complete。請參考Sample Output。

Sample Input

3

(11,LL) (7,LLL) (8,R) (5,) (4,L) (13,RL) (2,LLR) (1,RRR) (4,RR) ()

(3,L) (4,R) ()

(11,LL) (7,LLL) (2,LLL) (8,R) (5,) (4,L) (13,RL) (2,LLR) (1,RRR) (4,RR) ()

Sample Output

5 4 8 11 13 4 7 2 1

not complete

not complete

HINT:簡單的說就是根據讀入的INPUT建TREE，如果無法根據讀入的資料建出完整的TREE則輸出not complete，如果可以建出完整的TREE則將該TREE以level-order的方式走訪並輸出節點上的值