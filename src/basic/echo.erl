%% Author: steve
%% Created: Aug 4, 2012
%% Description: TODO: Add description to echo
-module(echo).


%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([go/0, loop/0]).

%%
%% API Functions
%%

go() ->
	register(echo, spawn(echo, loop, [])),
	echo ! {self(), hello},
	receive
		{_Pid, Msg} -> 
			io:format("~w~n", [Msg])
	end,
	echo ! stop.

loop() ->
	receive
		{From, Msg} ->
			From ! {self(), Msg},
			loop();
		stop ->
			true
	end.


%%
%% Local Functions
%%

