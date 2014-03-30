Jeu.Views.FleetsIndex = Backbone.View.extend({

  template: JST['fleets/index'],

  selectFleet: function(id){
    var fleetView = new Jeu.Views.FleetView({model: this.collection.get(id)});
    fleetView.selectFleet();
  }
});
