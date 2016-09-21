package com.p24studio.cardgame.main.service;

@:jsRequire("sqlite3", "Database")
extern class Database { //TODO replace Dynamic types with the right types
    function new(file:String);
    function serialize(request:Dynamic):Dynamic;
    function run(request:Dynamic):Database;
    function prepare(request:Dynamic):Dynamic;
    function each(statement:Dynamic, ?params: Dynamic, ?callback:Dynamic -> Dynamic -> Void, ?complete:Dynamic):Database;
    function all(statement:Dynamic, ?params: Dynamic, ?callback:Dynamic -> Array<Dynamic> -> Void):Database;
}
