package com.p24studio.cardgame.test;

import js.Node;
import js.node.Http;
import js.node.Path;
import js.npm.Express;
import js.npm.express.*;
import js.Node.console;

import com.p24studio.cardgame.main.domain.*;
import com.p24studio.cardgame.main.service.*;

import com.p24studio.cardgame.main.constants.Rules;

@:jsRequire("fs") // TODO: delete this. Replace it with the native haxe file lib
extern class FS {
    static function existsSync(path:String):Bool;
}

class NodeMain {
    private var PORT = 1337;

    function new() {
        var app = new js.npm.Express();
        var server = js.node.Http.createServer(cast app);
        var io = new js.npm.socketio.Server(server); // sockets
        var db = new Database("sqlite.db"); // TODO put the db name in config file

        demoDatabase(db);


        /** ROUTING */
        app.get('/', function (req, res) {
          res.sendfile(Node.__dirname + '/public/index.html');
        });

        /** SOCKETS */
        io.on('connection', function (socket) {
            socket.emit('message', { message: 'welcome to the chat' });
            socket.on('send', function (data) {
                io.sockets.emit('message', data);
            });
        });
        trace("Listening on port " + PORT);
        server.listen(PORT);
    }

    static public function main() {
        var main = new NodeMain();
    }

    static function demoDatabase(db:Database) {
      /** TEST DATABASE */
      var exists = FS.existsSync("sqlite.db"); // TODO put the db name in config file

      db.serialize(function() {
        if (!exists) {
          db.run("CREATE TABLE CardType (name TEXT, attack INTEGER, healthPoints INTEGER)");
        }
        CardTypeFactory.addCardType(db, "Pikeman", 3, 1);

        var cardTypes = CardTypeFactory.findAll(db);
        for (ct in cardTypes) {
          trace (ct);
        }
      });
    }
}
