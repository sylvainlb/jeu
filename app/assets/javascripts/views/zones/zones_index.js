Jeu.Views.ZonesIndex = Backbone.View.extend({
  template: JST['zones/index'],
  events: {"click .zone" : "selectZone"},
  selectZone: function(event) {console.log(this.model.id)},
  render: function() {
    alert();
    this.$el.append($(this.template(this.model.toJSON())));
  }
});
