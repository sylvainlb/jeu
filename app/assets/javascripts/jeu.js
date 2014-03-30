window.Jeu = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  fetchZones: function() {
    this.region.set({zones: new this.Collections.Zones()});
    this.region.get("zones").fetch({
      success:function(){
        Jeu.region.set({view: new Jeu.Views.ZonesIndex({
          collection: Jeu.region.get("zones"), 
          el: $("#map")
        })});
        Jeu.region.get("view").render();
      }
    });
  },
  fetchFleets: function() {
    this.region.set({fleets: new this.Collections.Fleets()});
    this.region.get("fleets").fetch();
  },
  
  initialize: function() {
    this.region = new this.Models.Region();
    this.fetchZones();
    this.fetchFleets();
    new this.Routers.Zones;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Jeu.initialize();
});
