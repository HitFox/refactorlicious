var SidebarFilters = React.createClass({

  render: function() {
    var exerciseCategoryNames = this.props.exerciseCategoryNames;
    var filters = this.props.filters.map(function(filter){
          return <SidebarFilterItem filterItem={filter} exerciseCategoryNames={exerciseCategoryNames} />
        })

    return (
      <div className="sidebar-filters">
        <ul>
          {filters}
        </ul>
      </div>
    );
  }
});
