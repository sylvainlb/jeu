Jeu.Views.FleetsIndex = Backbone.View.extend({
  initialize: function(){
    _.bindAll(this, "renderFleet");
    _.bindAll(this, "selectFleet");
  },
  renderFleet: function(model){
    var fleetView = new Jeu.Views.FleetView({model: model});
    fleetView.render();
    this.$el.append(fleetView.el);
  },
  render: function(){
    this.collection.each(this.renderFleet);
  },
  selectFleet: function(id){
    var fleetView = new Jeu.Views.FleetView({model: this.collection.get(id)});
    fleetView.selectFleet();
  }
});
