```java
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
            if (x1 == x2) 
                break;
            error = error + dy;
            x1 = x1 + sx;
        }
        if (e2 <= dx){
            if (y1 == y2) break;
            error = error + dx;
            y1 = y1 + sy;
        }
    }
```
[Bresenham's line algorithm - Wikipedia](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm)
[mathematics - Can you explain to me the Bresenham's line algorithm in simple terms? - Computer Graphics Stack Exchange](https://computergraphics.stackexchange.com/questions/13187/can-you-explain-to-me-the-bresenhams-line-algorithm-in-simple-terms)