var Sidebar = React.createClass({

  render: function() {
    return (
      <div className="sidebar">
        Filter by:
        <SidebarFilters filterItems={this.props.filterItems} />
      </div>
    );
  }
});
