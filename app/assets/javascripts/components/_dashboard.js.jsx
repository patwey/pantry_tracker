var Dashboard = React.createClass({
  getInitialState: function() {
    return {
            user: {name: 'Pat'},
            userIngredients: [{id: 1, name: 'Pepper', units: 'Whole Peppers'},
                              {id: 2, name: 'Banana', units: 'Whole Bananas'}]
           }
  },

  createIngredient: function(ingredient) {
    return <li key={ingredient.id}>{ingredient.name} (<em>{ingredient.units}</em>)</li>;
  },

  render: function() {
    return (
      <div>
        <h1>Hello, {this.state.user.name}</h1>
        <ul>{this.state.userIngredients.map(this.createIngredient)}</ul>
      </div>
    )
  }
});
