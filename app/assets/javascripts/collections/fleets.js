Jeu.Collections.Fleets = Backbone.Collection.extend({
  model: Jeu.Models.Fleet,
  url: Jeu.base_url+"/fleets",
});
