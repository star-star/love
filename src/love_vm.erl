-module(love_vm).

-include("love_ope.hrl").

-export([new/0,
         run/1,
         c/1]).

-record(vm, {stack,
             heap,
             ip,
             code}).


c(Filename)->
        {ok,Data} = file:read_file(Filename),
        {ok, #vm{stack = [],
                 heap  = [],
                 code  = Data}}.

new() ->
    {ok, #vm{stack = [],
             heap  = []}}.

run(#vm{code = Code}) ->
    run_ope(Code).

run_ope(<<?PUSH, Rest/binary>>) ->
    {ok, Num, Rest2} = compile_number(Rest),
    lager:info("push ~p", [Num]),
    run_ope(Rest2);
    

run_ope(<<?EXIT2, _Rest/binary>>) ->
    lager:info("exit");

run_ope(Code) ->
    lager:info("unknown code:", [Code]).



compile_number(<<?G,D/binary>>)->compile_binary(D, 0);
compile_number(<<?M,D/binary>>)->compile_binary(D, 0)*-1;
compile_number(_)->{error,not_binary}.

compile_lable(D)->compile_binary(D, 0).

compile_binary(<<?G,Rest/binary>>,Acc)->
        compile_binary(Rest,Acc bsl 1);
compile_binary(<<?M,Rest/binary>>,Acc)->
        compile_binary(Rest,(Acc bsl 1)+1);
compile_binary(<<?H,Rest/binary>>,Acc)->
        {ok,Acc,Rest};
compile_binary(<<_/utf8,Rest/binary>>,Acc)->
        compile_binary(Rest,Acc).

