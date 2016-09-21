package com.p24studio.cardgame.main.service;

using thx.promise.Promise;
import thx.Error;

import com.p24studio.cardgame.main.domain.CardType;

class CardTypeDAO {
  public static function addCardType(db, name:String, attack:Int, healthPoints:Int) {
    db.serialize(function() {
      var preparedQuery = db.prepare("INSERT INTO CardType(name, attack, healthPoints) VALUES (?,?,?)");
      preparedQuery.run(name, attack, healthPoints);
      preparedQuery.finalize();
    });
  }

  public static function findAll(db:Database) {
    return Promise.create(function (resolve: List<CardType> -> Void, reject: Error -> Void) {
      db.all("SELECT rowid AS id, name, attack, healthPoints FROM CardType", function(err, row:Array<Dynamic>) {
        if (err != null) {
          throw "error: CardTypeDAO.findAll()";
        }
        var cardTypes = new List<CardType>();
        for (element in row) {
          var ct = new CardType(element.name, element.attack, element.healthPoints);
          cardTypes.add(ct);
        }
        resolve(cardTypes);
      });
    });
  }
}
