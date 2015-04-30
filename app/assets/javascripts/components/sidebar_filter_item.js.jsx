var SidebarFilterItem = React.createClass({
  propTypes: {
    filterItem: React.PropTypes.object
  },

  render: function() {
    var labelName = this.props.filterItem.labelName;
    var labelSlug = labelName.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');
    var selectOptions = this.props.filterItem.options.map(function(option){
      return <option value={option}>{option}</option>
    });

    return (
      <div className="sidebar-filter-item">
        <li>
          <label htmlFor={labelSlug}>{labelName}</label>
          <select id={labelSlug}>
            {selectOptions}
          </select>
        </li>
      </div>
    );
  }
});
