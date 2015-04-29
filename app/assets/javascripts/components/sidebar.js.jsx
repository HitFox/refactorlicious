var Sidebar = React.createClass({
  getInitialState: function(){
    return { filters: ['Category', 'Status'],
             exerciseCategoryNames: this.props.exerciseCategoryNames }
  },

  render: function() {
    return (
      <div className="sidebar">
        Filter by:
        <SidebarFilters filters={this.state.filters} exerciseCategoryNames={this.state.exerciseCategoryNames} />
      </div>
    );
  }
});
