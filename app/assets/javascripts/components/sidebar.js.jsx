var Sidebar = React.createClass({

  render: function() {
    var onFilterChange=this.props.onFilterChange;
    var filterProps = this.props.filterItems;
    var filterItems = Object.keys(filterProps).map(function(key, index){
      return <SidebarFilterItem filterName={key} filterOptions= {filterProps[key]}
        onFilterChange={onFilterChange} key={index}/>
    });
    return (
      <div className="sidebar">
        Filter by:
          <div className="sidebar-filters">
            <ul>
              {filterItems}
            </ul>
          </div>
      </div>
    );
  }
});

var SidebarFilterItem = React.createClass({
 handleFilterChange: function(event) {
   this.props.onFilterChange(event.target.id, event.target.value)
 },
render: function() {
  var labelName = this.props.filterName;
  var labelSlug = labelName.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');
  var selectOptions = this.props.filterOptions.map(function(key, index){
    return <option value={key} key={index}>{key}</option>
  });
  return (
    <div className="sidebar-filter-item">
      <li>
        <label htmlFor={labelSlug}>{labelName}</label>
          <select name={labelName} id={labelSlug} onChange={this.handleFilterChange}>
            <option value="All" key={selectOptions.length+1}>All</option>
            {selectOptions}
          </select>
        </li>
    </div>
    );
  }
});
