part of data;

List<Car> getCars({int count: -1}) {
  if (count < 0) {
    return _cars;
  }
  
  return _cars.take(count).toList(growable: false);
}

List<Player> getPlayers() {
  return _players;
}

List<String> getPlayerNames() {
  return _players.map((Player player) => player.name)
                 .toList(growable: false);
}