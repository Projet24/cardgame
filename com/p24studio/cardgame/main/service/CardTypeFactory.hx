package com.p24studio.cardgame.main.service;

import com.p24studio.cardgame.main.domain.CardType;

class CardTypeFactory {
  public static function addCardType(db, name:String, attack:Int, healthPoints:Int) {
    db.serialize(function() {
      var preparedQuery = db.prepare("INSERT INTO CardType(name, attack, healthPoints) VALUES (?,?,?)");
      preparedQuery.run(name, attack, healthPoints);
      preparedQuery.finalize();
    });
  }

  public static function findAll(db):List<CardType> {
    var cardTypes = new List<CardType>();
    db.serialize(function() {
      db.each("SELECT rowid AS id, name, attack, healthPoints FROM CardType", function(err, row) {
          var cardType = new CardType(row.name, row.attack, row.healthPoints);
          cardTypes.add(cardType);
      });
    });
    // TODO why cardTypes is null here?
    return cardTypes;
  }
}
