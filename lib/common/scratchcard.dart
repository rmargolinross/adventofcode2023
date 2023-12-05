class ScratchCard {
  final int gameNumber;
  final List<int> winningNumbers;
  final List<int> numbersHave;

  ScratchCard(this.winningNumbers, this.numbersHave, this.gameNumber);

  ScratchCard.fromCard(String card)
      : gameNumber = int.parse(card.split(':')[0].split(' ').last),
        winningNumbers = card
            .split(':')[1]
            .split('|')[0]
            .trim()
            .split(' ')
            .where((e) => e.isNotEmpty)
            .map((e) => int.parse(e))
            .toList(),
        numbersHave = card
            .split(':')[1]
            .split('|')[1]
            .trim()
            .split(' ')
            .where((e) => e.isNotEmpty)
            .map((e) => int.parse(e))
            .toList();

  int getCardPoints() {
    var pointsTotal = 0;
    for (var number in numbersHave) {
      if (winningNumbers.contains(number)) {
        if (pointsTotal == 0) {
          pointsTotal = 1;
        } else {
          pointsTotal += pointsTotal;
        }
      }
    }

    return pointsTotal;
  }

  int getWins() {
    var wins = 0;
    for (var number in numbersHave) {
      if (winningNumbers.contains(number)) {
        wins++;
      }
    }

    return wins;
  }
}

class ScratchCards {
  final List<ScratchCard> cards;

  ScratchCards(this.cards);
  ScratchCards.fromString(String input)
      : cards = input.split('\n').map((e) => ScratchCard.fromCard(e)).toList();

  int playGame() {
    // Fill the initial list
    List<ScratchCard> generatedCards = [];
    for (var card in cards) {
      generatedCards.add(card);
    }

    // Now loop through the list until you hit the end
    var currentLocation = 0;
    while (currentLocation < generatedCards.length) {
      // Play card
      var currentCard = generatedCards[currentLocation];
      for (int i = currentCard.gameNumber;
          i < currentCard.gameNumber + currentCard.getWins();
          i++) {
        // Add a card for each win
        generatedCards.add(cards[i]);
      }

      currentLocation++;
    }

    return generatedCards.length;
  }
}
