var SidebarFilterItem = React.createClass({

  render: function() {
    var exerciseCategoryNames = this.props.exerciseCategoryNames.map(function(exerciseCategoryName){
      return <option value={exerciseCategoryName}>{exerciseCategoryName}</option>
    })

    return (
      <div className="sidebar-filter-item">
        <li>
          {this.props.filterItem}
          <select>
            {exerciseCategoryNames}
          </select>
        </li>
      </div>
    );
  }
});
