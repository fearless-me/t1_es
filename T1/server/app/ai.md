
## UML diagrams

You can render UML diagrams using [Mermaid](https://mermaidjs.github.io/). For example, this will produce a sequence diagram:

```mermaid
sequenceDiagram
Alice ->> Bob: Hello Bob, how are you?
Bob-->>John: How about you John?
Bob--x Alice: I am good thanks!
Bob-x John: I am good thanks!
Note right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

Bob-->Alice: Checking with John...
Alice->John: Yes... John, how are you?
```

And this will produce a flow chart:

```mermaid

graph LR

A[Square Rect] -- Link text --> B((Circle))
A --> C(Round Rect)
B --> D{Rhombus}
C --> D


```

```mermaid

graph LR

A[空闲] 
B[攻击]
C[追击] 
D[逃跑]

PA[被动] 
AC[主动]
BA[炮塔]
LA[逃跑]

A -- 检测到有目标或者被攻击 --> B
B -- 目标死亡等脱战的时候 --> A
B -- 进入攻击状态发现攻击距离不够 --> C
B -- 某些怪物发现打不过的时候或者其他情况 --> D
C -- 追击目标处于攻击范围内 --> B
D -- 跑到出生点附近 --> A

PA --> A
AC --> A
BA --> A
LA --> A




```
