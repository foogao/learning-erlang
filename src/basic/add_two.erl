%% Author: steve
%% Created: Aug 4, 2012
%% Description: TODO: Add description to add_two
%% Demostrate the messages send/receive 
%%
-module(add_two).

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
	process_flag(trap_exit, true).

request(Int) ->
	add_two ! {request, self(), Int},
	receive
		{result, Result} -> Result;
		{'EXIT', _, _} -> "Error in loop()"
	after 1000 ->
			timeout
	end.

loop() -> 
	receive
		{request, Pid, Msg} ->
			Pid ! {result, Msg + 2}
	end,
	loop().


%%
%% Local Functions
%%

