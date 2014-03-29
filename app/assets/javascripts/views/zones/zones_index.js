Jeu.Views.ZonesIndex = Backbone.View.extend({
  template: JST['zones/index'],
  render: function() {
    console.log(this.model.toJSON());
    $(this.$el).html(this.template(this.model.toJSON()));
  }
});
