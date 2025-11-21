{%hackmd BJrTq20hE %}
<div style="font-size:28px; color:white; text-align:center">README</div>

## <font color="#8080c0">Done Parts</font>

- <font color = "c2e3f4">CGLine()</font>
- <font color = "c2e3f4">CGCircle()</font>
- <font color = "c2e3f4">CGEraser</font>
<br>
### <font color="#8080c0">CGLine()</font>
<pre style="background:#434141"><code>public void CGLine(float x1,float y1,float x2,float y2){
    float dx = abs(x2 - x1);
    float sx = x1 < x2 ? 1 : -1;
    float dy = -abs(y2 - y1);
    float sy = y1 < y2 ? 1 : -1;
    float error = dx + dy;
    while (true){
        drawPoint(x1, y1, color(0, 0, 0));
        if (x1 == x2 && y1 == y2) 
            break;
        float e2 = 2 * error;
        if (e2 >= dy){
            if (x1 == x2) break;
            error = error + dy;
            x1 = x1 + sx;
        }
        if (e2 <= dx){
            if (y1 == y2) break;
            error = error + dx;
            y1 = y1 + sy;
        }
    }
}</code>
</pre>
#### <font color = "efb730">Algorithm:</font>
##### Bresenham's principles of integer incremental error to perform all octant line draws
-  <pre style="background:#434141"><code>float sx = x1 < x2 ? 1 : -1;
   float sy = y1 < y2 ? 1 : -1;</code></pre>
    - x 和 y 每次改變只會加一或減一，根據 x1, x2(y1, y2) 的相對大小來決定加減
- <pre style="background:#434141">
  <code>if (e2 >= dy){
      if (x1 == x2) break;
      error = error + dy;
      x1 = x1 + sx;
  }
  if (e2 <= dx){
      if (y1 == y2) break;
      error = error + dx;
      y1 = y1 + sy;
  }</code></pre>
    - 用兩個 if 分別判斷 x 方向與 y 方向是否需要改變
- <pre style="background:#434141">
    <code>if (x1 == x2 && y1 == y2) break;
    if (x1 == x2) break;
    if (y1 == y2) break;</code></pre>
    - 當 x1=x2 或 y1=y2 時，代表畫線結束
- <pre style="background:#434141">
    <code>float dx = abs(x2 - x1);
    float dy = -abs(y2 - y1);
    float error = dx + dy;</code></pre>
    - dx 永遠為正， dy 永遠為負，error = dx + dy。當直線在 x 方向繪製時，演算法將 dx（為正）添加到 error 中；當直線在 y 方向繪製時，演算法將 dy（為負）添加到 error 中。
    - 例如直線 (0, 0) ：(5, 5)，error 的值將為零，e2 也將為零，使每個步驟的兩個 if 判斷都為 true。由於 dx 被添加，dy 被減去，因此兩個 if 語句將保持為真，直到 x0, y0 == x1, y1！
    - dx 和 dy 可以被視為直線的斜率的分子和分母。當 dx 比 dy 大 3 個單位時，它將每 1 dy 增加 3 次。
- <pre style="background:#434141">
    <code>float e2 = 2 * error;
    if (e2 >= dy){...}
    if (e2 <= dx){...}</code></pre>
    
    - e2 是下一步的計算。
    - 當演算法在 x 方向繪製時，error 將以正向增加，最終使 e2 大於 dx，這將阻止它在 x 方向繪製，即 if(e2 <= dx) 將變為假。同樣，當演算法在 y 方向繪製時，error 將以負向增加，最終使 e2 小於 dy，即 if(e2 >= dy) 將變為假。
    
<br>

### <font color="#8080c0">CGCircle()</font>

<pre style="background:#434141"><code>public void CGCircle(float x,float y,float r){
    float d = 5/4-r;
    float incE = 3;
    float incSE = -2 * r + 5;
    float xi = 0;
    float yi = r;
    drawPoint(x, y+r, color(0, 0, 0));
    drawPoint(x, y-r, color(0, 0, 0));
    drawPoint(x+r, y, color(0, 0, 0));
    drawPoint(x-r, y, color(0, 0, 0));
    while (xi < yi){
        if (d < 0){
            d += incE;
            incE += 2;
            incSE += 2;
        }else{
            d += incSE;
            incE += 2;
            incSE += 4;
            yi--;
        }
        xi++;
        drawPoint(x+xi, y+yi, color(0, 0, 0));
        drawPoint(x+yi, y+xi, color(0, 0, 0));
        drawPoint(x-yi, y+xi, color(0, 0, 0));
        drawPoint(x-xi, y+yi, color(0, 0, 0));
        drawPoint(x-xi, y-yi, color(0, 0, 0));
        drawPoint(x-yi, y-xi, color(0, 0, 0));
        drawPoint(x+yi, y-xi, color(0, 0, 0));
        drawPoint(x+xi, y-yi, color(0, 0, 0));
    }
}</code></pre>
#### <font color = "efb730">Algorithm:</font>
##### Midpoint circle drawing algorithm (taught during class)
- <pre style="background:#434141"><code>float d = 5/4-r;
  float incE = 3;
  float incSE = -2 * r + 5;</code></pre>
  - 上課公式推倒得到 d, incE, incSE 初始值
- <pre style="background:#434141"><code>float xi = 0;
  float yi = r;</code></pre>
  - 將畫圓起始點設於 (0, r)
- <pre style="background:#434141"><code>drawPoint(x, y+r, color(0, 0, 0));
  drawPoint(x, y-r, color(0, 0, 0));
  drawPoint(x+r, y, color(0, 0, 0));
  drawPoint(x-r, y, color(0, 0, 0));</code></pre>
  - 起始點著色
- <pre style="background:#434141"><code>while (xi < yi){
      if (d < 0){
          d += incE;
          incE += 2;
          incSE += 2;
      }else{
          d += incSE;
          incE += 2;
          incSE += 4;
          yi--;
      }
      xi++;</code></pre>
    - 根據公式推導決定 d, incE, incSE, yi, xi 的變化量
- <pre style="background:#434141"><code>drawPoint(x+xi, y+yi, color(0, 0, 0));
  drawPoint(x+yi, y+xi, color(0, 0, 0));
  drawPoint(x-yi, y+xi, color(0, 0, 0));
  drawPoint(x-xi, y+yi, color(0, 0, 0));
  drawPoint(x-xi, y-yi, color(0, 0, 0));
  drawPoint(x-yi, y-xi, color(0, 0, 0));
  drawPoint(x+yi, y-xi, color(0, 0, 0));
  drawPoint(x+xi, y-yi, color(0, 0, 0));</code></pre>
  - 依八項限畫圓，並將 xi, yi 值換算到以 (x, y) 為圓心的畫圓位置
<br>
### <font color="#8080c0">CGEarser()</font>
<pre style="background:#434141"><code>public void CGEraser(Vector3 p1,Vector3 p2){
    for (float x=p1.x; x<p2.x; x++){
        for (float y=p1.y; y<p2.y; y++){
            drawPoint(x, y, color(250));
        }
    }
}</code></pre>
#### <font color = "efb730">Algorithm:</font>
##### Using two for loop, drawPoint between the range of p1 and p2