%-define(G,16#8349/utf8). %unicode
%-define(M,16#6CE5/utf8).
%-define(H,16#9A6C/utf8).
-define(G, $a). %unicode
-define(M, $b).
-define(H, $c).

-define(PUSH,?G,?G).
-define(DUP, ?G,?H,?G).
-define(COPY,?G,?M,?G).
-define(SWAP,?G,?H,?M).
-define(POP, ?G,?H,?H).
-define(SLID,?G,?M,?H).

-define(ADD ,?M,?G,?G,?G).
-define(SUB ,?M,?G,?G,?M).
-define(MUL ,?M,?G,?G,?H).
-define(DIV ,?M,?G,?M,?G).
-define(MOD ,?M,?G,?M,?M).

-define(SET ,?M,?M,?G).
-define(LOAD,?M,?M,?M).

-define(DEF, ?H,?G,?G).
-define(CALL,?H,?G,?M).
-define(JMP, ?H,?G,?H).
-define(JZ,  ?H,?M,?G).
-define(JNZ, ?H,?M,?M).
-define(RET, ?H,?M,?H).
-define(EXIT,?H,?H,?H).
-define(EXIT2, $d, $d).
%-define(EXIT2,16#6CB3/utf8,16#87F9/utf8).

-define(IINT,?M,?H,?M,?M).
-define(OINT,?M,?H,?G,?M).
-define(ICHR,?M,?H,?M,?G).
-define(OCHR,?M,?H,?G,?G).
