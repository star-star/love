Definitions.

T1 = a
T2 = b
T3 = c
T4 = d
WS  = ([\000-\s]|#.*)

Rules.

{T1}   : {token,{list_to_atom(TokenChars),TokenLine}}.
{T2}   : {token,{list_to_atom(TokenChars),TokenLine}}.
{T3}   : {token,{list_to_atom(TokenChars),TokenLine}}.
{T4}   : {token,{list_to_atom(TokenChars),TokenLine}}.
{WS}+  : skip_token.

Erlang code.

