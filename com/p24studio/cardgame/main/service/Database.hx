package com.p24studio.cardgame.main.service;


@:jsRequire("sqlite3", "Database")
extern class Database {
    function new(file:String);
    function serialize(request:Void -> Void):Database;
    function run(request:Dynamic, ?params:List<String>):Database;
    function prepare(request:String):Dynamic;
    function each(statement:Dynamic, ?params:Dynamic, ?callback:Dynamic -> Dynamic -> Void, ?complete:Dynamic):Database;
    function all(statement:Dynamic, ?params:Dynamic, ?callback:Dynamic -> Array<Dynamic> -> Void):Database;
}
