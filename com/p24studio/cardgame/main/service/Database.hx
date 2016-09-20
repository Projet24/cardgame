package com.p24studio.cardgame.main.service;

@:jsRequire("sqlite3", "Database")
extern class Database { //TODO replace Dynamic types with the right types
    function new(file:String);
    function serialize(request:Dynamic):Dynamic;
    function run(request:Dynamic):Dynamic;
    function prepare(request:Dynamic):Dynamic;
    function each(request:Dynamic, action:Dynamic):Dynamic;
}
