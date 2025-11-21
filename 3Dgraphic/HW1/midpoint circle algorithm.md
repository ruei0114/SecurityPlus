```java
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
```

[Computer Graphics Midpoint Circle Algorithm - javatpoint](https://www.javatpoint.com/computer-graphics-midpoint-circle-algorithm)