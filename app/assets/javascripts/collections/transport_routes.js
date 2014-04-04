Jeu.Collections.TransportRoutes = Backbone.Collection.extend({
  model: Jeu.Models.TransportRoute,
  url: Jeu.base_url+"/transport_routes"
});
