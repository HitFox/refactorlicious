var SidebarFilters = React.createClass({

  render: function() {
    var filterItems = this.props.filterItems.map(function(filterItem){
          return <SidebarFilterItem filterItem={filterItem} />
        })

    return (
      <div className="sidebar-filters">
        <ul>
          {filterItems}
        </ul>
      </div>
    );
  }
});
