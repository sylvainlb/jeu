Jeu.Views.ZonesIndex = Backbone.View.extend({
  initialize: function(){
    _.bindAll(this, "renderZone");
  },
  renderZone: function(model){
    var zoneView = new Jeu.Views.ZoneView({model: model});
    zoneView.render();
    $(this.el).append(zoneView.el);
  },
  render: function(){
    this.collection.each(this.renderZone);
  }
});
