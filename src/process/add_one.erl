%% Author: steve
%% Created: Aug 20, 2012
%% Description: TODO: Add description to add_one
-module(add_one).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0, request/1, loop/0]).

%%
%% API Functions
%%
start() ->
	register(add_one, spawn_link(add_one, loop, [])).

request(Int) ->
	add_one ! {request, self(), Int},
	receive
		{result, Result} -> Result
		after 1000 -> timeout
	end.

loop() ->
	receive
		{request, Pid, Msg} ->
			Pid ! {result, Msg + 1}
	end,
	loop().




%%
%% Local Functions
%%

