%% Author: steve
%% Created: Aug 12, 2012
%% Description: TODO: Add description to frequency
-module(frequency).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0, stop/0, allocate/0, deallocate/1]).

%%
%% API Functions
%%
start() ->
	register(frequency, spawn(frequency, init, [])).

init() ->
	Frequencies = {get_frequencies(), []},
	loop(Frequencies).

stop() ->
	call(stop).

allocate() ->
	call(allocate).

deallocate() ->
	call(deallocate).
%%
%% Local Functions
%%
get_frequencies() -> 
	[10, 11, 12, 13, 14, 15].

call(Message) ->
	frequency ! {request, self(), Message},
	receive
		{replay, Reply} -> Reply
	end.

loop(Frequencies) ->
	receive
		{request, Pid, allocate} ->
			{NewFrequencies, Reply} = allocate(Frequencies, Pid),
			reply(Pid, Reply),
			loop(Frequencies);
		{request, Pid, {deallocate, Freq}} ->
			NewFequencies = deallocate(Frequencies, Freq),
			reply(Pid, ok),
			loop(NewFrequencies);
		{request, Pid, stop} ->
			reply(Pid, ok)
	end.

reply(Pid, Reply) ->
	Pid ! {reply, Reply}.
