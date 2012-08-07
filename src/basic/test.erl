%% Author: steve
%% Created: Jul 26, 2012
%% Description: TODO: Add description to Test
-module(test).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([say/0, help/0, format_error/1, area/1, factorial/1, listlen/1, index/1]).

%%
%% API Functions
%%

%%
%% TODO: add description say/function_arity
%%
say() ->
	io:format("Hello, World\n").

%%
%% TODO: add description help/function_arity
%%
help() ->
	io:format("Help!\n").

%%
%%
%%
format_error(closed) ->
	"Connection closed!";
format_error(canceled) ->
	"Connection canceled!".

%%
%% Calculate the area of shapes
%%
area({square, Slide}) ->
	Slide * Slide;
area({circle, Radius}) ->
	math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
	S = (A + B + C) / 2,
	math:sqrt(S*(S-A)*(S-B)*(S-C));
area(Other) ->
	{error, invalid_object}.

%%
%% 
%%
%%factorial(0) ->
%%	1;
%%factorial(N) ->
%%	N * factorial(N-1).
factorial(N) ->
	case N of 
		0 -> 1;
		N -> N * factorial(N-1)
	end.

%%
%%
%%
listlen(Y) ->
	case Y of
	  [] -> 0;
      [_|Xs] -> 1+listlen(Xs)
	end.

%%
%%
%%
index(X, Y) ->
	index({X, Y}).

%%
%%
%%
index(Z) ->
	case Z of
		{0, [X|_]}  -> X;
		{N, [_|Xs]} when N>0 ->index(N-1, Xs)
	end.



%%
%% Local Functions
%%


