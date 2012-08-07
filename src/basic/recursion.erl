%% Author: steve
%% Created: Jul 31, 2012
%% Description: TODO: Add description to recursion
-module(recursion).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([bump/1, sum/1, len/1, average/1, even/1, member/2]).

%%
%% API Functions
%%

%%
%% The following functions demostrated the tail-recursion.
%%
bump([]) ->[];
bump([Head|Tail]) -> [Head+1|bump(Tail)].

sum([]) -> 0;
sum([Head|Tail]) -> Head + sum(Tail).

len([]) -> 0;
len([_|Tail]) -> 1 + len(Tail).

average(List) -> sum(List)/len(List).

even([]) -> [];
even([Head|Tail]) when Head rem 2 ==0 -> [Head | even(Tail)];
even([_|Tail]) -> even(Tail).

member(_, []) -> false;
member(H, [H|_]) -> true;
member(H, [_|T]) -> member(H, T).


%%
%% Local Functions
%%

