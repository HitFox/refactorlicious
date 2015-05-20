var ExercisesPanel = React.createClass({

  getInitialState: function () {
  return {exercises: [], selected_status: "All", selected_category: "All" } ;
  },
  componentDidMount: function () {
    this.setState({exercises:this.props.exercises});
  },
  handleFilterChange: function(filterName, filterValue) {
    switch(filterName) {
      case "status":
        this.setState({selected_status: filterValue});
        break;
      case "category":
        this.setState({selected_category: filterValue});
        break;
    }
  },
  render: function() {
    return (
      <div className="exercises-panel">
        <Sidebar onFilterChange={this.handleFilterChange} filterItems={this.props.filterItems}/>
        <ExerciseList exercises={this.state.exercises} selected_status={this.state.selected_status}
          selected_category={this.state.selected_category} iconsPath={this.props.iconsPath}/>
      </div>
    );
  }
});
