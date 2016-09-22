package com.p24studio.cardgame.main.domain;

import haxe.ds.Vector;
import com.p24studio.cardgame.main.constants.Rules;

class Player { // TODO rename this Commander (Player in-game)
	var name:String;
	var healthPoints:Int;
    var hand:Vector<Card>;
    var deck(get, null):List<Card>;

	public function new(name:String = "NoName", healthPoints:Int) {
		this.name = name;
		this.healthPoints = healthPoints;
        hand = new Vector<Card>(Rules.maxCardsHand);
        deck = new List<Card>();
	}

    public function draw() {
        var card = deck.pop();
        // TODO: if hand is not full
        // TODO: get first available index
        hand[0] = card;
    }

    public function get_deck() {
        return deck;
    }

	public function toString() {
		return 'Player {name:$name, healthPoints:$healthPoints, hand:$hand, deck:$deck}';
	}
}
