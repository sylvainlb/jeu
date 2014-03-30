window.Jeu = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.region = new this.Models.Region();
    this.region.set({zones: new this.Collections.Zones()});
    this.region.get("zones").fetch({
      success:function(){
        var view = new Jeu.Views.ZonesIndex({collection: Jeu.region.get("zones"), el: $("#map")});
        view.render();
      }
    });
  }
};

$(document).ready(function(){
  Jeu.initialize();
});
