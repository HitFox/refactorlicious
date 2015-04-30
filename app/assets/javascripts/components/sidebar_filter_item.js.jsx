var SidebarFilterItem = React.createClass({
  propTypes: {
    filterItem: React.PropTypes.object
  },

  render: function() {
    var labelName = this.props.filterItem.labelName
    var selectOptions = this.props.filterItem.options.map(function(option){
      return <option value={option} id={labelName.toLowerCase()}>{option}</option>
    })

    return (
      <div className="sidebar-filter-item">
        <li>
          <label for={labelName.toLowerCase()}>{labelName}</label>
          <select>
            {selectOptions}
          </select>
        </li>
      </div>
    );
  }
});
