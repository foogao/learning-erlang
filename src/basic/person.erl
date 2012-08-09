%% Author: steve
%% Created: Aug 6, 2012
%% Description: TODO: Add description to person
-module(person).
-author("Steve Gao").

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([new/2]).

%%
%% API Functions
%%
-record(person, {name, age}).

new(Name, Age) ->
	#person{name=Name, age=Age}.




%%
%% Local Functions
%%

