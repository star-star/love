-module(love_loader).

-export([open/1]).

-include_lib("kernel/include/file.hrl").


-record(output, {token = false,
                 abf   = false 
        }).

open(Filename) ->
    {ok, IoDevice} = file:open(Filename, [read, {encoding, utf8}]),
    {ok, FileInfo = #file_info{size = Size}} = file:read_file_info(Filename),
    io:format("~p~n", [FileInfo]),
    {ok, Content} = file:read(IoDevice, Size),
    scan(Content, #output{token = true}).


scan(Content, #output{token = TokenOutput}) ->
    {ok, Tokens, _} = love_scan:string(Content),
    TokenOutput =:= true andalso lager:info("~p", [Tokens]).
    

