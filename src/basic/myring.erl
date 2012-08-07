%% Author: steve
%% Created: Aug 6, 2012
%% Description: TODO: Add description to myring
-module(myring).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/1, start_proc/2]).

%%
%% API Functions
%%
start(Num) ->
	start_proc(Num, self()).

start_proc(0, Pid) -> 
	Pid ! ok;

start_proc(Num, Pid) ->
	NPid = spawn(?MODULE, start_proc, [Num-1, Pid]),
	NPid ! ok,
	receive ok -> ok end.


%%
%% Local Functions
%%

